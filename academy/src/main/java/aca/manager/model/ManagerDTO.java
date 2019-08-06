package aca.manager.model;

public class ManagerDTO {
	private int m_idx;
	private String m_id;
	private String m_pwd;
	private String m_name;
	public ManagerDTO() {
		super();
	}
	public ManagerDTO(int m_idx, String m_id, String m_pwd, String m_name) {
		super();
		this.m_idx = m_idx;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_name = m_name;
	}
	public int getM_idx() {
		return m_idx;
	}
	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	
}
