package aca.notice.model;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class NoticeDAOImple implements NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlMap;
	
	
	public NoticeDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public List notice_subList() {
		List lists=sqlMap.selectList("notice_subList");
		return lists;
	}
	
	//작성

    public int noti_addForm(NoticeDTO dto)  {
    	
       int count= sqlMap.insert("noti_insert",dto);
        return count;
    }
    //상세보기 수정
  
    public NoticeDTO noti_view(int n_idx)  {
        return sqlMap.selectOne("noti_view", n_idx);
    }
    public int noti_update(NoticeDTO dto)  {
        int c = sqlMap.update("noti_update", dto);
        return c;
    }
    
    
    
    //보기
    public NoticeDTO noti_content(int n_idx) {
    	return sqlMap.selectOne("noti_content", n_idx);
    }
    
    
    
    
    //삭제
    
    public int noti_delete(int n_idx)  {
    	int c = sqlMap.delete("noti_delete", n_idx);
    	return c;
    }
    //전체 목록
    public List listAll(String searchOption,String keyword,String n_head,int start, int end) {
    
    	//검색옵션, 키워드 
    	Map map=new HashMap();
    	map.put("searchOption", searchOption);
    	map.put("keyword", keyword);
    	map.put("start", start);
    	map.put("end", end);
    	map.put("n_head", n_head);
    	
    	return sqlMap.selectList("noti_listAll", map);
    }

    
    //공지사항 갯수
	public int count(String searchOption, String keyword, String n_head) {
		
		Map<String ,String> map=new HashMap<String ,String >();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("n_head", n_head);
		return sqlMap.selectOne("count",map);
	}
	

	





   
    

}
