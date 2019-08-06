package aca.att.model;

import java.sql.Date;

public class AttDTO {

	private int st_idx;
	private int c_code;
	private String att_bigo;
	private String att_divide;
	private String att_date;
	public AttDTO() {
		super();
	}
	public AttDTO(int st_idx, int c_code, String att_bigo, String att_divide, String att_date) {
		super();
		this.st_idx = st_idx;
		this.c_code = c_code;
		this.att_bigo = att_bigo;
		this.att_divide = att_divide;
		this.att_date = att_date;
	}
	public int getSt_idx() {
		return st_idx;
	}
	public void setSt_idx(int st_idx) {
		this.st_idx = st_idx;
	}
	public int getC_code() {
		return c_code;
	}
	public void setC_code(int c_code) {
		this.c_code = c_code;
	}
	public String getAtt_bigo() {
		return att_bigo;
	}
	public void setAtt_bigo(String att_bigo) {
		this.att_bigo = att_bigo;
	}
	public String getAtt_divide() {
		return att_divide;
	}
	public void setAtt_divide(String att_divide) {
		this.att_divide = att_divide;
	}
	public String getAtt_date() {
		return att_date;
	}
	public void setAtt_date(String att_date) {
		this.att_date = att_date;
	}
	
	
}
