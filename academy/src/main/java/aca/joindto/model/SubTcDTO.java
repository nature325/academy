package aca.joindto.model;

import java.sql.Date;

public class SubTcDTO extends SubjectDTO {
	
	private int tc_idx;
	private String tc_id;
	private String tc_pwd;
	private String tc_name;
	private String tc_tel;
	private String tc_addr;
	private String tc_school;
	private String tc_memo;
	private String tc_gen;
	private int st_idx;
	private String st_pwd;
	private String st_name;
	private String st_gen;
	private String st_momtel;
	private String st_fatel;
	private String st_hometel;
	private String st_addr;
	private String st_school;
	private String st_level;
	private String st_memo;
	private String st_status;
	private Date st_date;
	private String st_sms;
	public SubTcDTO() {
		super();
	}
	
	public SubTcDTO(int tc_idx, String tc_id, String tc_pwd, String tc_name, String tc_tel, String tc_addr,
			String tc_school, String tc_memo, String tc_gen, int st_idx, String st_pwd, String st_name, String st_gen,
			String st_momtel, String st_fatel, String st_hometel, String st_addr, String st_school, String st_level,
			String st_memo, String st_status, Date st_date, String st_sms) {
		super();
		this.tc_idx = tc_idx;
		this.tc_id = tc_id;
		this.tc_pwd = tc_pwd;
		this.tc_name = tc_name;
		this.tc_tel = tc_tel;
		this.tc_addr = tc_addr;
		this.tc_school = tc_school;
		this.tc_memo = tc_memo;
		this.tc_gen = tc_gen;
		this.st_idx = st_idx;
		this.st_pwd = st_pwd;
		this.st_name = st_name;
		this.st_gen = st_gen;
		this.st_momtel = st_momtel;
		this.st_fatel = st_fatel;
		this.st_hometel = st_hometel;
		this.st_addr = st_addr;
		this.st_school = st_school;
		this.st_level = st_level;
		this.st_memo = st_memo;
		this.st_status = st_status;
		this.st_date = st_date;
		this.st_sms = st_sms;
	}

	public int getTc_idx() {
		return tc_idx;
	}
	public void setTc_idx(int tc_idx) {
		this.tc_idx = tc_idx;
	}
	public String getTc_id() {
		return tc_id;
	}
	public void setTc_id(String tc_id) {
		this.tc_id = tc_id;
	}
	public String getTc_pwd() {
		return tc_pwd;
	}
	public void setTc_pwd(String tc_pwd) {
		this.tc_pwd = tc_pwd;
	}
	public String getTc_name() {
		return tc_name;
	}
	public void setTc_name(String tc_name) {
		this.tc_name = tc_name;
	}
	
	public String getTc_gen() {
		return tc_gen;
	}

	public void setTc_gen(String tc_gen) {
		this.tc_gen = tc_gen;
	}

	public String getTc_tel() {
		return tc_tel;
	}
	public void setTc_tel(String tc_tel) {
		this.tc_tel = tc_tel;
	}
	public String getTc_addr() {
		return tc_addr;
	}
	public void setTc_addr(String tc_addr) {
		this.tc_addr = tc_addr;
	}
	public String getTc_school() {
		return tc_school;
	}
	public void setTc_school(String tc_school) {
		this.tc_school = tc_school;
	}
	public String getTc_memo() {
		return tc_memo;
	}
	public void setTc_memo(String tc_memo) {
		this.tc_memo = tc_memo;
	}

	public int getSt_idx() {
		return st_idx;
	}

	public void setSt_idx(int st_idx) {
		this.st_idx = st_idx;
	}

	public String getSt_pwd() {
		return st_pwd;
	}

	public void setSt_pwd(String st_pwd) {
		this.st_pwd = st_pwd;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_gen() {
		return st_gen;
	}

	public void setSt_gen(String st_gen) {
		this.st_gen = st_gen;
	}

	public String getSt_momtel() {
		return st_momtel;
	}

	public void setSt_momtel(String st_momtel) {
		this.st_momtel = st_momtel;
	}

	public String getSt_fatel() {
		return st_fatel;
	}

	public void setSt_fatel(String st_fatel) {
		this.st_fatel = st_fatel;
	}

	public String getSt_hometel() {
		return st_hometel;
	}

	public void setSt_hometel(String st_hometel) {
		this.st_hometel = st_hometel;
	}

	public String getSt_addr() {
		return st_addr;
	}

	public void setSt_addr(String st_addr) {
		this.st_addr = st_addr;
	}

	public String getSt_school() {
		return st_school;
	}

	public void setSt_school(String st_school) {
		this.st_school = st_school;
	}

	public String getSt_level() {
		return st_level;
	}

	public void setSt_level(String st_level) {
		this.st_level = st_level;
	}

	public String getSt_memo() {
		return st_memo;
	}

	public void setSt_memo(String st_memo) {
		this.st_memo = st_memo;
	}

	public String getSt_status() {
		return st_status;
	}

	public void setSt_status(String st_status) {
		this.st_status = st_status;
	}

	public Date getSt_date() {
		return st_date;
	}

	public void setSt_date(Date st_date) {
		this.st_date = st_date;
	}

	public String getSt_sms() {
		return st_sms;
	}

	public void setSt_sms(String st_sms) {
		this.st_sms = st_sms;
	}
	
	
}
