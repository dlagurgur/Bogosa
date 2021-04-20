package handler;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.UserDBBean;
import db.UserDataBean;


@Controller
public class Svc_Form{
	@Resource
	private UserDBBean userDao;
	
	// 회원 가입
	@RequestMapping("/join")
	public ModelAndView JoinProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String result="회원 가입 페이지입니다.";
		request.setAttribute("result", result);
		return new ModelAndView("svc/svc_join");
	}
	
	
	@RequestMapping( "/login" )
	public ModelAndView LoginProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView( "svc/login" );
	}
	
	@RequestMapping( "/main" )
	public ModelAndView MainProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView( "svc/main" );
	}
	
	@RequestMapping("/EmailId")
	public ModelAndView svcEmailIdProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView("svc/EmailId");
	}
	
	@RequestMapping("/EmailPasswd")
	public ModelAndView svcEmailPasswd(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		return new ModelAndView("svc/EmailPasswd");
	}
	
	
//	@RequestMapping("/update")
//	public ModelAndView svcupdateprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
//		//정보 얻어오기
//		
//		String user_id=(String)request.getSession().getAttribute("user_id");
//		
//		
//		UserDataBean  userDto = userDao.selectCustomer(user_id);
//		request.setAttribute("userDto", userDto);		
//		
//		
//		return new ModelAndView("svc/user_update");
//	}
//	
//	@RequestMapping("/delete")
//	public ModelAndView svcdeleteprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
//		
//		return new ModelAndView("svc/user_delete");
//	}
//	
//	
//	@RequestMapping("/myPage")
//	public ModelAndView svcMyPageProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
//		//I don't know why but it fails to get userDto, so here I try to get it.
//		String user_id=(String)request.getSession().getAttribute("user_id");
//	
//		if(user_id!=null) {
//			UserDataBean userDto=userDao.getUser(user_id);
//			request.setAttribute("userDto", userDto);					
//		}
//		return new ModelAndView("svc/myPage");
//	}

	
}
