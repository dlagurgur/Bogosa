package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Svc_Form{
	
	
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
}
