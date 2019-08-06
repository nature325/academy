package aca.teacher.model;

import java.util.List;

public interface TeacherDAO {
	
	public List selectAll();
	public List teach_select(String tc_name);
	public TeacherDTO teach_selectOne(int tc_idx);
	public int teach_add(TeacherDTO dto);
	public int teach_update(TeacherDTO dto);
	public int teach_del(int tc_idx);
	public List teach_subList(int tc_idx);
}
