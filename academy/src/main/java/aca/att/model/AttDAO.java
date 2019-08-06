package aca.att.model;

import java.util.List;
import java.util.Map;

import aca.subject.model.SubjectDTO;

public interface AttDAO {
	
	public List att_showRelSt(Map map);
	public List att_showRelStAtt(Map map);
	public int att_update(AttDTO dto);
	public int att_checkAll(Map map);
	public List att_st_subList(String st_idx);
	public List att_st_attList(Map map);
	public SubjectDTO att_st_subjectInfo(String c_code);
}
