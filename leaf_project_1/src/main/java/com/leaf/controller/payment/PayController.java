package com.leaf.controller.payment;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.Socket;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.leaf.model.member.MemberDAO;
import com.leaf.model.member.MemberDTO;
import com.leaf.model.payment.PaymentDAO;
import com.leaf.model.payment.PaymentDTO;

import sun.misc.BASE64Encoder;

@Controller
public class PayController {

	@Autowired
	PaymentDAO paymentDAO;

	@Autowired
	MemberDAO memberDAO;

	private Logger logger = LoggerFactory.getLogger(getClass());

	private static String URL_PAYPAL_VALIDATE;// PDT데이터를 페이팔로 보낼 주소

	private static final String PARAM_TX = "tx";
	private static final String PARAM_CMD = "cmd";
	private static final String PARAM_CMD_VALUE = "_notify-synch";
	private static final String PARAM_AT = "at";
	private static String PARAM_AT_VALUE;

	private static final String RESPONSE_SUCCESS = "SUCCESS";
	private static final String RESPONSE_FAIL = "FAIL";

	static {
		URL_PAYPAL_VALIDATE = "https://www.sandbox.paypal.com/cgi-bin/webscr";
		PARAM_AT_VALUE = "jfH36DSoPq7eOOt0zLok0pmHKxLO1A4uGwl0iddeiWFFKBISxsgCRJyVbva";
	}

	private static final String PARAM_ITEM_NAME = "item_name"; // 상품이름
	private static final String PARAM_ITEM_NUMBER = "item_number"; // 상품번호
	private static final String PARAM_ADDRESS_STREET = "address_street";
	private static final String PARAM_PAYMENT_STATUS = "payment_status"; // 결제 상태
	private static final String PARAM_MC_GROSS = "mc_gross"; // 페이팔 결제금액
	private static final String PARAM_MC_FEE = "mc_fee"; // 페이팔 수수료금액
	private static final String PARAM_MC_CURRENCY = "mc_currency"; // 화폐
	private static final String PARAM_TXN_ID = "txn_id"; // 거래번호
	private static final String PARAM_RECEIVER_EMAIL = "receiver_email"; // 페이팔 판매자계정 이메일
	private static final String PARAM_PAYER_EMAIL = "payer_email"; // 페이팔 구매자계정 이메일
	private static final String PARAM_CUSTOM = "custom"; // 상점회원번호

	@RequestMapping("payment.do")
	public ModelAndView payMent(PaymentDTO dto) {
		paymentDAO.insertPaymentData(dto);
		int payNum = paymentDAO.selectMaxRow();
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("payNum", payNum);
		mav.setViewName("moon.payment");
		return mav;
	}

	/* 페이팔 결제 PDT정보 핸들링 */
	@RequestMapping("payDataReceive.do")
	public void handleRequestPDT(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 페이팔로부터 온 파라미터를 표시한다.
		Enumeration en = request.getParameterNames();
		String readString = "";
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String paramValue = request.getParameter(paramName);
			readString = readString + "&" + paramName + "=" + URLDecoder.decode(paramValue, "UTF-8");
		}
		logger.info("Received PDT from PayPal : " + readString);

		// 다시 PayPal로 게시하기 위해 파라미터를 구성한다.
		String str = PARAM_CMD + "=" + PARAM_CMD_VALUE;
		en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String paramValue = request.getParameter(paramName);
			str = str + "&" + paramName + "=" + URLEncoder.encode(paramValue, "UTF-8");
		}
		str = str + "&" + PARAM_AT + "=" + PARAM_AT_VALUE;
		logger.info("Sending PDT to PayPal : " + str);

		// 유효성 검사를 하기위해 PayPal로 다시 전송시작.
		URL u = new URL(URL_PAYPAL_VALIDATE);
		HttpURLConnection uc = (HttpURLConnection) u.openConnection();
		uc.setDoOutput(true);
		uc.setRequestProperty("Content-type", "application/x-www-form-urlencoded");
		PrintWriter pw = new PrintWriter(uc.getOutputStream());
		pw.println(str);
		pw.close();

		BufferedReader in = new BufferedReader(new InputStreamReader(uc.getInputStream()));
		String res = in.readLine();

		if (res.equals(RESPONSE_SUCCESS)) {

			logger.info("페이팔 서버로부터 PDT유효성 요청이 성공했습니다.");
			String[] temp;
			HashMap vars = new HashMap();
			while ((res = in.readLine()) != null) {
				temp = res.split("=");
				if (temp.length == 2) {
					vars.put(temp[0], URLDecoder.decode(temp[1], "euc-kr"));
				} else {
					vars.put(temp[0], "");
				}
			}

			String itemName = (String) vars.get(PARAM_ITEM_NAME);
			int itemNumber = Integer.parseInt((String) vars.get(PARAM_ITEM_NUMBER));
			String paymentStatus = (String) vars.get(PARAM_PAYMENT_STATUS);
			double paymentAmount = Double.parseDouble((String) vars.get(PARAM_MC_GROSS));
			double paymentFee = Double.parseDouble((String) vars.get(PARAM_MC_FEE));
			String paymentCurrency = (String) vars.get(PARAM_MC_CURRENCY);
			String txnId = (String) vars.get(PARAM_TXN_ID);
			String receiverEmail = (String) vars.get(PARAM_RECEIVER_EMAIL);
			String payerEmail = (String) vars.get(PARAM_PAYER_EMAIL);

			/* DB작업 및 응답페이지 호출 의 작업을 하는곳 */
			String paychkStr = "";
			int paychkInt;
			String itemname = request.getParameter("item_name");
			String price = request.getParameter("amt");
			String itemnumber = request.getParameter("item_number");
			if (request.getParameter("st").equals("Completed")) {
				paychkStr = "결제완료";
				paychkInt = 1;
			} else {
				paychkStr = "결제 실패 - 관리자에게 문의하세요";
				paychkInt = 0;
			}
			String paySubject = "Leaf-Academy 결제 내역입니다.";
			String text = "결제하신 내역은 > \n" + "상품 이름 : " + itemname + "\n 상품가격 : " + request.getParameter("amt")
					+ "\n 결제 여부 : " + paychkStr;
			String send_email = paymentDAO.selectEmailAddress(Integer.parseInt(itemnumber));
			/* 결제확인 이메일 전송 */
			memberDAO.send(paySubject, text, "seirin8534@gmail.com", send_email);
			/* 결제확인 문자 전송 */
			
			/* 구매 완료 체크 */
			paymentDAO.updatePayChk(Integer.parseInt(itemnumber));
			
			/*미구매 체크*/
			paymentDAO.deletePayData(Integer.parseInt(itemnumber));
			
			/*완료후 페이지*/
			response.sendRedirect("main.do");

		} else if (res.equals(RESPONSE_FAIL)) {
			logger.warn("페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태 : " + res);
		} else {
			logger.error("페이팔서버로 부터 PDT유효성 요청이 실패했습니다. 상태 : " + res);
		}

	}

	public static String nullcheck(String str, String Defaultvalue) throws Exception {
		String ReturnDefault = "";
		if (str == null) {
			ReturnDefault = Defaultvalue;
		} else if (str == "") {
			ReturnDefault = Defaultvalue;
		} else {
			ReturnDefault = str;
		}
		return ReturnDefault;
	}

	public static String base64Encode(String str) throws java.io.IOException {
		BASE64Encoder encoder = new BASE64Encoder();
		byte[] strByte = str.getBytes();
		String result = encoder.encode(strByte);

		return result;
	}


}
