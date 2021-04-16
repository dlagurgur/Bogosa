/*
 * !!! 占쏙옙占실삼옙占쏙옙 !!!
 * 占쏙옙占쏙옙 void, 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쌨소듸옙 占싱몌옙占쏙옙 占쏙옙占쏙옙占쌔듸옙 占쏙옙占쏙옙.
 * 占쌨소드마占쏙옙 占쏙옙占쏙옙 占쏙옙, 占쏙옙占쏙옙 占싯아쇽옙 채占쏙옙 占쏙옙占쏙옙 占쏙옙.
 */

package db;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;
 
public class UserDBBean {
	private SqlSession session=SqlMapClient.getSession();
	
	
	public int check(String user_id) {
		return session.selectOne("db.checkId", user_id);
	}
	
	

	public int insertUser( UserDataBean UserDto ) {
		return session.insert("db.insertUser", UserDto);
	}
	
	
	public UserDataBean getUserEmailId(String user_email) { 
		return session.selectOne("db.getUserEmailId", user_email); 
	} 
	
	public UserDataBean getUserEmailPasswd(String user_email) { 
		return session.selectOne("db.getUserEmailPasswd", user_email); 
	} 
	
	public int EmailCheck( String user_email ) {
		return session.selectOne( "db.EmailCheck", user_email);
	}

	public int idCheck( String user_id ) {
		return session.selectOne( "db.idCheck", user_id);
	}
	public int check(String user_id, String user_pw) {
		int result = 0;		
		if( check( user_id ) > 0 ) {
			// 아이디가 있다
			//LogonDataBean memberDto = getMember( id );
			UserDataBean UserDto = selectCustomer( user_id );
			if( user_pw.equals( UserDto.getUser_pw() ) ) {
				result = 1;
			} else {
				result = -1;
			}				
		} else {
			// 아이디가 없다
			result = 0;				
		}
		return result;
	}
	
	
	public UserDataBean selectCustomer(String user_id) {
		return session.selectOne("db.selectCustomer", user_id);
	}
	


}
