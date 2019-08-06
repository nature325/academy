package aca.joindto.model;

public class SubStPayDTO extends SubjectDTO {

	private int st_idx;
	private String st_pwd;
	private String st_name;
	private String st_momtel;
	private String st_fatel;
	private String st_hometel;
	private String st_addr;
	private String st_school;
	private String st_level;
	private String st_memo;
	private String st_status;
	private String st_date;
	private String st_sms;
	private String st_gen;
	private int p_idx;
	private String p_state;
	private String p_payment;
	private int p_pay;
	private String p_paydate;
	private int p_st_idx;
	private int c_code;
	private String p_bigo;
	
	
	public SubStPayDTO() {
		super();
	}


	public SubStPayDTO(int st_idx, String st_pwd, String st_name, String st_momtel, String st_fatel, String st_hometel,
			String st_addr, String st_school, String st_level, String st_memo, String st_status, String st_date,
			String st_sms, String st_gen, int p_idx, String p_state, String p_payment, int p_pay, String p_paydate,
			int p_st_idx, int c_code, String p_bigo) {
		super();
		this.st_idx = st_idx;
		this.st_pwd = st_pwd;
		this.st_name = st_name;
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
		this.st_gen = st_gen;
		this.p_idx = p_idx;
		this.p_state = p_state;
		this.p_payment = p_payment;
		this.p_pay = p_pay;
		this.p_paydate = p_paydate;
		this.p_st_idx = p_st_idx;
		this.c_code = c_code;
		this.p_bigo = p_bigo;
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


	public String getSt_date() {
		return st_date;
	}


	public void setSt_date(String st_date) {
		this.st_date = st_date;
	}


	public String getSt_sms() {
		return st_sms;
	}


	public void setSt_sms(String st_sms) {
		this.st_sms = st_sms;
	}


	public String getSt_gen() {
		return st_gen;
	}


	public void setSt_gen(String st_gen) {
		this.st_gen = st_gen;
	}


	public int getP_idx() {
		return p_idx;
	}


	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}


	public String getP_state() {
		return p_state;
	}


	public void setP_state(String p_state) {
		this.p_state = p_state;
	}


	public String getP_payment() {
		return p_payment;
	}


	public void setP_payment(String p_payment) {
		this.p_payment = p_payment;
	}


	public int getP_pay() {
		return p_pay;
	}


	public void setP_pay(int p_pay) {
		this.p_pay = p_pay;
	}


	public String getP_paydate() {
		return p_paydate;
	}


	public void setP_paydate(String p_paydate) {
		this.p_paydate = p_paydate;
	}


	public int getP_st_idx() {
		return p_st_idx;
	}


	public void setP_st_idx(int p_st_idx) {
		this.p_st_idx = p_st_idx;
	}


	public int getC_code() {
		return c_code;
	}


	public void setC_code(int c_code) {
		this.c_code = c_code;
	}


	public String getP_bigo() {
		return p_bigo;
	}


	public void setP_bigo(String p_bigo) {
		this.p_bigo = p_bigo;
	}
	
	
}
