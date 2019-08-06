package aca.subject.model;
import java.util.*;

import aca.teacher.model.TeacherDTO;

public interface SubjectDAO {
	public List subject_selectByDate(Map map);	//내꼬
	public List sub_select();
	public List sub_select(String cho, String name);
	public TeacherDTO sub_selectOne(int c_code);
	public int sub_add(SubjectDTO dto);
	public int sub_update(TeacherDTO dto);
	public int sub_del(int c_code);
	public List select_tc();
}
