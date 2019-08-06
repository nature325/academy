package aca.score.model;

import aca.student.model.StudentDTO;

public class ScoreDTO extends StudentDTO{

	private String s_kor;
	private String s_eng;
	private String s_mat;
	private String s_soc;
	private String s_sci;
	private String s_cate;
	private String s_date;
	private String s_date1;
	private int st_idx;
	
	public ScoreDTO() {
		super();
	}

	public ScoreDTO(String s_kor, String s_eng, String s_mat, String s_soc, String s_sci, String s_cate, String s_date,
			String s_date1, int st_idx) {
		super();
		this.s_kor = s_kor;
		this.s_eng = s_eng;
		this.s_mat = s_mat;
		this.s_soc = s_soc;
		this.s_sci = s_sci;
		this.s_cate = s_cate;
		this.s_date = s_date;
		this.s_date1 = s_date1;
		this.st_idx = st_idx;
	}

	public String getS_kor() {
		return s_kor;
	}

	public void setS_kor(String s_kor) {
		this.s_kor = s_kor;
	}

	public String getS_eng() {
		return s_eng;
	}

	public void setS_eng(String s_eng) {
		this.s_eng = s_eng;
	}

	public String getS_mat() {
		return s_mat;
	}

	public void setS_mat(String s_mat) {
		this.s_mat = s_mat;
	}

	public String getS_soc() {
		return s_soc;
	}

	public void setS_soc(String s_soc) {
		this.s_soc = s_soc;
	}

	public String getS_sci() {
		return s_sci;
	}

	public void setS_sci(String s_sci) {
		this.s_sci = s_sci;
	}

	public String getS_cate() {
		return s_cate;
	}

	public void setS_cate(String s_cate) {
		this.s_cate = s_cate;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getS_date1() {
		return s_date1;
	}

	public void setS_date1(String s_date1) {
		this.s_date1 = s_date1;
	}

	public int getSt_idx() {
		return st_idx;
	}

	public void setSt_idx(int st_idx) {
		this.st_idx = st_idx;
	}

	@Override
	public String toString() {
		return "ScoreDTO [s_kor=" + s_kor + ", s_eng=" + s_eng + ", s_mat=" + s_mat + ", s_soc=" + s_soc + ", s_sci="
				+ s_sci + ", s_cate=" + s_cate + ", s_date=" + s_date + ", s_date1=" + s_date1 + ", st_idx=" + st_idx
				+ "]";
	}
	
	
}
