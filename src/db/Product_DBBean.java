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
	
	
	public Trailer_DataBean product_trailer_select(int trailer_id) {
		return session.selectOne("db.product_trailer_select", trailer_id);
	}
	
	
	
	public List<Product_DataBean> selectProduct(String user_id) {
		return session.selectList("db.selectProduct", user_id);
	}
	
	
	
	public int selectCountProduct(String user_id) {
		return session.selectOne("db.selectCountProduct", user_id);
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
	
	
	
	
	
	public List<Product_DataBean> findTripByKeyword(String keyword) {
		return session.selectList("db.findTripByKeyword", keyword);
	}
	
	
	
	public List<Product_DataBean> findTripByUser(String keyword) {
		return session.selectList("db.findTripByUser", keyword);
	}
	
	
	public List<Product_DataBean> findTripTitle(String keyword) {
		return session.selectList("db.findTripTitle", keyword);
	}
	
	
	public int Product_off(int product_id) {
		return session.update("db.Product_off", product_id);
	}
	
	
	
	public int trailer_delete(int trailer_id) {
		return session.delete("db.trailer_delete", trailer_id);
	}
	
	

	
	
}
