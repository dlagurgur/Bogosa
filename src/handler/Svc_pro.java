package handler;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
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

import db.UserDBBean;
import db.UserDataBean;

@Controller
public class Svc_pro{
	
	@Resource
	private UserDBBean userDao;

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
		userDto.setUser_phone(request.getParameter("user_phone"));
		userDto.setUser_addr(request.getParameter("user_addr"));
		userDto.setUser_addr2(request.getParameter("user_addr2"));
		userDto.setUser_email(request.getParameter("user_email"));
		int corp = Integer.parseInt(request.getParameter("User_corp"));
		userDto.setUser_corp(corp);
				

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

		String email = request.getParameter("user_email");
		int result = userDao.EmailCheck(email);

		request.setAttribute("authNum", authNum);
		request.setAttribute("email", email);
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
					return new PasswordAuthentication("dlagurgur@gmail.com", "tkdgur0713!@");
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
/*	
	//// 아이디 찾기
	@RequestMapping("/EmailIdd")
	public ModelAndView EmailIdCheckProcess(HttpServletRequest request, HttpServletResponse response) {
		String host = "smtp.gmail.com"; // smtp 서버
		String subject = "EmailCheck"; // 보내는 제목 설정
		String fromName = "Admin"; // 보내는 이름 설정
		String from = "dlagurgur@gmail.com"; // 보내는 사람(구글계정)
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
					return new PasswordAuthentication("dlagurgur@gmail.com", "tkdgur0713!@");
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
		String from = "dlagurgur@gmail.com"; // 보내는 사람(구글계정)
		String email = request.getParameter("email2");
		int result = userDao.EmailCheck(email);
		if(result == 1) {
		UserDataBean userDto = userDao.getUserEmailPasswd(email);
		String user_passwd = userDto.getPasswd();
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
					return new PasswordAuthentication("dlagurgur@gmail.com", "tkdgur0713!@");
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
	
*/	

}
