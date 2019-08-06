package aca.qna.model;
import java.sql.*;
public class QnaDTO {

	private int q_idx;
	private String q_subject;
	private String q_content;
	private Date q_wDate;
	
	private int tc_idx;
	private String tc_name;
	private int c_code;
	private String c_name;
	private int st_idx;
	private String st_name;
	private String r_result;
	public QnaDTO() {
		super();
	}
	public QnaDTO(int q_idx, String q_subject, String q_content, Date q_wDate, int tc_idx, String tc_name, int c_code,
			String c_name, int st_idx, String st_name, String r_result) {
		super();
		this.q_idx = q_idx;
		this.q_subject = q_subject;
		this.q_content = q_content;
		this.q_wDate = q_wDate;
		this.tc_idx = tc_idx;
		this.tc_name = tc_name;
		this.c_code = c_code;
		this.c_name = c_name;
		this.st_idx = st_idx;
		this.st_name = st_name;
		this.r_result = r_result;
	}
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public Date getQ_wDate() {
		return q_wDate;
	}
	public void setQ_wDate(Date q_wDate) {
		this.q_wDate = q_wDate;
	}
	public int getTc_idx() {
		return tc_idx;
	}
	public void setTc_idx(int tc_idx) {
		this.tc_idx = tc_idx;
	}
	public String getTc_name() {
		return tc_name;
	}
	public void setTc_name(String tc_name) {
		this.tc_name = tc_name;
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
	public int getSt_idx() {
		return st_idx;
	}
	public void setSt_idx(int st_idx) {
		this.st_idx = st_idx;
	}
	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}
	public String getR_result() {
		return r_result;
	}
	public void setR_result(String r_result) {
		this.r_result = r_result;
	}
	
	
	

	
	
	
}
