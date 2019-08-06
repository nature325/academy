package aca.reply.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ReplyDAOImple implements ReplyDAO {
	private SqlSessionTemplate sqlMap;

	public ReplyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int reply_write(ReplyDTO rdto) {		
		sqlMap.insert("reply_write",rdto);
		return 0;
	}
	
	public ReplyDTO reply_select(int q_idx) {
		ReplyDTO rdto=sqlMap.selectOne("reply_select",q_idx);
		return rdto;
	}
	
	public int reply_delete(int q_idx) {
		int count=sqlMap.delete("reply_delete",q_idx);
		return count;
	}
	
}
