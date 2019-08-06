package aca.joindto.model;

import java.sql.Date;
import java.util.StringTokenizer;

public class SubjectDTO {

	private int c_code;
	private String c_name;
	private int c_maxp;
	private int c_nowp;
	private String c_price;
	private String c_day;
	private String c_mon;
	private String c_mon1;
	private String c_tue;
	private String c_tue1;
	private String c_wedn;
	private String c_wedn1;
	private String c_thur;
	private String c_thur1;
	private String c_fri;
	private String c_fri1;
	private String c_sat;
	private String c_sat1;
	private String c_sun;
	private String c_sun1;
	private String c_place;
	private String c_sdate;
	private String c_edate;
	private String c_memo;
	private int tc_idx;
	private String st_idxs;
	public SubjectDTO() {
		super();
	}
	public SubjectDTO(int c_code, String c_name, int c_maxp, int c_nowp, String c_price, String c_day, String c_mon,
			String c_mon1, String c_tue, String c_tue1, String c_wedn, String c_wedn1, String c_thur, String c_thur1,
			String c_fri, String c_fri1, String c_sat, String c_sat1, String c_sun, String c_sun1, String c_place,
			String c_sdate, String c_edate, String c_memo, int tc_idx, String st_idxs) {
		super();
		this.c_code = c_code;
		this.c_name = c_name;
		this.c_maxp = c_maxp;
		this.c_nowp = c_nowp;
		this.c_price = c_price;
		this.c_day = c_day;
		this.c_mon = c_mon;
		this.c_mon1 = c_mon1;
		this.c_tue = c_tue;
		this.c_tue1 = c_tue1;
		this.c_wedn = c_wedn;
		this.c_wedn1 = c_wedn1;
		this.c_thur = c_thur;
		this.c_thur1 = c_thur1;
		this.c_fri = c_fri;
		this.c_fri1 = c_fri1;
		this.c_sat = c_sat;
		this.c_sat1 = c_sat1;
		this.c_sun = c_sun;
		this.c_sun1 = c_sun1;
		this.c_place = c_place;
		this.c_sdate = c_sdate;
		this.c_edate = c_edate;
		this.c_memo = c_memo;
		this.tc_idx = tc_idx;
		this.st_idxs = st_idxs;
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
	public int getC_maxp() {
		return c_maxp;
	}
	public void setC_maxp(int c_maxp) {
		this.c_maxp = c_maxp;
	}
	public int getC_nowp() {
		return c_nowp;
	}
	public void setC_nowp(int c_nowp) {
		this.c_nowp = c_nowp;
	}
	public String getC_price() {
		return c_price;
	}
	public void setC_price(String c_price) {
		this.c_price = c_price;
	}
	public String getC_day() {
		return c_day;
	}
	public void setC_day(String c_day) {
		this.c_day = c_day;
	}
	public String getC_mon() {
		return c_mon;
	}
	public void setC_mon(String c_mon) {
		this.c_mon = c_mon;
	}
	public String getC_mon1() {
		return c_mon1;
	}
	public void setC_mon1(String c_mon1) {
		this.c_mon1 = c_mon1;
	}
	public String getC_tue() {
		return c_tue;
	}
	public void setC_tue(String c_tue) {
		this.c_tue = c_tue;
	}
	public String getC_tue1() {
		return c_tue1;
	}
	public void setC_tue1(String c_tue1) {
		this.c_tue1 = c_tue1;
	}
	public String getC_wedn() {
		return c_wedn;
	}
	public void setC_wedn(String c_wedn) {
		this.c_wedn = c_wedn;
	}
	public String getC_wedn1() {
		return c_wedn1;
	}
	public void setC_wedn1(String c_wedn1) {
		this.c_wedn1 = c_wedn1;
	}
	public String getC_thur() {
		return c_thur;
	}
	public void setC_thur(String c_thur) {
		this.c_thur = c_thur;
	}
	public String getC_thur1() {
		return c_thur1;
	}
	public void setC_thur1(String c_thur1) {
		this.c_thur1 = c_thur1;
	}
	public String getC_fri() {
		return c_fri;
	}
	public void setC_fri(String c_fri) {
		this.c_fri = c_fri;
	}
	public String getC_fri1() {
		return c_fri1;
	}
	public void setC_fri1(String c_fri1) {
		this.c_fri1 = c_fri1;
	}
	public String getC_sat() {
		return c_sat;
	}
	public void setC_sat(String c_sat) {
		this.c_sat = c_sat;
	}
	public String getC_sat1() {
		return c_sat1;
	}
	public void setC_sat1(String c_sat1) {
		this.c_sat1 = c_sat1;
	}
	public String getC_sun() {
		return c_sun;
	}
	public void setC_sun(String c_sun) {
		this.c_sun = c_sun;
	}
	public String getC_sun1() {
		return c_sun1;
	}
	public void setC_sun1(String c_sun1) {
		this.c_sun1 = c_sun1;
	}
	public String getC_place() {
		return c_place;
	}
	public void setC_place(String c_place) {
		this.c_place = c_place;
	}
	public String getC_sdate() {
		return c_sdate;
	}
	public void setC_sdate(String c_sdate) {
		this.c_sdate = c_sdate;
	}
	public String getC_edate() {
		return c_edate;
	}
	public void setC_edate(String c_edate) {
		this.c_edate = c_edate;
	}
	public String getC_memo() {
		return c_memo;
	}
	public void setC_memo(String c_memo) {
		this.c_memo = c_memo;
	}
	public int getTc_idx() {
		return tc_idx;
	}
	public void setTc_idx(int tc_idx) {
		this.tc_idx = tc_idx;
	}
	public String getSt_idxs() {
		return st_idxs;
	}
	public void setSt_idxs(String st_idxs) {
		this.st_idxs = st_idxs;
	}
	
	
		
	
	
}