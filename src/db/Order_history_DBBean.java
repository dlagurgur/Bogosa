package db;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;


public class Order_history_DBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	
	public int insertOrder(Order_history_DataBean order_history_dto) {
		return session.insert("db.insertOrder", order_history_dto);
	}


	
}
