package aca.qna.model;
import java.util.*;

import aca.subject.model.SubjectDTO; 



public interface QnaDAO {

	public int qna_count(int c_code);
	public List qna_allList(int c_code,int startrow,int endrow);	
	public List qna_getC_code();
	public int qna_write(QnaDTO dto);
	public QnaDTO qna_content(int q_idx);
	public int qna_conDel(int q_idx);
	public List qna_conUpdate(int q_idx, SubjectDTO dto);
	public int qna_conUpdate_ok(QnaDTO dto);
	public List qna_search(String q_subject);
}
