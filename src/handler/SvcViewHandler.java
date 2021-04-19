package handler;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import db.UserDBBean;
import db.UserDataBean;


@Controller
public class SvcViewHandler {
	private static final int PHOTOSIZE=6;//占쎈립 占쎌넅筌롫똻肉� �빊�뮆�젾占쎈┷占쎈뮉 占쎄텢筌욑옙 揶쏆뮇�땾
	
	private static final String MAP="0";
	
	@Resource
	private UserDBBean userDao;

	
	/////////////////////////////////default pages/////////////////////////////////
	
	
	/////////////////////////////////user pages/////////////////////////////////
	
	@RequestMapping("/myPage")
	public ModelAndView svcMyPageProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//I don't know why but it fails to get userDto, so here I try to get it.
		String user_id=(String)request.getSession().getAttribute("user_id");
	
		if(user_id!=null) {
			UserDataBean userDto=userDao.selectCustomer(user_id);
			System.out.println(userDto);
			request.setAttribute("userDto", userDto);
			
			
		}
		return new ModelAndView("svc/myPage");
	}
	
	
}
