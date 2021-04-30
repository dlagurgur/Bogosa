package handler;

import java.io.IOException;


import java.io.UnsupportedEncodingException;


import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import db.Product_DBBean;
import db.Product_DataBean;
import db.UserDBBean;
import db.UserDataBean;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@Controller
public class Svc_pro{
	@Resource
	private UserDBBean userDao;
	
	@Resource
	private Product_DBBean Product_Dao;

//////////////////////////////////회원 영역///////////////////////////////////////////////	
	//회원가입
	@RequestMapping("/svc_join_pro")
	public ModelAndView UserInputProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		UserDataBean userDto = new UserDataBean();
		userDto.setUser_id(request.getParameter("user_id"));
		userDto.setUser_pw(request.getParameter("user_pw"));
		userDto.setUser_name(request.getParameter("user_name"));
		userDto.setUser_addr(request.getParameter("user_addr"));
		userDto.setUser_addr2(request.getParameter("user_addr2"));
		int corp = Integer.parseInt(request.getParameter("user_corp"));
		userDto.setUser_email(request.getParameter("user_email"));
		userDto.setUser_corp(corp);
		
		String cus_tel = null;
		String cus_tel1 = request.getParameter( "cus_tel1" );
		String cus_tel2 = request.getParameter( "cus_tel2" );
		String cus_tel3 = request.getParameter( "cus_tel3" );
		if( ! cus_tel1.equals( "" ) && ! cus_tel2.equals( "" ) && ! cus_tel3.equals( "" ) ) {
			cus_tel = cus_tel1 + "-" + cus_tel2 + "-" + cus_tel3;
		}
		
		userDto.setUser_phone(cus_tel);
		
		int result = userDao.insertUser(userDto);

		
		
		request.setAttribute("result", result);
		request.setAttribute("userDto", userDto);
		request.setAttribute("user_id", userDto.getUser_id());

		return new ModelAndView("svc/svc_join_pro");
	}
	
	
	//아이디 중복확인
	@RequestMapping(value = "/idCheck.go", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<Object, Object> idCheck(@RequestBody String user_id) {
		user_id = user_id.split("=")[0];
		int countId = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		countId = userDao.idCheck(user_id);
	
		map.put("countId", countId);
	
		return map;
	}	
	
	//// Email 인증
	@RequestMapping("/emailCheck")
	public ModelAndView EmailCheckProcess(HttpServletRequest request, HttpServletResponse response) {
		String host = "smtp.gmail.com"; // smtp 서버
		String subject = "EmailCheck"; // 보내는 제목 설정
		String fromName = "Admin"; // 보내는 이름 설정
		String from = "dlagurgur123@gmail.com"; // 보내는 사람(구글계정)
		String authNum = Svc_pro.authNum(); // 인증번호 위한 난수 발생부분
		String content = "Number [" + authNum + "]"; // 이메일 내용 설정
		
		String user_email=request.getParameter("email");

		System.out.println(authNum);
		
		int result = userDao.EmailCheck(user_email);

		request.setAttribute("authNum", authNum);
		request.setAttribute("user_email", user_email);
		request.setAttribute("result", result);

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("dlagurgur123@gmail.com", "asd75311");
				}
			});

			Message msg = new MimeMessage(mailSession);
			InternetAddress[] address = { new InternetAddress(user_email) };
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "utf-8", "B")));
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html; charset=utf-8");

			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView("svc/emailCheck");
	}
	
	public static String authNum() { // 난수발생부분
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 4; i++) {
			int num = (int) (Math.random() * 9 + 1);
			buffer.append(num);
		}
		return buffer.toString();
	}
	
	//// 아이디 찾기
	@RequestMapping("/EmailIdd")
	public ModelAndView EmailIdCheckProcess(HttpServletRequest request, HttpServletResponse response) {
		String host = "smtp.gmail.com"; // smtp 서버
		String subject = "EmailCheck"; // 보내는 제목 설정
		String fromName = "Admin"; // 보내는 이름 설정
		String from = "dlagurgur123@gmail.com"; // 보내는 사람(구글계정)
		String email = request.getParameter("email2");
		int result = userDao.EmailCheck(email);
		if(result == 1) {
		UserDataBean userDto = userDao.getUserEmailId(email);
		String user_id = userDto.getUser_id();
		String content = "당신의 아이디는 [" + user_id + "]입니다"; // 이메일 내용 설정
		
		request.setAttribute("email", email);

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("dlagurgur123@gmail.com", "asd75311");
				}
			});

			Message msg = new MimeMessage(mailSession);
			InternetAddress[] address = { new InternetAddress(email) };
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "utf-8", "B")));
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html; charset=utf-8");

			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		request.setAttribute("result", result);
		return new ModelAndView("svc/EmailIdd");
	}
	
	/////비밀번호찾기
	@RequestMapping("/EmailPasswdd")
	public ModelAndView EmailPasswdCheckProcess(HttpServletRequest request, HttpServletResponse response) {
		String host = "smtp.gmail.com"; // smtp 서버
		String subject = "EmailCheck"; // 보내는 제목 설정
		String fromName = "Admin"; // 보내는 이름 설정
		String from = "dlagurgur123@gmail.com"; // 보내는 사람(구글계정)
		String email = request.getParameter("email2");
		int result = userDao.EmailCheck(email);
		if(result == 1) {
		UserDataBean userDto = userDao.getUserEmailPasswd(email);
		String user_passwd = userDto.getUser_pw();
		String content = "당신의 비밀번호는 [" + user_passwd + "]입니다"; // 이메일 내용 설정
	
		request.setAttribute("email", email);

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("dlagurgur123@gmail.com", "asd75311");
				}
			});

			Message msg = new MimeMessage(mailSession);
			InternetAddress[] address = { new InternetAddress(email) };
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "utf-8", "B")));
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(subject);
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html; charset=utf-8");

			Transport.send(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		request.setAttribute("result", result);
		return new ModelAndView("svc/EmailPasswdd");
	}
	


	
	//로그인 기능
	@RequestMapping("/loginPro")
	public ModelAndView Loginprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=request.getParameter("user_id");
		String user_pw=request.getParameter("user_pw");
		
		
		int result=userDao.check(user_id, user_pw);
		
	
		request.setAttribute("result", result);
		request.setAttribute("user_id", user_id);
		
		return new ModelAndView("svc/loginPro");
	}
	
	
	//로그아웃
	
	@RequestMapping("/logout")
	public ModelAndView LogoutProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException {
		request.getSession().removeAttribute("user_id");
		
		
		return new ModelAndView("svc/login");
	}
	
	//유저 수정
	@RequestMapping("/updatePro")
	public ModelAndView UserModifyprocess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException{
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		String user_id = (String) request.getSession().getAttribute("user_id");
		UserDataBean userDto=userDao.selectCustomer(user_id);
		
		userDto.setUser_pw(request.getParameter("user_pw"));
		userDto.setUser_addr(request.getParameter("user_addr"));
		userDto.setUser_addr2(request.getParameter("user_addr2"));
		
		// 전화번호
		String tel = null;
		String tel1 = request.getParameter( "tel1" );
		String tel2 = request.getParameter( "tel2" );
		String tel3 = request.getParameter( "tel3" );
		if( ! tel1.equals( "" ) && ! tel2.equals( "" ) && ! tel3.equals( "" ) ) {
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}
		
		userDto.setUser_phone( tel );
		
		int result=userDao.user_update(userDto);
		request.setAttribute("result", result);
		
		return new ModelAndView("svc/user_updatePro");
		
	}
	
	
	//유저 삭제
	@RequestMapping("/deletePro")
	public ModelAndView DeleteProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException{
		String user_id = (String) request.getSession().getAttribute("user_id");
		String user_pw = request.getParameter("user_pw");
		
		
		UserDataBean userDto=userDao.selectCustomer(user_id);
		
		int result;
		
		
		if(user_pw.equals(userDto.getUser_pw()) ) {
			userDao.deletProduct(user_id);
			userDao.deleteCustomer(user_id);
			result = 1;
		}else {
			result = 0;
		}
		
		request.getSession().removeAttribute("user_id");
		request.setAttribute("result", result);
		return new ModelAndView("svc/user_deletePro");
		
	}
	
	///////////// 주문 관련 영역 //////////////////////////////////////
	
	
	@RequestMapping("/product_insert_pro")
	public ModelAndView productInsertprocess(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
		request.setCharacterEncoding( "utf-8" );
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	
	Product_DataBean product_dto = new Product_DataBean();
	 
	// 파일 크기 15MB로 제한
	int sizeLimit = 1024*1024*15;
	
	@SuppressWarnings("deprecation")
	String imagePath = request.getRealPath("menu_images");
	String filename = "";
		
	MultipartRequest multi = new MultipartRequest( request, imagePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		
		String product_name = multi.getParameter("product_name");
		int product_category = Integer.parseInt(multi.getParameter("product_category"));
		int product_price = Integer.parseInt(multi.getParameter("product_price"));
		String product_detail = multi.getParameter("product_detail");
		String user_id = multi.getParameter("session");
	
		@SuppressWarnings("rawtypes")
		Enumeration files = multi.getFileNames();

		String file = (String) files.nextElement();
		filename = multi.getFilesystemName(file);
	
		
		product_dto.setProduct_name(product_name);
		product_dto.setProduct_price(product_price);
		product_dto.setProduct_category(product_category);
		product_dto.setProduct_detail(product_detail);
		product_dto.setUser_id(user_id);
		product_dto.setProduct_image(filename);
			
		
	
			
		int result = Product_Dao.insertProduct(product_dto);
		int tb_no = product_dto.getProduct_id();// tb_no
		request.setAttribute("tb_no", tb_no);	
		
		request.setAttribute("result", result);
		return new ModelAndView("svc/product_insert_pro");
	}

}
