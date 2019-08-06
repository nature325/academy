package aca.student.model;

import java.util.List;

import aca.subject.model.SubjectDTO;

public interface StudentDAO {

	public List st_mainList();//원생전체리스트	
	public String st_addForm();//원생추가폼 이동
	public int st_addInfo(StudentDTO dto); //원생추가	
	public List st_info(int st_idx);//원생정보Info 출력 + 수정시에도 쓰임
	public int st_update(StudentDTO dto);
	public List st_select(StudentDTO dto );
	public int st_delInfo(int st_idx); //원생 정보 삭제
	public List st_att(String st_idx);
	public List st_subAdded(String st_idx);		// 수연 추가
	public SubjectDTO st_subAddChk(String st_idx,String c_code);
	public int st_subAdd(String st_idx,String c_code);
	public int st_subDel(String st_idx,String c_code);
	public List st_reci(String st_idx); // 한세빈 추가

}
