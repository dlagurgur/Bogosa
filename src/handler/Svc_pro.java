package handler;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
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
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import db.Comment_DBBean;
import db.Comment_DataBean;
import db.Order_history_DBBean;
import db.Order_history_DataBean;
import db.Product_DBBean;
import db.Product_DataBean;
import db.Product_chat_DBBean;
import db.Product_chat_DataBean;
import db.Product_review_DBBean;
import db.Product_review_DataBean;
import db.Trailer_DBBean;
import db.Trailer_DataBean;
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
	
	@Resource
	private Trailer_DBBean Trailer_Dao;
	
	@Resource
	private Order_history_DBBean Order_Dao;
	
	@Resource
	private Comment_DBBean Comment_Dao;
	
	
	@Resource
	private Product_chat_DBBean Product_chat_Dao;
	
	
	@Resource
	private Product_review_DBBean review_Dao;
	
//////////////////////////////////占쎌�띰옙�� 占쎌�븝옙肉�///////////////////////////////////////////////	
	//占쎌�띰옙��揶�占쏙옙��
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
		String c = request.getParameter("c");
		
		userDto.setA(request.getParameter("a"));
		userDto.setB(request.getParameter("b"));
		userDto.setC("rtmps://" + c + "/app/");
		userDto.setUser_charn(request.getParameter("user_charn"));
		
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
	
	
	//占쎈�占쎌��占쎈� 餓λ��э옙��占쎌��
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
	
	//// Email 占쎌�ㅿ�占�
	@RequestMapping("/emailCheck")
	public ModelAndView EmailCheckProcess(HttpServletRequest request, HttpServletResponse response) {
		String host = "smtp.gmail.com"; // smtp 占쎄�甕곤옙
		String subject = "EmailCheck"; // 癰���沅∽옙�� 占쎌�ｏ�占� 占쎄�占쎌��
		String fromName = "Admin"; // 癰���沅∽옙�� 占쎌���깍옙 占쎄�占쎌��
		String from = "dlagurgur123@gmail.com"; // 癰���沅∽옙�� 占쎄�占쎌��(�닌�占썸�④쑴��)
		String authNum = Svc_pro.authNum(); // 占쎌�ㅿ��몄쓰占쎌�� 占쎌��占쎈립 占쎄�占쎈�� 獄���源��븝옙�븝옙
		String content = "Number [" + authNum + "]"; // 占쎌��筌�遺우�� 占쎄땀占쎌�� 占쎄�占쎌��
		
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
	
	public static String authNum() { // 占쎄�占쎈��獄���源��븝옙�븝옙
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 4; i++) {
			int num = (int) (Math.random() * 9 + 1);
			buffer.append(num);
		}
		return buffer.toString();
	}
	
	//// 占쎈�占쎌��占쎈� 筌≪��由�
	@RequestMapping("/EmailIdd")
	public ModelAndView EmailIdCheckProcess(HttpServletRequest request, HttpServletResponse response) {
		String host = "smtp.gmail.com"; // smtp 占쎄�甕곤옙
		String subject = "EmailCheck"; // 癰���沅∽옙�� 占쎌�ｏ�占� 占쎄�占쎌��
		String fromName = "Admin"; // 癰���沅∽옙�� 占쎌���깍옙 占쎄�占쎌��
		String from = "dlagurgur123@gmail.com"; // 癰���沅∽옙�� 占쎄�占쎌��(�닌�占썸�④쑴��)
		String email = request.getParameter("email2");
		int result = userDao.EmailCheck(email);
		if(result == 1) {
		UserDataBean userDto = userDao.getUserEmailId(email);
		String user_id = userDto.getUser_id();
		String content = "占쎈��占쎈��占쎌�� 占쎈�占쎌��占쎈�占쎈�� [" + user_id + "]占쎌��占쎈�뀐옙��"; // 占쎌��筌�遺우�� 占쎄땀占쎌�� 占쎄�占쎌��
		
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
	
	/////��袁⑨옙甕곕����筌≪��由�
	@RequestMapping("/EmailPasswdd")
	public ModelAndView EmailPasswdCheckProcess(HttpServletRequest request, HttpServletResponse response) {
		String host = "smtp.gmail.com"; // smtp 占쎄�甕곤옙
		String subject = "EmailCheck"; // 癰���沅∽옙�� 占쎌�ｏ�占� 占쎄�占쎌��
		String fromName = "Admin"; // 癰���沅∽옙�� 占쎌���깍옙 占쎄�占쎌��
		String from = "dlagurgur123@gmail.com"; // 癰���沅∽옙�� 占쎄�占쎌��(�닌�占썸�④쑴��)
		String email = request.getParameter("email2");
		int result = userDao.EmailCheck(email);
		if(result == 1) {
		UserDataBean userDto = userDao.getUserEmailPasswd(email);
		String user_passwd = userDto.getUser_pw();
		String content = "占쎈��占쎈��占쎌�� ��袁⑨옙甕곕����占쎈�� [" + user_passwd + "]占쎌��占쎈�뀐옙��"; // 占쎌��筌�遺우�� 占쎄땀占쎌�� 占쎄�占쎌��
	
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
	


	
	//嚥≪����占쎌�� 疫꿸���
	@RequestMapping("/loginPro")
	public ModelAndView Loginprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=request.getParameter("user_id");
		String user_pw=request.getParameter("user_pw");
		
		
		int result=userDao.check(user_id, user_pw);
		
	
		request.setAttribute("result", result);
		request.setAttribute("user_id", user_id);
		
		return new ModelAndView("svc/loginPro");
	}
	
	
	//嚥≪����占쎈�占쎌��
	
	@RequestMapping("/logout")
	public ModelAndView LogoutProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException {
		request.getSession().removeAttribute("user_id");
		
		
		return new ModelAndView("svc/login");
	}
	
	//占쎌��占쏙옙 占쎈��占쎌��
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
		
		// 占쎌�억옙��甕곕����
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
	
	
	//占쎌��占쏙옙 占쎄�占쎌��
	@RequestMapping("/deletePro")
	public ModelAndView DeleteProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException{
		String user_id = (String) request.getSession().getAttribute("user_id");
		String user_pw = request.getParameter("user_pw");
		
		
		UserDataBean userDto=userDao.selectCustomer(user_id);
		
		int result;
		
		
		if(user_pw.equals(userDto.getUser_pw()) ) {
			userDao.deleteCustomer(user_id);
			result = 1;
		} else {
			result = 0;
		}
		
		request.getSession().removeAttribute("user_id");
		request.setAttribute("result", result);
		return new ModelAndView("svc/user_deletePro");
		
	}
	
	///////////// 雅��겆� �울옙占쎌�� 占쎌�븝옙肉� //////////////////////////////////////
	
	
	@RequestMapping("/product_insert_pro")
	public ModelAndView productInsertprocess(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
		request.setCharacterEncoding( "utf-8" );
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	
	Product_DataBean product_dto = new Product_DataBean();
	 
	// 占쎈��占쎌�� 占쎄�疫뀐옙 15MB嚥∽옙 占쎌�ｏ옙釉�
	int sizeLimit = 1024*1024*15;
	
	@SuppressWarnings("deprecation")
	String imagePath = request.getRealPath("menu_images");
	
	File dir = new File(imagePath);
	
	if (!dir.exists()) {
		dir.mkdirs();
	}
	
	
	String filename = "";
		
	MultipartRequest multi = new MultipartRequest( request, imagePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	
	
		String product_name = multi.getParameter("product_name");
		String product_title = multi.getParameter("product_title");
		String aws_url = multi.getParameter("aws_url");
		String user_charn = multi.getParameter("user_charn");
		int product_category = Integer.parseInt(multi.getParameter("product_category"));
		int product_price = Integer.parseInt(multi.getParameter("product_price"));
		String product_detail = multi.getParameter("product_detail");
		String user_id = multi.getParameter("session");
	
		@SuppressWarnings("rawtypes")
		Enumeration files = multi.getFileNames();

		String file = (String) files.nextElement();
		filename = multi.getFilesystemName(file);
	
		
		product_dto.setProduct_title(product_title);
		product_dto.setProduct_name(product_name);
		product_dto.setProduct_price(product_price);
		product_dto.setProduct_category(product_category);
		product_dto.setProduct_detail(product_detail);
		product_dto.setUser_id(user_id);
		product_dto.setAws_url(aws_url);
		product_dto.setProduct_image(filename);
		product_dto.setUser_charn(user_charn);
	
			
		
	
			
		int result = Product_Dao.insertProduct(product_dto);
		int tb_no = product_dto.getProduct_id();// tb_no
		request.setAttribute("tb_no", tb_no);	
		
		request.setAttribute("result", result);
		return new ModelAndView("svc/product_insert_pro");
	}
	
	
	
	@RequestMapping("/trailer_product_insert_pro")
	public ModelAndView trailer_product_insert_proprocess(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
		request.setCharacterEncoding( "utf-8" );
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	
	Product_DataBean product_dto = new Product_DataBean();
	 
	// 占쎈��占쎌�� 占쎄�疫뀐옙 15MB嚥∽옙 占쎌�ｏ옙釉�
	int sizeLimit = 1024*1024*15;
	
	@SuppressWarnings("deprecation")
	String imagePath = request.getRealPath("menu_images");
	
	File dir = new File(imagePath);
	
	if (!dir.exists()) {
		dir.mkdirs();
	}
	
	
	String filename = "";
		
	MultipartRequest multi = new MultipartRequest( request, imagePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	
	
		String product_name = multi.getParameter("product_name");
		String product_title = multi.getParameter("product_title");
		String aws_url = multi.getParameter("aws_url");
		String user_charn = multi.getParameter("user_charn");
		int product_category = Integer.parseInt(multi.getParameter("product_category"));
		int product_price = Integer.parseInt(multi.getParameter("product_price"));
		String product_detail = multi.getParameter("product_detail");
		String user_id = multi.getParameter("session");
		int trailer_id = Integer.parseInt(multi.getParameter("trailer_id"));
	
		@SuppressWarnings("rawtypes")
		Enumeration files = multi.getFileNames();

		String file = (String) files.nextElement();
		filename = multi.getFilesystemName(file);
	
		
		product_dto.setProduct_title(product_title);
		product_dto.setProduct_name(product_name);
		product_dto.setProduct_price(product_price);
		product_dto.setProduct_category(product_category);
		product_dto.setProduct_detail(product_detail);
		product_dto.setUser_id(user_id);
		product_dto.setAws_url(aws_url);
		product_dto.setProduct_image(filename);
		product_dto.setTrailer_id(trailer_id);
		product_dto.setUser_charn(user_charn);	
		
	
			
		int result = Product_Dao.insertProduct(product_dto);
		int tb_no = product_dto.getProduct_id();// tb_no
		request.setAttribute("tb_no", tb_no);	
		
		request.setAttribute("result", result);
		return new ModelAndView("svc/product_insert_pro");
	}
	
	
	
	
	@RequestMapping("/product_detaile_delete")
	public ModelAndView deletProductProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException{
		int product_id=Integer.parseInt(request.getParameter("product_id"));
		int trailer_id=Integer.parseInt(request.getParameter("trailer_id"));
		String trailer_id1=request.getParameter("trailer_id");
		
		if(trailer_id1==null) {
			Product_Dao.product_chat_delete(product_id);
			int result = Product_Dao.Product_off(product_id);
			request.setAttribute("result", result);

		}else {
			Product_Dao.product_chat_delete(product_id);
			Product_Dao.trailer_delete(trailer_id);
			int result = Product_Dao.Product_off(product_id);
			request.setAttribute("result", result);
		}
		
		
		

		return new ModelAndView("svc/deletProduct");
		
	}
	
	
	
	
	
	@RequestMapping("/order_insert_pro")
	public ModelAndView order_insertProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Order_history_DataBean orderDto = new Order_history_DataBean();
		orderDto.setOrder_qnt(Integer.parseInt(request.getParameter("product_qnt")));
		
		orderDto.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		String user_id = request.getParameter("user_id");
		System.out.println(user_id);
		orderDto.setUser_id(user_id);

		
		String user_addr = request.getParameter("user_addr");
		String user_addr2 = request.getParameter("user_addr2");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", user_id);
		map.put("user_addr", user_addr);
		map.put("user_addr2", user_addr2);
		
		userDao.updateUser_address(map);
		
		
		
		Order_Dao.insertOrder(orderDto);

		
		
	
		
		return new ModelAndView("svc/order_insert_pro");
	}

	
	
	
	// 占쎌�わ옙����占� 占쎌���⑨옙 占쎈�뱄옙��筌�占�
	
	@RequestMapping("/trailer_insert_pro")
	public ModelAndView trailer_insertProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		
		Trailer_DataBean trailer_dto = new Trailer_DataBean();
		
		int sizeLimit = 1024*1024*15;
		
		@SuppressWarnings("deprecation")
		String imagePath = request.getRealPath("menu_images");
		
		String filename = "";
			
		MultipartRequest multi = new MultipartRequest( request, imagePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		@SuppressWarnings("rawtypes")
		Enumeration files = multi.getFileNames();

		String file = (String) files.nextElement();
		
		String trailer_name = multi.getParameter("trailer_name");
		String trailer_title = multi.getParameter("trailer_title");
		int trailer_price = Integer.parseInt(multi.getParameter("trailer_price"));
		String trailer_aws_url = multi.getParameter("trailer_aws_url");
		String trailer_detail = multi.getParameter("trailer_detail");	
		String trailer_launchdate = multi.getParameter("trailer_launchdate");
		String user_id = multi.getParameter("session");
		filename = multi.getFilesystemName(file);

		
		trailer_dto.setTrailer_name(trailer_name);
		trailer_dto.setTrailer_title(trailer_title);
		trailer_dto.setTrailer_price(trailer_price);
		trailer_dto.setTrailer_aws_url(trailer_aws_url);
		trailer_dto.setTrailer_detail(trailer_detail);
		trailer_dto.setTrailer_launchdate(trailer_launchdate);
		trailer_dto.setUser_id(user_id);
		trailer_dto.setTrailer_image(filename);

		
		
		
		int result = Trailer_Dao.insertTrailer(trailer_dto);

		int tb_no = trailer_dto.getTrailer_id();// tb_no
		
		
		
		request.setAttribute("tb_no", tb_no);
		request.setAttribute("result", result);


		return new ModelAndView("svc/trailer_insert_pro");
	}
	
	
	
	
	//ajax
	
	@RequestMapping(value = "/commentInsert.go", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void commentInsertProcess(HttpServletRequest request, HttpSession session) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String user_id=(String)request.getSession().getAttribute("user_id");
		String c_content= request.getParameter("comment_content");
		Comment_DataBean cmtDto = new Comment_DataBean();
		if(c_content != null) {
		cmtDto.setUser_id(user_id); // jsp占쎈�占쎄� 占쎌�놂옙諭븝옙��嚥∽옙 揶�占쏙옙議�占쎌�ㅿ���留�
		cmtDto.setTrailer_id(Integer.parseInt(request.getParameter("trailer_id")));
		cmtDto.setComment_content(c_content);
		
		Comment_Dao.insertComment(cmtDto);
		}
	}

	@RequestMapping(value = "/commentSelect.go", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Comment_DataBean> commentSelectProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException {

		int trailer_id = Integer.parseInt(request.getParameter("trailer_id"));
		String user_id = (String) request.getSession().getAttribute("user_id");
		List<Comment_DataBean> comment = Comment_Dao.getComment(trailer_id);
		for (Comment_DataBean dto : comment) {
				dto.setUser_name(user_id);
		}

		request.setAttribute("comment", comment);
		// don't set the name of variable like this!
		return comment;
	}

	@RequestMapping(value = "/commentUpdate.go", method = RequestMethod.POST, produces = "application/json") // 占쎈��疫뀐옙 占쎈��占쎌��
	@ResponseBody
	private void commentUpdateProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Comment_DataBean cmtDto = new Comment_DataBean();
		cmtDto.setComment_id(Integer.parseInt(request.getParameter("comment_id")));
		cmtDto.setComment_content(request.getParameter("comment_content"));
		Comment_Dao.updateComment(cmtDto);
	}

	@RequestMapping(value = "/commentDelete.go", method = RequestMethod.POST) // 占쎈��疫뀐옙 占쎄�占쎌��
	@ResponseBody
	private void commentDeleteProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int comment_id = Integer.parseInt(request.getParameter("comment_id"));
		Comment_Dao.deleteComment(comment_id);
	}
	
	
	
	
	//product_chat
	
	
	@RequestMapping(value = "/insertChat_comment.go", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void insertChat_commentProcess(HttpServletRequest request, HttpSession session) throws HandlerException {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String user_id=(String)request.getSession().getAttribute("user_id");
		
		String c_content= request.getParameter("chat_content");
		Product_chat_DataBean chatDto = new Product_chat_DataBean();
		if(c_content != null) {
		chatDto.setUser_id(user_id); // jsp占쎈�占쎄� 占쎌�놂옙諭븝옙��嚥∽옙 揶�占쏙옙議�占쎌�ㅿ���留�
		chatDto.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		chatDto.setChat_content(c_content+"\r\n");
		
		Product_chat_Dao.insertChat_comment(chatDto);
		}
	}

	
	
	@RequestMapping(value = "/getProduct_chat.go", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Product_chat_DataBean> getProduct_chatProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException {

		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String user_id = (String) request.getSession().getAttribute("user_id");	
		List<Product_chat_DataBean> comment = Product_chat_Dao.getProduct_chat(product_id);
		for (Product_chat_DataBean dto : comment) {
				dto.setUser_name(user_id);
		}

		request.setAttribute("comment", comment);
		// don't set the name of variable like this!
		return comment;
	}
	
	
	
	// Product_review
	@RequestMapping("/product_review_pro")
	public ModelAndView product_review_pro(HttpServletRequest request, HttpServletResponse response) throws IOException {
	try {
		request.setCharacterEncoding("utf-8");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	Product_review_DataBean reviewDto = new Product_review_DataBean();
	
	int sizeLimit = 1024*1024*15;
	
	@SuppressWarnings("deprecation")
	String imagePath = request.getRealPath("menu_images");
	
	File dir = new File(imagePath);
	
	if (!dir.exists()) {
		dir.mkdirs();
	}
	
	
	String filename = "";
		
	MultipartRequest multi = new MultipartRequest( request, imagePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	

	String review_content= multi.getParameter("review_content");
	int review_scope= Integer.parseInt(multi.getParameter("review_score"));
	String user_id = multi.getParameter("session");
	
	@SuppressWarnings("rawtypes")
	Enumeration files = multi.getFileNames();

	String file = (String) files.nextElement();
	filename = multi.getFilesystemName(file);


	
	if(review_content != null) {
		reviewDto.setReview_content(review_content);
		reviewDto.setReview_image(review_content);
		reviewDto.setReview_scope(review_scope);
		reviewDto.setUser_id(user_id);
		reviewDto.setReview_image(filename);
		reviewDto.setProduct_id(Integer.parseInt(multi.getParameter("product_id")));
	
		int result = review_Dao.insertReview(reviewDto);
		request.setAttribute("result", result);

	}	
		
		
	
		

		return new ModelAndView("svc/product_review_pro");
	}
	

	@RequestMapping(value = "/getReview.go", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Product_review_DataBean> getReviewProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException {

		int product_id = Integer.parseInt(request.getParameter("product_id"));
		System.out.println(product_id);
		String user_id = (String) request.getSession().getAttribute("user_id");
		List<Product_review_DataBean> comment = review_Dao.getReview(product_id);
		for (Product_review_DataBean reviewDto : comment) {
			reviewDto.setUser_name(user_id);
		}

		request.setAttribute("comment", comment);
		// don't set the name of variable like this!
		return comment;
	}

	@RequestMapping(value = "/updateReview.go", method = RequestMethod.POST, produces = "application/json") // 占쎈��疫뀐옙 占쎈��占쎌��
	@ResponseBody
	private void updateReviewProcess(HttpServletRequest request, HttpServletResponse response)
			throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Product_review_DataBean reviewDto = new Product_review_DataBean();
		reviewDto.setReview_id(Integer.parseInt(request.getParameter("review_id")));
		reviewDto.setReview_content(request.getParameter("review_content"));
		review_Dao.updateReview(reviewDto);
	}

	@RequestMapping(value = "/deleteReview.go", method = RequestMethod.POST) // 占쎈��疫뀐옙 占쎄�占쎌��
	@ResponseBody
	private void deleteReviewProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int review_id = Integer.parseInt(request.getParameter("review_id"));
		review_Dao.deleteReview(review_id);
	}
	
	
	
}
