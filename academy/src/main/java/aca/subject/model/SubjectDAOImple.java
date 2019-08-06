package aca.subject.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import aca.teacher.model.TeacherDTO;

public class SubjectDAOImple implements SubjectDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public SubjectDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}



	public List subject_selectByDate(Map map) {
		
		List lists=sqlMap.selectList("subject_selectByDate",map);		
		
		return lists;
	}	
	
	public List sub_select() {
		List lists = sqlMap.selectList("subject_allselect");
		return lists;
	}

	
	
	
	
	public List sub_select(String cho, String name) {
		if(cho.equals("c_name")) {
			cho = "subject.c_name";
		} else if(cho.equals("tc_name")) {
			cho = "teacher.tc_name";
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cho", cho);
		map.put("name", name);
		List lists = sqlMap.selectList("sub_select", map);
		return lists;
	}

	public TeacherDTO sub_selectOne(int c_code) {
		TeacherDTO dto = sqlMap.selectOne("sub_selectOne",c_code);
		return dto;
	}
	
	public int sub_add(SubjectDTO dto) {
		int c = sqlMap.insert("sub_add", dto);
		return c;
	}

	public int sub_update(TeacherDTO dto) {
		int c = sqlMap.update("sub_update", dto);
		return c;
	}

	public int sub_del(int c_code) {
		int c = sqlMap.delete("sub_del", c_code);
		return c;
	}

	public List select_tc() {
		List lists = sqlMap.selectList("select_tc");
		return lists;
	}
	
	
	
	
	
	

}
