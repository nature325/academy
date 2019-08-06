package aca.notice.model;


import java.sql.Date;
public class NoticeDTO {

	private int n_idx; //번호 게시물 번호
	private String n_head; //말머리 컬럼  전체공지,일반공지 판단 컬럼 
	private	String n_subject;//제목
	private	String n_content; //내용	
	private Date n_wdate; //작성일
	private int c_code;	//강좌번호 		전체공지가 아닐시, 해당강좌로 조회할수있게
	
	
	private String c_name;


	public NoticeDTO() {
		super();
	}


	public NoticeDTO(int n_idx, String n_head, String n_subject, String n_content, Date n_wdate, int c_code,
			String c_name) {
		super();
		this.n_idx = n_idx;
		this.n_head = n_head;
		this.n_subject = n_subject;
		this.n_content = n_content;
		this.n_wdate = n_wdate;
		this.c_code = c_code;
		this.c_name = c_name;
	}


	public int getN_idx() {
		return n_idx;
	}


	public void setN_idx(int n_idx) {
		this.n_idx = n_idx;
	}


	public String getN_head() {
		return n_head;
	}


	public void setN_head(String n_head) {
		this.n_head = n_head;
	}


	public String getN_subject() {
		return n_subject;
	}


	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}


	public String getN_content() {
		return n_content;
	}


	public void setN_content(String n_content) {
		this.n_content = n_content;
	}


	public Date getN_wdate() {
		return n_wdate;
	}


	public void setN_wdate(Date n_wdate) {
		this.n_wdate = n_wdate;
	}


	public int getC_code() {
		return c_code;
	}


	public void setC_code(int c_code) {
		this.c_code = c_code;
	}


	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	
	

}	