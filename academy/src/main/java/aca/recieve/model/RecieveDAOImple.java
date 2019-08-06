package aca.recieve.model;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.mybatis.spring.SqlSessionTemplate;

import aca.joindto.model.StPayDTO;
import aca.joindto.model.SubStPayDTO;
import aca.joindto.model.SubTcDTO;
import aca.joindto.model.SubjectDTO;

public class RecieveDAOImple implements RecieveDAO {

	SqlSessionTemplate sqlMap;
	
	public RecieveDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	//강좌리스트
	public List reciList(String ymstr) {

		List lists = sqlMap.selectList("reciList", ymstr);
		
		return lists;
	}
	
	//강좌료,강사명,강좌명
	public SubTcDTO tcSubList(String tc_idx, String c_name) {
		
		SubTcDTO lists=null;

		Map m = new HashMap();
		m.put("tc_idx", tc_idx);
		m.put("c_name", c_name);
		
		lists = sqlMap.selectOne("subtc", m);
		
		
		return lists;
	}
	
	//수강생리스트
	public List stList(String st_idxs, String c_code) {
			
		List lists=new ArrayList();
		
		StringTokenizer st = new StringTokenizer(st_idxs, ",");
		
		Map m = new HashMap();
		m.put("c_code", c_code);
		
		while(st.hasMoreTokens()) {
			String st_idx1 = st.nextToken();
			m.put("st_idx", st_idx1);
			lists.addAll(sqlMap.selectList("stList", m));
		}
		
		return lists;
	}

	//개인수납내역
	public List personalReciList(String st_idx, String c_code) {
		
		Map m = new HashMap();
		m.put("st_idx", st_idx);
		m.put("c_code", c_code);
		
		List lists = sqlMap.selectList("personalReciList", m);
		
		return lists;
	}
	
	//addForm 파라미터
	public SubTcDTO getAddParam(String st_idx, String c_code) {
			
		Map m = new HashMap();
		m.put("st_idx", st_idx);
		m.put("c_code", c_code);
		
		SubTcDTO dto = sqlMap.selectOne("addParam",m);
		
		return dto;
	}
	
	//수납등록 메소드
	 public int st_recieveAdd(StPayDTO dto) {
		 
		int count = sqlMap.insert("recieveAdd",dto);
		return count;
	}

	 // updateForm 파라미터
	 public SubStPayDTO getUpParam(String p_idx, String st_idx, String c_code) {
		Map m = new HashMap();
		m.put("p_idx", p_idx);
		m.put("st_idx", st_idx);
		m.put("c_code", c_code);
		
		SubStPayDTO dto = sqlMap.selectOne("upParam",m);
			
		return dto;
	}
	 
	 // 수납편집 메소드
	 public int st_recieveUpdate(RecieveDTO dto) {
		 
		System.out.println(dto.getP_bigo());
		int count = sqlMap.update("recieveUpdate",dto);
		return count;
	}
	 
	 // 수납삭제 메소드
	 public int st_recieveDel(String p_idx) {
		
		 int count = sqlMap.delete("recieveDel", p_idx);
		 return count;
	}
	 
	// 개인 학생 총 납부금액
	public List st_reciAllList(String ymstr, String st_idx) {
		Map m = new HashMap();
		m.put("ymstr", ymstr);
		m.put("st_idx", st_idx);
		
		List lists = sqlMap.selectList("stRecieveAllList", m);
		return lists;
	}
	
	//개인 학생 세부 납부금액
	public List st_reciDetailList(String ymstr, String st_idx, String c_code) {
		Map m = new HashMap();
		m.put("ymstr", ymstr);
		m.put("st_idx", st_idx);
		m.put("c_code", c_code);
		
		List lists = sqlMap.selectList("stRecieveDetailList",m);
		return lists;
	}
	
	//pdf를 위한 수강하는 전체 강좌 납부내역 리스트 출력
	public List st_reciPdfList(String ymstr, String st_idx) {
		Map m = new HashMap();
		m.put("ymstr", ymstr);
		m.put("st_idx", st_idx);
			
		List lists = sqlMap.selectList("stRecievePdfList",m);
		return lists;
	}
}
