package db;


import java.util.List;


import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;


public class Order_history_select_DBBean {
	
	private SqlSession session = SqlMapClient.getSession();
	
	public List<Order_history_select_DataBean> Order_confirmation(String user_id) {
		return session.selectOne("db.Order_confirmation", user_id);
	}
	
	
	public List<Order_history_select_DataBean> Select_order_history(String user_id) {
		return session.selectOne("db.Select_order_history", user_id);
	}

	
}
