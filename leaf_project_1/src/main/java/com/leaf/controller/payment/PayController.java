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
import org.springframework.web.bind.annotation.RequestMethod;
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

	private static String URL_PAYPAL_VALIDATE;// PDT�뜲�씠�꽣瑜� �럹�씠�뙏濡� 蹂대궪 二쇱냼

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

	private static final String PARAM_ITEM_NAME = "item_name"; // �긽�뭹�씠由�
	private static final String PARAM_ITEM_NUMBER = "item_number"; // �긽�뭹踰덊샇
	private static final String PARAM_ADDRESS_STREET = "address_street";
	private static final String PARAM_PAYMENT_STATUS = "payment_status"; // 寃곗젣 �긽�깭
	private static final String PARAM_MC_GROSS = "mc_gross"; // �럹�씠�뙏 寃곗젣湲덉븸
	private static final String PARAM_MC_FEE = "mc_fee"; // �럹�씠�뙏 �닔�닔猷뚭툑�븸
	private static final String PARAM_MC_CURRENCY = "mc_currency"; // �솕�룓
	private static final String PARAM_TXN_ID = "txn_id"; // 嫄곕옒踰덊샇
	private static final String PARAM_RECEIVER_EMAIL = "receiver_email"; // �럹�씠�뙏 �뙋留ㅼ옄怨꾩젙 �씠硫붿씪
	private static final String PARAM_PAYER_EMAIL = "payer_email"; // �럹�씠�뙏 援щℓ�옄怨꾩젙 �씠硫붿씪
	private static final String PARAM_CUSTOM = "custom"; // �긽�젏�쉶�썝踰덊샇

	@RequestMapping(value = "/payment.do", method = RequestMethod.POST)
	public ModelAndView payMent(PaymentDTO dto) {
		System.out.println(dto.getPayment_lect_subject()+"////////////////");
		System.out.println(dto.getPayment_lect_charge()+"////////////////");
		System.out.println(dto.getPayment_teacher_name()+"////////////////");
		paymentDAO.insertPaymentData(dto);
		int payNum = paymentDAO.selectMaxRow();
		ModelAndView mav = new ModelAndView();
		
		/*�떖�윭 �솚�궛*/
		int charge = dto.getPayment_lect_charge();
		int charge_result =charge/1000;
		dto.setPayment_lect_charge(charge_result);
		
		mav.addObject("dto", dto);
		mav.addObject("payNum", payNum);
		mav.setViewName("moon.payment");
		return mav;
	}

	/* �럹�씠�뙏 寃곗젣 PDT�젙蹂� �빖�뱾留� */
	@RequestMapping("payDataReceive.do")
	public void handleRequestPDT(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// �럹�씠�뙏濡쒕��꽣 �삩 �뙆�씪誘명꽣瑜� �몴�떆�븳�떎.
		Enumeration en = request.getParameterNames();
		String readString = "";
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String paramValue = request.getParameter(paramName);
			readString = readString + "&" + paramName + "=" + URLDecoder.decode(paramValue, "UTF-8");
		}
		logger.info("Received PDT from PayPal : " + readString);

		// �떎�떆 PayPal濡� 寃뚯떆�븯湲� �쐞�빐 �뙆�씪誘명꽣瑜� 援ъ꽦�븳�떎.
		String str = PARAM_CMD + "=" + PARAM_CMD_VALUE;
		en = request.getParameterNames();
		while (en.hasMoreElements()) {
			String paramName = (String) en.nextElement();
			String paramValue = request.getParameter(paramName);
			str = str + "&" + paramName + "=" + URLEncoder.encode(paramValue, "UTF-8");
		}
		
		str = str + "&" + PARAM_AT + "=" + PARAM_AT_VALUE;
		logger.info("Sending PDT to PayPal : " + str);

		// �쑀�슚�꽦 寃��궗瑜� �븯湲곗쐞�빐 PayPal濡� �떎�떆 �쟾�넚�떆�옉.
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

			logger.info("�럹�씠�뙏 �꽌踰꾨줈遺��꽣 PDT�쑀�슚�꽦 �슂泥��씠 �꽦怨듯뻽�뒿�땲�떎.");
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

			/* DB�옉�뾽 諛� �쓳�떟�럹�씠吏� �샇異� �쓽 �옉�뾽�쓣 �븯�뒗怨� */
			String paychkStr = "";
			int paychkInt;
			String itemname = request.getParameter("item_name");
			String price = request.getParameter("amt");
			String itemnumber = request.getParameter("item_number");
			if (request.getParameter("st").equals("Completed")) {
				paychkStr = "寃곗젣�셿猷�";
				paychkInt = 1;
			} else {
				paychkStr = "寃곗젣 �떎�뙣 - 愿�由ъ옄�뿉寃� 臾몄쓽�븯�꽭�슂";
				paychkInt = 0;
			}
			String paySubject = "Leaf-Academy 寃곗젣 �궡�뿭�엯�땲�떎.";
			String text = "寃곗젣�븯�떊 �궡�뿭�� > \n" + "�긽�뭹 �씠由� : " + itemname + "\n �긽�뭹媛�寃� : " + request.getParameter("amt")
					+ "\n 寃곗젣 �뿬遺� : " + paychkStr;
			String send_email = paymentDAO.selectEmailAddress(Integer.parseInt(itemnumber));
			/* 寃곗젣�솗�씤 �씠硫붿씪 �쟾�넚 */
			memberDAO.send(paySubject, text, "seilrin8534@gmail.com", send_email);
			/* 寃곗젣�솗�씤 臾몄옄 �쟾�넚 */
			String charsetType = "UTF-8"; // EUC-KR 占쎌굢占쎈뮉 UTF-8

			request.setCharacterEncoding(charsetType);
			response.setCharacterEncoding(charsetType);
			// String action = nullcheck(request.getParameter("action"), "");
			String member_tel = paymentDAO.selectMemberTel(Integer.parseInt(itemnumber));

			String sms_url = "";
			sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 占쎌읈占쎈꽊占쎌뒄筌ｏ옙 URL
			String user_id = base64Encode("wangi0304"); // SMS占쎈툡占쎌뵠占쎈탵
			String secure = base64Encode("76cbbe87090606943f1c49cf98588d5d");// 占쎌뵥筌앹빜沅�
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

			// 占쎈쑓占쎌뵠占쎄숲 筌띾벏釉� 癰귨옙占쎈땾 占쎌젟占쎌벥
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

			// 癰귣챶揆 占쎄문占쎄쉐
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
			// 占쎈엘占쎈쐭 占쎌읈占쎈꽊
			BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
			wr.write("POST " + path + " HTTP/1.0\r\n");
			wr.write("Content-Length: " + data.length() + "\r\n");
			wr.write("Content-type: multipart/form-data, boundary=" + boundary + "\r\n");
			wr.write("\r\n");

			// 占쎈쑓占쎌뵠占쎄숲 占쎌읈占쎈꽊
			wr.write(data);
			wr.flush();

			// 野껉퀗�궢揶쏉옙 占쎈섯疫뀐옙
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
			String Result = rMsg[0]; // 諛쒖넚寃곌낵
			String Count = ""; // �옍�뿬嫄댁닔
			if (rMsg.length > 1) {
				Count = rMsg[1];
			}

			// 諛쒖넚寃곌낵 �븣由�
			if (Result.equals("success")) {
				alert = "�꽦怨듭쟻�쑝濡� 諛쒖넚�븯���뒿�땲�떎.";
				alert += " �옍�뿬嫄댁닔�뒗 " + Count + "嫄� �엯�땲�떎.";
			} else if (Result.equals("reserved")) {
				alert = "�꽦怨듭쟻�쑝濡� �삁�빟�릺�뿀�뒿�땲�떎";
				alert += " �옍�뿬嫄댁닔�뒗 " + Count + "嫄� �엯�땲�떎.";
			} else if (Result.equals("3205")) {
				alert = "�옒紐삳맂 踰덊샇�삎�떇�엯�땲�떎.";
			} else {
				alert = "[Error]" + Result;
			}

			/* 援щℓ �셿猷� 泥댄겕 */
			paymentDAO.updatePayChk(Integer.parseInt(itemnumber));
			
			/*�븰�깮 �벑濡�*/
			Map<String,Integer> payment_id_map = new HashMap<String,Integer>();
			payment_id_map.put("payment_one_id", Integer.parseInt(itemnumber));
			payment_id_map.put("payment_two_id", Integer.parseInt(itemnumber));
			stumgmtDAO.payStudentInsert(payment_id_map);
			
			
			/*誘멸뎄留� 泥댄겕*/
			/*paymentDAO.deletePayData(Integer.parseInt(itemnumber));*/
			
			/*�셿猷뚰썑 �럹�씠吏�*/
			response.sendRedirect("main.do");

		} else if (res.equals(RESPONSE_FAIL)) {
			logger.warn("�럹�씠�뙏�꽌踰꾨줈 遺��꽣 PDT�쑀�슚�꽦 �슂泥��씠 �떎�뙣�뻽�뒿�땲�떎. �긽�깭 : " + res);
		} else {
			logger.error("�럹�씠�뙏�꽌踰꾨줈 遺��꽣 PDT�쑀�슚�꽦 �슂泥��씠 �떎�뙣�뻽�뒿�땲�떎. �긽�깭 : " + res);
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
