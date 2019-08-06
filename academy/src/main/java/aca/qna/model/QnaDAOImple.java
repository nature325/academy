package aca.qna.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import aca.student.model.StudentDTO;
import aca.subject.model.SubjectDTO;


public class QnaDAOImple implements QnaDAO {

	public QnaDAOImple() {};
	private SqlSessionTemplate sqlMap;
	
	public QnaDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int qna_count(int c_code) {
		QnaDTO dto=new QnaDTO();
		dto.setC_code(c_code);
		int count=sqlMap.selectOne("qnaCount",dto);
		return count;// >QnaController
	}
	/**QnA게시판 메인, 전체 질문글 출력*/
	public List qna_allList(int c_code,int startrow,int endrow) {
		Map map=new HashMap();
		map.put("c_code", c_code);
		map.put("startrow", startrow);
		map.put("endrow", endrow);
		List qna_list=sqlMap.selectList("qnaAllList",map);
		return qna_list;// >QnaController
	}
	
	
	
	/**QnA질문글 올리기 Form으로 이동*/
	public List qna_getC_code() {
		List c_code=sqlMap.selectList("qnaWriteForm");
		return c_code;
	}
	/**QnA질문글 올리기*/
	public int qna_write(QnaDTO dto) {
		int count=sqlMap.insert("qnaWrite",dto);
		return count;
	}
	/**QnA 글 내용 보기 Content*/
	public QnaDTO qna_content(int q_idx) {
		QnaDTO q_contents=sqlMap.selectOne("qnaContent",q_idx);
		q_contents.setQ_content(q_contents.getQ_content().replaceAll("\n", "<br>"));
		return q_contents;
	}
	/**QnA 글 삭제*/
	public int qna_conDel(int q_idx) {
		int count=sqlMap.delete("qnaContentDel",q_idx);
		return count;
	}
	/**QnA 글 편집 폼으로 이동*/
	public List qna_conUpdate(int q_idx, SubjectDTO dto) {
		
		List q_updateForm = sqlMap.selectList("qnaConUpdate",q_idx);
		return q_updateForm;
	}
	/**QnA 글편집 기능*/
	public int qna_conUpdate_ok(QnaDTO dto) {
												//System.out.println(dto.getQ_subject());
		int count=sqlMap.update("qnaConUpdate_ok",dto);
		return count;
	}
	/**QnA글제목 조회 기능*/
	public List qna_search(String q_subject) {
		List q_searchList=sqlMap.selectList("qna_search",q_subject);
		return q_searchList;
	}

	
}
