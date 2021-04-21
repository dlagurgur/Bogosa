package bean;

import org.springframework.context.annotation.Bean;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import db.Order_history_DBBean;
import db.UserDBBean;


@Configuration
public class CreateBean {
	@Bean
	public UserDBBean userDao() {
		return new UserDBBean();
	}
	
	
	@Bean
	public Order_history_DBBean Order_history_Dao() {
		return new Order_history_DBBean();
	}
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver=new UrlBasedViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
}