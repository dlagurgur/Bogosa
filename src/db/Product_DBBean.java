package db;


import org.apache.ibatis.session.SqlSession;


import bean.SqlMapClient;

public class Product_DBBean{
	private static SqlSession session = SqlMapClient.getSession();
	
	
	public static int insertProduct(Product_DataBean product_dto) {
		return session.insert("db.insertProduct", product_dto);
	}
	
}
