package aca.teacher.model;

import aca.subject.model.SubjectDTO;

public class TeacherDTO extends SubjectDTO{

	private int tc_idx;
	private String tc_id;
	private String tc_pwd;
	private String tc_name;
	private String tc_gen;
	private String tc_tel;
	private String tc_addr;
	private String tc_school;
	private String tc_memo;
	public TeacherDTO() {
		super();
	}
	public TeacherDTO(int tc_idx, String tc_id, String tc_pwd, String tc_name, String tc_gen, String tc_tel,
			String tc_addr, String tc_school, String tc_memo) {
		super();
		this.tc_idx = tc_idx;
		this.tc_id = tc_id;
		this.tc_pwd = tc_pwd;
		this.tc_name = tc_name;
		this.tc_gen = tc_gen;
		this.tc_tel = tc_tel;
		this.tc_addr = tc_addr;
		this.tc_school = tc_school;
		this.tc_memo = tc_memo;
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
	
	@Override
	public String toString() {
		return "TeacherDTO [tc_idx=" + tc_idx + ", tc_id=" + tc_id + ", tc_pwd=" + tc_pwd + ", tc_name=" + tc_name
				+ ", tc_gen=" + tc_gen + ", tc_tel=" + tc_tel + ", tc_addr=" + tc_addr + ", tc_school=" + tc_school
				+ ", tc_memo=" + tc_memo + "]";
	}
	
}
