package aca.student.model;

import java.util.HashMap;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;

import aca.subject.model.SubjectDTO;

public class StudentDAOImple implements StudentDAO {

	public StudentDAOImple() {};
	
	private SqlSessionTemplate sqlMap;
	public StudentDAOImple(SqlSessionTemplate sqlMap) { 
		super();
		this.sqlMap = sqlMap;
	}


	/**원생 main에서 원생 전체목록 출력*/
	public List st_mainList() {
		List st_lists = sqlMap.selectList("studentAllList");
		return st_lists;    //  StController로 이동
	}
	/**원생추가 폼 이동*/
	public String st_addForm() {
		String st_maxIdx = sqlMap.selectOne("addForm");
		if(st_maxIdx==null) {/**원생이 없어서 idx가 없으면 1000으로 시작.*/
			st_maxIdx="1000";
		}
		return st_maxIdx; //  StController로 이동
	}
	/**원생 추가*/
	public int st_addInfo(StudentDTO dto) {
		int count=sqlMap.insert("addStudentInfo",dto);
		return count;
	}
	/**원생 삭제*/
	public int st_delInfo(int st_idx) {
		int count=sqlMap.delete("delStudentInfo",st_idx);
		return count;
	}
	/**목록에서 원생 클릭시  + 학생정보 수정 폼 이동시 개인정보출력*/
	public List st_info(int st_idx) {
		List st_info=sqlMap.selectList("studentInfo",st_idx);		
		return st_info;
	}
	/**학생정보수정*/
	public int st_update(StudentDTO dto) {
		int count=sqlMap.insert("updateStudentInfo",dto);
		return count;
	}
	
	/**원생 검색*/
	public List st_select(StudentDTO dto) {
		if(dto.getSt_name()==null) {
			List st_selectList=sqlMap.selectList("stSelectListByStatus",dto);
			return st_selectList;
		}else {
			List st_selectList=sqlMap.selectList("stSelectList",dto);
			return st_selectList;
		}
		
	}
	
	public List st_att(String st_idx) {
		List st_att=sqlMap.selectList("st_att",st_idx);
		return st_att;
	}
	public List st_subAdded(String st_idx) {
		List st_subAdded = sqlMap.selectList("st_subAdded",st_idx);
		return st_subAdded;
	}


	public SubjectDTO st_subAddChk(String st_idx, String c_code) {
		HashMap map = new HashMap();
		map.put("st_idx", st_idx);
		map.put("c_code", c_code);
		SubjectDTO dto = sqlMap.selectOne("st_subAddChk", map);
		return dto;
	}


	public int st_subAdd(String st_idx, String c_code) {
	      HashMap map = new HashMap();
	      //추가
	      map.put("p_st_idx", st_idx);
	      
	      st_idx=st_idx+",";
	      map.put("st_idx", st_idx);
	      map.put("c_code", c_code);
	      int c = sqlMap.update("st_subAdd",map);
	      
	      //수납테이블에 자동추가
	      sqlMap.insert("st_subAddreciIn",map);
	      return c;
	   }
	
	public int st_subDel(String st_idx,String c_code) {
		HashMap map = new HashMap();
		
		//추가
		map.put("p_st_idx", st_idx);
		st_idx=st_idx+",";
		map.put("st_idx", st_idx);
		map.put("c_code", c_code);
		int c = sqlMap.delete("st_subDel",map);
				
		//수납테이블 0인 로우 삭제
		sqlMap.delete("st_subDelReciDel", map);
				
		return c;
	}
	
	//수납내역 추가
	public List st_reci(String st_idx) {
	    List st_reci = sqlMap.selectList("st_reci", st_idx);
	    return st_reci;
	}

	
}