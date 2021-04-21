package db;


import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Product_DBBean{
	private SqlSession session = SqlMapClient.getSession();
	
	
}
