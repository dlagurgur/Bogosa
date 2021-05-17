package db;


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

	
}
