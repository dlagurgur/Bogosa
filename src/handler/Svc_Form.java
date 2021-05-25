package handler;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import db.Order_history_select_DBBean;
import db.Order_history_select_DataBean;
import db.Product_DBBean;
import db.Product_DataBean;
import db.Trailer_DBBean;
import db.Trailer_DataBean;
import db.UserDBBean;
import db.UserDataBean;



@Controller
public class Svc_Form{
	
	@Resource
	private UserDBBean userDao;

	
	@Resource
	private Product_DBBean Product_Dao;
	
	
	@Resource
	private Order_history_select_DBBean Order_history_selectDao;
	
	@Resource
	private Trailer_DBBean Trailer_Dao;
	
	
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
	
	
	@RequestMapping("/update")
	public ModelAndView svcupdateprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//정보 얻어오기
		
		String user_id=(String)request.getSession().getAttribute("user_id");
		
		
		UserDataBean  userDto = userDao.selectCustomer(user_id);
		request.setAttribute("userDto", userDto);		
		
		
		return new ModelAndView("svc/user_update");
	}
	
	@RequestMapping("/delete")
	public ModelAndView svcdeleteprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		return new ModelAndView("svc/user_delete");
	}
	
	
	@RequestMapping("/myPage")
	public ModelAndView svcMyPageProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//I don't know why but it fails to get userDto, so here I try to get it.
		String user_id=(String)request.getSession().getAttribute("user_id");
	
		if(user_id!=null) {
			UserDataBean userDto=userDao.getUser(user_id);
			request.setAttribute("userDto", userDto);					
		}
		return new ModelAndView("svc/myPage");
	}
	
	
	
	
	
	//////////////상품 영역 //////////////////

	@RequestMapping("/product_insert")
	public ModelAndView product_insertprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=(String)request.getSession().getAttribute("user_id");
		
	
			UserDataBean userDto=userDao.getUser(user_id);
			request.setAttribute("userDto", userDto);
		
			
		return new ModelAndView("svc/product_insert_form");
	}
	
	
	@RequestMapping("/trailer_product_insert_form")
	public ModelAndView trailer_product_insertprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=(String)request.getSession().getAttribute("user_id");
		int trailer_id=Integer.parseInt(request.getParameter("trailer_id"));
	
			UserDataBean userDto=userDao.getUser(user_id);
			request.setAttribute("userDto", userDto);
	
			Trailer_DataBean product_dt = Product_Dao.product_trailer_select(trailer_id);
			request.setAttribute("product_dt", product_dt);
	
		
		
			
		return new ModelAndView("svc/trailer_product_insert_form");
	}
	
	
	
	
	
	@RequestMapping("/product_detail")
	public ModelAndView product_detailprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int product_id=Integer.parseInt(request.getParameter("product_id"));
		Product_DataBean Produt_dto = Product_Dao.detialProduct(product_id);
		request.setAttribute("Produt_dto", Produt_dto);
		
		return new ModelAndView("svc/product_detail");
	}
	
	
	
	@RequestMapping("/product_select")
	public ModelAndView product_selectprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=(String)request.getSession().getAttribute("user_id");

		int result = Product_Dao.selectCountProduct(user_id);	
		
		
		
		
		
		List <Product_DataBean> Produt_dto = Product_Dao.selectProduct(user_id);
		System.out.println(Produt_dto);
		request.setAttribute("result", result);
		request.setAttribute("Produt_dto", Produt_dto);
		
		return new ModelAndView("svc/product_select");
	}
	
	
	
	
	
	
	
	
	@RequestMapping("/product_main")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int product_category=Integer.parseInt(request.getParameter("menu_category"));
		if(product_category > 0) {

			
			
			List<Product_DataBean> menus1=Product_Dao.selectMenusByCategory(product_category);
			
		
			
			List<Product_DataBean> menus=Stream.of(menus1).flatMap(x->x.stream()).collect(Collectors.toList());
			request.setAttribute("menus", menus);
			
		} else {

			
			
				// 메뉴카테고리 0: 전체메뉴 (웹으로 처리하는 사항)
				
				List<Product_DataBean> menus=Product_Dao.selectMenus();
				request.setAttribute("menus", menus);
				
			
		}
		return new ModelAndView("svc/product_main");
	}
	
	
	///////주문 관련//////
	@RequestMapping("/order_insert")
	public ModelAndView order_insertprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
	
	String  user_id = (String) request.getSession().getAttribute("user_id");
	System.out.println(user_id);
	
	UserDataBean userDto = userDao.selectCustomer(user_id);	//신상정보
	request.setAttribute("userDto", userDto);
	
	return new ModelAndView("svc/order_insert");
	
	}
	
	
	
	
	///////주문기록/////////////////
	
	///주문내역 확인/////
	@RequestMapping("/Order_history_select")
	public ModelAndView Order_history_selectProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//I don't know why but it fails to get userDto, so here I try to get it.
		String user_id=(String)request.getSession().getAttribute("user_id");

		int result = Order_history_selectDao.selectCountOrders(user_id);	
			
		
		List <Order_history_select_DataBean> cusorderlist = Order_history_selectDao.Select_order_history(user_id);
		request.setAttribute("cusorderlist", cusorderlist);
		request.setAttribute("result", result);	
		return new ModelAndView("svc/Order_history_select");
	}
	

	
	@RequestMapping("/detailed_order_history")
	public ModelAndView detailed_order_historyProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//I don't know why but it fails to get userDto, so here I try to get it.
		int order_num= Integer.parseInt(request.getParameter("order_num"));
		String order_date = request.getParameter("order_date");
		
		List <Order_history_select_DataBean> order_historyDto = Order_history_selectDao.detailed_order_history(order_num);

			
		request.setAttribute("order_historyDto", order_historyDto);	
		request.setAttribute("order_num", order_num);		
		request.setAttribute("order_date", order_date);		
		return new ModelAndView("svc/detailed_order_history");
	}
	
	
	
	
	///판매한 물품 확인/////
		@RequestMapping("/Order_confirmation")
		public ModelAndView Order_confirmationProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			//I don't know why but it fails to get userDto, so here I try to get it.
			String user_id=(String)request.getSession().getAttribute("user_id");
			
			int result = Order_history_selectDao.selectconfirmation(user_id);	

			List <Order_history_select_DataBean> cusorderlist = Order_history_selectDao.Order_confirmation(user_id);
			request.setAttribute("cusorderlist", cusorderlist);
			request.setAttribute("result", result);
			
			return new ModelAndView("svc/Order_confirmation");
		}



		
		//////////// 라이브 예정 페이지 /////////////////////////////
		@RequestMapping("/trailer_insert")
		public ModelAndView trailer_insertprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			
			String user_id=(String)request.getSession().getAttribute("user_id");

			UserDataBean userDto=userDao.getUser(user_id);
			request.setAttribute("userDto", userDto);
				
			return new ModelAndView("svc/trailer_insert_form");
		}
		
		
		@RequestMapping("/trailer_detail")
		public ModelAndView trailer_detailprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			
			int trailer_id=Integer.parseInt(request.getParameter("trailer_id"));
			Trailer_DataBean Trailer_dto = Trailer_Dao.detailTrailer(trailer_id);
			request.setAttribute("Trailer_dto", Trailer_dto);	
			
			return new ModelAndView("svc/trailer_detail");
		}
		
		
		@RequestMapping("/trailer_main")
		public ModelAndView trailer_mainprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			
			List <Trailer_DataBean> Trailer_dto = Trailer_Dao.allTrailer();
			
			request.setAttribute("Trailer_dto", Trailer_dto);
			return new ModelAndView("svc/trailer_main");
		}
		
		
		@RequestMapping("/trailer_select")
		public ModelAndView trailer_selectprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			String user_id=(String)request.getSession().getAttribute("user_id");

			int result = Trailer_Dao.selectCounttrailer(user_id);	
			
			System.out.println(result);
			
			List <Trailer_DataBean> Trailer_dto = Trailer_Dao.trailer_select(user_id);

			request.setAttribute("result", result);
			request.setAttribute("Trailer_dto", Trailer_dto);
			
			return new ModelAndView("svc/trailer_select");
		}
		
		
		
		//검색기능
		@RequestMapping("/search")
		public ModelAndView svcSearchProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException, UnsupportedEncodingException {
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			//get the type and keyword of searching
			String selectedType=request.getParameter("search_type");
			String keyword=request.getParameter("keyword");
			
			//set List
			List<Product_DataBean> foundList;
			
			//find trips for each type
			if(selectedType.equals("name")) {
				foundList=Product_Dao.findTripByUser(keyword);
			}else if(selectedType.equals("title")) {
				foundList=Product_Dao.findTripTitle(keyword);
			}else {
				foundList=Product_Dao.findTripByKeyword(keyword);
			}
			
			int count=0;
			if(foundList.size()>0) {
				count=foundList.size();
			}
			request.setAttribute("count", count);
			request.setAttribute("foundList", foundList);
			return new ModelAndView("svc/foundList");
		}
	
}
