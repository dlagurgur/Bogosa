package db;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Product_DBBean{
	private SqlSession session = SqlMapClient.getSession();
	
	
	public int insertProduct(Product_DataBean product_dto) {
		return session.insert("db.insertProduct", product_dto);
	}

	public Product_DataBean detialProduct(int product_id) {
		return session.selectOne("db.detialProduct", product_id);
	}
	
	public Product_DataBean getProductid( ) {
		return session.selectOne("db.getUser");
	}
	
	
	public List<Product_DataBean> selectMenusByCategory(int product_category) {
		return session.selectList("db.selectMenusByCategory", product_category);
	}
		
	public List<Product_DataBean> selectMenus() {
		return session.selectList("db.selectMenus");
	}
	
}
