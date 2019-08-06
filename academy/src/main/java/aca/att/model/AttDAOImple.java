package aca.att.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import aca.subject.model.SubjectDAO;
import aca.subject.model.SubjectDTO;

public class AttDAOImple implements AttDAO {

	private SqlSessionTemplate sqlMap;	
	
	
	public AttDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}



	public List att_showRelSt(Map map) {
		
		List lists=sqlMap.selectList("att_showRelSt",map);
		return lists;
	}
	
	public List att_showRelStAtt(Map map) {
		System.out.println(map.get("c_sdate"));
		List lists=sqlMap.selectList("att_showRelStAtt",map);
		return lists;
	}
	
	public int att_update(AttDTO dto) {
		int count=sqlMap.insert("att_update",dto);
		return count;
	}
	
	public int att_checkAll(Map map) {
		int count=sqlMap.insert("att_checkAll",map);		
		return count;
	}
	public List att_st_subList(String st_idx) {
		List lists=sqlMap.selectList("att_st_subList",st_idx);		
		return lists;
	}
	public List att_st_attList(Map map) {
		ArrayList arr=(ArrayList)map.get("day");		
		List lists=sqlMap.selectList("att_st_attList",map);
		return lists;
	}
	public SubjectDTO att_st_subjectInfo(String c_code) {
		SubjectDTO dto=sqlMap.selectOne("att_st_subjectInfo",c_code);
		return dto;
	}
	
}