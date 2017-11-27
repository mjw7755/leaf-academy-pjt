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
import java.util.Map;
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
import com.leaf.model.payment.PaymentDAO;
import com.leaf.model.payment.PaymentDTO;
import com.leaf.model.stumgmt.StumgmtDAO;

import sun.misc.BASE64Encoder;

@Controller
public class PayController {

	@Autowired
	PaymentDAO paymentDAO;

	@Autowired
	MemberDAO memberDAO;

	@Autowired
	StumgmtDAO stumgmtDAO;
	
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
		
		/*달러 환산*/
		int charge = dto.getPayment_lect_charge();
		int charge_result =charge/1000;
		dto.setPayment_lect_charge(charge_result);
		
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
			memberDAO.send(paySubject, text, "seilrin8534@gmail.com", send_email);
			/* 결제확인 문자 전송 */
			String charsetType = "UTF-8"; // EUC-KR �삉�뒗 UTF-8

			request.setCharacterEncoding(charsetType);
			response.setCharacterEncoding(charsetType);
			// String action = nullcheck(request.getParameter("action"), "");
			String member_tel = paymentDAO.selectMemberTel(Integer.parseInt(itemnumber));

			String sms_url = "";
			sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS �쟾�넚�슂泥� URL
			String user_id = base64Encode("wangi0304"); // SMS�븘�씠�뵒
			String secure = base64Encode("76cbbe87090606943f1c49cf98588d5d");// �씤利앺궎
			String msg = base64Encode(nullcheck(text, ""));

			String rphone = base64Encode(member_tel);
			String sphone1 = base64Encode("010");
			String sphone2 = base64Encode("5055");
			String sphone3 = base64Encode("0240");
			String rdate = base64Encode(nullcheck(request.getParameter("rdate"), ""));
			String rtime = base64Encode(nullcheck(request.getParameter("rtime"), ""));
			String mode = base64Encode("1");
			String subject = "";
			if (nullcheck(request.getParameter("smsType"), "").equals("L")) {
				subject = base64Encode(nullcheck(request.getParameter("subject"), ""));
			}
			String testflag = base64Encode(nullcheck(request.getParameter("testflag"), ""));
			String destination = base64Encode(nullcheck(request.getParameter("destination"), ""));
			String repeatFlag = base64Encode(nullcheck(request.getParameter("repeatFlag"), ""));
			String repeatNum = base64Encode(nullcheck(request.getParameter("repeatNum"), ""));
			String repeatTime = base64Encode(nullcheck(request.getParameter("repeatTime"), ""));
			String returnurl = nullcheck(request.getParameter("returnurl"), "");
			String nointeractive = nullcheck(request.getParameter("nointeractive"), "");
			String smsType = base64Encode(nullcheck(request.getParameter("smsType"), ""));

			String[] host_info = sms_url.split("/");
			String host = host_info[2];
			String path = "/" + host_info[3];
			int port = 80;

			// �뜲�씠�꽣 留듯븨 蹂��닔 �젙�쓽
			String arrKey[] = new String[] { "user_id", "secure", "msg", "rphone", "sphone1", "sphone2", "sphone3",
					"rdate", "rtime", "mode", "testflag", "destination", "repeatFlag", "repeatNum", "repeatTime",
					"smsType", "subject" };
			String valKey[] = new String[arrKey.length];
			valKey[0] = user_id;
			valKey[1] = secure;
			valKey[2] = msg;
			valKey[3] = rphone;
			valKey[4] = sphone1;
			valKey[5] = sphone2;
			valKey[6] = sphone3;
			valKey[7] = rdate;
			valKey[8] = rtime;
			valKey[9] = mode;
			valKey[10] = testflag;
			valKey[11] = destination;
			valKey[12] = repeatFlag;
			valKey[13] = repeatNum;
			valKey[14] = repeatTime;
			valKey[15] = smsType;
			valKey[16] = subject;

			String boundary = "";
			Random rnd = new Random();
			String rndKey = Integer.toString(rnd.nextInt(32000));
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bytData = rndKey.getBytes();
			md.update(bytData);
			byte[] digest = md.digest();
			for (int i = 0; i < digest.length; i++) {
				boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
			}
			boundary = "---------------------" + boundary.substring(0, 11);

			// 蹂몃Ц �깮�꽦
			String data = "";
			String index = "";
			String value = "";
			for (int i = 0; i < arrKey.length; i++) {
				index = arrKey[i];
				value = valKey[i];
				data += "--" + boundary + "\r\n";
				data += "Content-Disposition: form-data; name=\"" + index + "\"\r\n";
				data += "\r\n" + value + "\r\n";
				data += "--" + boundary + "\r\n";
			}

			// out.println(data);

			InetAddress addr = InetAddress.getByName(host);
			Socket socket = new Socket(host, port);
			// �뿤�뜑 �쟾�넚
			BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
			wr.write("POST " + path + " HTTP/1.0\r\n");
			wr.write("Content-Length: " + data.length() + "\r\n");
			wr.write("Content-type: multipart/form-data, boundary=" + boundary + "\r\n");
			wr.write("\r\n");

			// �뜲�씠�꽣 �쟾�넚
			wr.write(data);
			wr.flush();

			// 寃곌낵媛� �뼸湲�
			BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(), charsetType));
			String line;
			String alert = "";
			ArrayList tmpArr = new ArrayList();
			while ((line = rd.readLine()) != null) {
				tmpArr.add(line);
			}
			wr.close();
			rd.close();

			String tmpMsg = (String) tmpArr.get(tmpArr.size() - 1);
			String[] rMsg = tmpMsg.split(",");
			String Result = rMsg[0]; // 발송결과
			String Count = ""; // 잔여건수
			if (rMsg.length > 1) {
				Count = rMsg[1];
			}

			// 발송결과 알림
			if (Result.equals("success")) {
				alert = "성공적으로 발송하였습니다.";
				alert += " 잔여건수는 " + Count + "건 입니다.";
			} else if (Result.equals("reserved")) {
				alert = "성공적으로 예약되었습니다";
				alert += " 잔여건수는 " + Count + "건 입니다.";
			} else if (Result.equals("3205")) {
				alert = "잘못된 번호형식입니다.";
			} else {
				alert = "[Error]" + Result;
			}

			/* 구매 완료 체크 */
			paymentDAO.updatePayChk(Integer.parseInt(itemnumber));
			
			/*학생 등록*/
			Map<String,Integer> payment_id_map = new HashMap<String,Integer>();
			payment_id_map.put("payment_one_id", Integer.parseInt(itemnumber));
			payment_id_map.put("payment_two_id", Integer.parseInt(itemnumber));
			stumgmtDAO.payStudentInsert(payment_id_map);
			
			
			/*미구매 체크*/
			/*paymentDAO.deletePayData(Integer.parseInt(itemnumber));*/
			
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
