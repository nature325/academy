package aca.teacher.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class TeacherDAOImple implements TeacherDAO {

	private SqlSessionTemplate sqlMap;
	
	public TeacherDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List selectAll() {
		List lists = sqlMap.selectList("tc_allSelect");
		return lists;
	}

	public List teach_select(String tc_name) {
		List lists = sqlMap.selectList("tc_select",tc_name);
		return lists;
	}
	
	public TeacherDTO teach_selectOne(int tc_idx) {
		TeacherDTO dto = sqlMap.selectOne("tc_selectOne", tc_idx);
		return dto;
	}

	public int teach_add(TeacherDTO dto) {
		int c = sqlMap.insert("tc_add", dto);
		return c;
	}

	public int teach_update(TeacherDTO dto) {
		int c = sqlMap.update("tc_update", dto);
		return c;
	}

	public int teach_del(int tc_idx) {
		int c = sqlMap.delete("tc_del", tc_idx);
		return c;
	}
	public List teach_subList(int tc_idx) {
		List teach_subList = sqlMap.selectList("tc_subList", tc_idx);
		return teach_subList;
	}
}
