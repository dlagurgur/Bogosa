package db;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.SqlMapClient;


public class Comment_DBBean {
	private SqlSession session = SqlMapClient.getSession();
	
	public int insertComment(Comment_DataBean cmtDto) {
		return session.insert("db.insertComment", cmtDto);
	}
	
	public List<Comment_DataBean> getComment( int tb_no ) {
		return session.selectList("db.getComment", tb_no);
	}
	
	public int updateComment(Comment_DataBean cmtDto) {
		return session.update("db.updateComment", cmtDto);
	}
	
	public int deleteComment( int c_id ) {
		return session.delete("db.deleteComment", c_id);
	}

	
}
