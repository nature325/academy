package aca.notice.model;

import java.util.*;


public interface NoticeDAO {
	//강좌 리스트 불러오기
	public List notice_subList();
	// 글쓰기 작성
    public int noti_addForm(NoticeDTO dto) ;
    //  글 수정
    public NoticeDTO noti_view(int n_idx) ;
    public int noti_update(NoticeDTO dto) ;
   
    
    //글조회
    public NoticeDTO noti_content(int n_idx);
    
    
    //  삭제
    public int noti_delete(int n_idx) ;
   
    // 전체 목록  검색옵션 페이징 추가 
    public List<NoticeDTO> listAll(String searchOption, String keyword,String n_head,int start,int end);
   
    //공지사항 갯수 메서드 추가
    public int count(String searchOption, String keyword, String n_head);

    
  
    
    
  
	
}
