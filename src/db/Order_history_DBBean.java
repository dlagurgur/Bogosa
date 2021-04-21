package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Order_history_DBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	
	public List<Order_history_DataBean> selectOrders(Map<String, String> map) {
		return session.selectList("Order_history.selectOrders", map);
	}
	

	public List<Order_history_DataBean> selectOrdersByCus(Map<String, String> map) {
		return session.selectList("Order_history.selectOrdersByCus", map);
	}


	public List<Order_history_DataBean> selectOrdersByStore(Map<String, String> map) {
		return session.selectList("Order_history.selectOrdersByStore", map);
	}
	
	
	public List<Order_history_DataBean> selectOrder(int order_no) {
		return session.selectList("Order_history.selectOrder", order_no);
	}
	

	
}
