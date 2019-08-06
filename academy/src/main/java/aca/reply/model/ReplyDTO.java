package aca.reply.model;

import java.sql.Date;

public class ReplyDTO {
	
	private int q_idx;
	private String r_content;
	java.sql.Date r_wdate;
	public ReplyDTO() {
		super();
	}
	public ReplyDTO(int q_idx, String r_content, Date r_wdate) {
		super();
		this.q_idx = q_idx;
		this.r_content = r_content;
		this.r_wdate = r_wdate;
	}
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public java.sql.Date getR_wdate() {
		return r_wdate;
	}
	public void setR_wdate(java.sql.Date r_wdate) {
		this.r_wdate = r_wdate;
	}
	
	
}
