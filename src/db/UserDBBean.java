package db;


import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;

public class UserDBBean {
	private SqlSession session=SqlMapClient.getSession();

	public int insertUser( UserDataBean UserDto ) {
		return session.insert("db.insertUser", UserDto);
	}
	
	public int EmailCheck( String user_email ) {
		return session.selectOne( "db.EmailCheck", user_email);
	}
	public int nameCheck( String user_name ) {
		return session.selectOne( "db.nameCheck", user_name);
	}
	public int idCheck( String user_id ) {
		return session.selectOne( "db.idCheck", user_id);
	}

	public int deleteUser( String user_id ) {
		return session.delete("db.deleteUser", user_id);
	}



	
	

}
