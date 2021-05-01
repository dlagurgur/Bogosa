package handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import db.Product_DBBean;
import db.Product_DataBean;
import db.UserDBBean;
import db.UserDataBean;


@Controller
public class Svc_Form{
	
	@Resource
	private UserDBBean userDao;

	
	@Resource
	private Product_DBBean Product_Dao;
	
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
		
		return new ModelAndView("svc/product_insert_form");
	}
	
	
	
	@RequestMapping("/product_detail")
	public ModelAndView product_detailprocess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int product_id=Integer.parseInt(request.getParameter("product_id"));
		Product_DataBean Produt_dto = Product_Dao.detialProduct(product_id);
		request.setAttribute("Produt_dto", Produt_dto);
		
		return new ModelAndView("svc/product_detail");
	}
	
	
	
	@RequestMapping("/product_main")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		int product_category=Integer.parseInt(request.getParameter("menu_category"));
		System.out.println(product_category);
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
	
	
	///////실시간 채팅//////
	@RequestMapping( "comment" )
	public ModelAndView commentProcess(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
	
	        final int SERVER_PORT = 5000;

	        ServerSocket serverSocket = null;

	        try{
	            // 1. 서버 소켓 객체 생성
	            serverSocket = new ServerSocket();

	            // 2. 소켓을 호스트의 포트와 binding
	            String localHostAddress = InetAddress.getLocalHost().getHostAddress();
	            serverSocket.bind(new InetSocketAddress(localHostAddress, SERVER_PORT));
	            System.out.println("[server] binding! \naddress:" + localHostAddress + ", port:" + SERVER_PORT);

	            // 3. 클라이언트로부터 연결 요청이 올 때까지 대기
	            // 연결 요청이 오기 전까지 서버는 block 상태이며,
	            // TCP 연결 과정인 3-way handshake로 연결이 되면 통신을 위한 Socket 객체가 반환됨
	            // TCP 연결은 java에서 처리해주며, 더 내부적으로는 OS가 처리한다.
	            Socket socket = serverSocket.accept();

	            // 4. 연결 요청이 오면 연결이 되었다는 메시지 출력
	            InetSocketAddress remoteSocketAddress =(InetSocketAddress)socket.getRemoteSocketAddress();
	            String remoteHostName = remoteSocketAddress.getAddress().getHostAddress();
	            int remoteHostPort = remoteSocketAddress.getPort();
	            System.out.println("[server] connected! \nconnected socket address:" + remoteHostName
	                    + ", port:" + remoteHostPort);

	        }
	        catch(IOException e){
	            e.printStackTrace();
	        }
	        finally{
	            try{
	                if( serverSocket != null && !serverSocket.isClosed() ){
	                    serverSocket.close();
	                }
	            }
	            catch(IOException e){
	                e.printStackTrace();
	            }
	        }
			return null;
	    }
	

	
}
