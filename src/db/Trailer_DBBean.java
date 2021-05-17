package db;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class Trailer_DBBean{
	private SqlSession session = SqlMapClient.getSession();
	

	public int insertTrailer(Trailer_DataBean trailer_dto) {
		return session.insert("db.insertTrailer", trailer_dto);
	}

	
	public Trailer_DataBean detialProduct(int product_id) {
		return session.selectOne("db.detialProduct", product_id);
	}



	public List<Product_DataBean> selectProduct(String user_id) {
		return session.selectOne("db.selectProduct", user_id);
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
