package aca.joindto.model;

public class SubReciDTO extends SubjectDTO {

	private int p_idx;
	private String p_state;
	private String p_payment;
	private String p_pay;
	private String p_paydate;
	private String st_idx;
	private int c_code;
	private String p_bigo;
	public SubReciDTO() {
		super();
	}
	public SubReciDTO(int p_idx, String p_state, String p_payment, String p_pay, String p_paydate, String st_idx,
			int c_code, String p_bigo) {
		super();
		this.p_idx = p_idx;
		this.p_state = p_state;
		this.p_payment = p_payment;
		this.p_pay = p_pay;
		this.p_paydate = p_paydate;
		this.st_idx = st_idx;
		this.c_code = c_code;
		this.p_bigo = p_bigo;
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
	public String getP_pay() {
		return p_pay;
	}
	public void setP_pay(String p_pay) {
		this.p_pay = p_pay;
	}
	public String getP_paydate() {
		return p_paydate;
	}
	public void setP_paydate(String p_paydate) {
		this.p_paydate = p_paydate;
	}
	public String getSt_idx() {
		return st_idx;
	}
	public void setSt_idx(String st_idx) {
		this.st_idx = st_idx;
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