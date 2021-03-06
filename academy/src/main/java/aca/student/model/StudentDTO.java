package aca.student.model;
import java.sql.Date;

public class StudentDTO {

	private int st_idx;
	private String  st_pwd;
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
	
	
	//키 담는 친구들 >>>>
	private String st_selectKey;
	private String st_selectText;
	public StudentDTO(String st_selectKey, String st_selectText) {
		super();
		this.st_selectKey = st_selectKey;
		this.st_selectText = st_selectText;
	}	
	public String getSt_selectKey() {
		return st_selectKey;
	}
	public void setSt_selectKey(String st_selectKey) {
		this.st_selectKey = st_selectKey;
	}
	public String getSt_selectText() {
		return st_selectText;
	}
	public void setSt_selectText(String st_selectText) {
		this.st_selectText = st_selectText;
	}
	//키 담는 친구들 >>>>

	/**StudentDTO() 기본 생성자*/
	public StudentDTO() {
		super();
	}
	/**StudentDTO() 인자생성자*/
	public StudentDTO(int st_idx, String st_pwd, String st_name, String st_gen, String st_momtel, String st_fatel,
			String st_hometel, String st_addr, String st_school, String st_level, String st_memo, String st_status,
			Date st_date, String st_sms) {
		super();
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

	/**StudentDTO() Getters&Setters*/
	
	
	
	
	
}