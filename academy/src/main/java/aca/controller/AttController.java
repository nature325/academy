package aca.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aca.att.model.AttDAO;
import aca.att.model.AttDTO;
import aca.subject.model.SubjectDAO;
import aca.subject.model.SubjectDTO;

@Controller
public class AttController {
	
	@Autowired
	SubjectDAO subdao;
	
	@Autowired
	AttDAO attdao;
	
	@RequestMapping("att_main.do")
	public ModelAndView att_main(
			@RequestParam(value="dateInfo",defaultValue="nodate")String dateInfo
			) {
		
		
		if(dateInfo.equals("nodate")){
		Calendar cal=Calendar.getInstance();
		int year=cal.get(Calendar.YEAR);
		int month_=cal.get(Calendar.MONTH)+1;
		String month="";
		if(month_<10) {
			month="0"+month_;
		}else {
			month=""+month_;
		}
		
		int date_=cal.get(Calendar.DATE);
		String date="";
		if(date_<10) {
			date="0"+date_;
		}else {
			date=""+date_;
		}		
		int day_=cal.get(Calendar.DAY_OF_WEEK);
		String day="";
		switch(day_) {		
		case 1:day="일";break;
		case 2:day="월";break;
		case 3:day="화";break;
		case 4:day="수";break;
		case 5:day="목";break;
		case 6:day="금";break;
		case 7:day="토";
		}
		dateInfo=""+year+"-"+month+"-"+date+"("+day+")";
		}		
		
		Map map=new HashMap<String,String>();
		map.put("date", dateInfo.substring(0,10));
		map.put("day", '%'+dateInfo.substring(11,12)+'%');
		
		
		
					
		List lists=subdao.subject_selectByDate(map);			
		
		
		
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dateInfo",dateInfo);
		mav.addObject("dto",lists);
		mav.setViewName("att/att_main");		
		return mav;
	}
	
	@RequestMapping("/att_showRelSt.do")
	public ModelAndView att_showRelSt(String c_code,String st_idxs,String dateInfo) {
		StringTokenizer st=new StringTokenizer(st_idxs, ",");
		ArrayList<String> idx=new ArrayList<String>();
		if(st_idxs==null||st_idxs.equals("")) {
			idx.add("0");
		}else {
			while(st.hasMoreTokens()) {
				idx.add(st.nextToken());
			}
		}
		String date=dateInfo.substring(0,10);
		String day=dateInfo.substring(11,12);
		
		
		Map map=new HashMap();
		map.put("code", c_code);
		map.put("idx", idx);
		map.put("date", date);
		map.put("day", day);
		
		List lists=attdao.att_showRelSt(map);		
		ModelAndView mav=new ModelAndView();
		mav.addObject("data", lists);
		mav.setViewName("acaJson");
		return mav;		
	}
	
	@RequestMapping("/att_updateForm.do")
	public ModelAndView att_updateForm(String c_code,
			String c_name,String tc_name,String st_idx,String st_name,
			String att_divide,String att_bigo,String dateInfo,
			String st_idxs
			) {	
		
			
		ModelAndView mav=new ModelAndView();
		mav.setViewName("att/att_updateForm");
		mav.addObject("c_code", c_code);
		mav.addObject("c_name", c_name);
		mav.addObject("tc_name", tc_name);
		mav.addObject("st_idx", st_idx);
		mav.addObject("st_idxs", st_idxs);
		mav.addObject("st_name", st_name);
		mav.addObject("att_divide", att_divide);
		mav.addObject("att_bigo", att_bigo);
		mav.addObject("dateInfo",dateInfo);
		return mav;
	}
	
	
	@RequestMapping("/att_update.do")
	public ModelAndView att_update(AttDTO dto) {
		
		int result=attdao.att_update(dto);
		String msg=result>0?"수행됨":"안됨";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("att/att_msg");
		return mav;
		
	}
	
	
	
	@RequestMapping("/att_showRelStAtt.do")
	public ModelAndView att_showRelStAtt(String c_sdate,String c_edate,String st_idx,String c_code,String c_day) {
		
		Map map=new HashMap();
		ArrayList day=new ArrayList();
		for(int i=0;i<c_day.length(); i++) {			
			day.add('%'+c_day.substring(i,i+1)+'%');			
		}
		map.put("c_sdate", c_sdate);
		map.put("c_edate",c_edate);
		map.put("st_idx", st_idx);
		map.put("c_code", c_code);
		map.put("c_day",day);
		List lists=attdao.att_showRelStAtt(map);
		Map rel=(HashMap)lists.get(0);
		System.out.println(rel.get("NAL"));
		ModelAndView mav=new ModelAndView();
		mav.addObject("data",lists);
		mav.setViewName("acaJson");
		
		return mav;
		
	}
	
	
	

	@RequestMapping("/att_checkAll.do")
	public ModelAndView att_checkAll(String st_idxs,String c_code,String att_date) {
		att_date=att_date.substring(0, 10);
		StringTokenizer st=new StringTokenizer(st_idxs, ",");
		ArrayList<String> idx=new ArrayList<String>();
		while(st.hasMoreTokens()) {
			idx.add(st.nextToken());
		}
		for(int i=0; i<idx.size(); i++) {
			Map map=new HashMap();
			System.out.println(idx.get(i)+c_code);
			map.put("c_code", c_code);
			map.put("st_idx",idx.get(i));
			map.put("att_date", att_date);
			attdao.att_checkAll(map);
		}
		
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("att/att_main");
		return mav;
		
	}
	
	@RequestMapping("/att_st_main.do")
	public ModelAndView att_st_main(HttpSession session) {
			Calendar cal=Calendar.getInstance();
			int year=cal.get(Calendar.YEAR);
			int month_=cal.get(Calendar.MONTH)+1;
			String month="";
			if(month_<10) {
				month="0"+month_;
			}else {
				month=""+month_;
			}
			
			int date_=cal.get(Calendar.DATE);
			String date="";
			if(date_<10) {
				date="0"+date_;
			}else {
				date=""+date_;
			}		
			int day_=cal.get(Calendar.DAY_OF_WEEK);
			String day="";
			switch(day_) {		
			case 1:day="일";break;
			case 2:day="월";break;
			case 3:day="화";break;
			case 4:day="수";break;
			case 5:day="목";break;
			case 6:day="금";break;
			case 7:day="토";
			}
			String dateInfo=""+year+"-"+month+"-"+date+"("+day+")";
			
		
		
		
		
		
		ModelAndView mav=new ModelAndView();
		String st_idx=(String)session.getAttribute("id");
		System.out.println(st_idx);
		List subList=attdao.att_st_subList(st_idx);		
		mav.addObject("subList",subList);
		mav.addObject("dateInfo",dateInfo);
		mav.setViewName("att/att_st_main");
		
		return mav;
	}
	
	@RequestMapping("/att_st_attList.do")
	public ModelAndView att_st_attList(String c_sdate,String c_edate,String c_code,String c_day,HttpSession session) {		
		ArrayList<String> day=new ArrayList<String>();
		for(int i=0; i<c_day.length(); i++) {
			day.add(c_day.substring(i,i+1));
		}
		Map map=new HashMap();
		map.put("c_sdate", c_sdate);
		map.put("c_edate", c_edate);
		map.put("c_code", c_code);
		map.put("st_idx", session.getAttribute("id"));
		map.put("day", day);
		List attList=attdao.att_st_attList(map);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("attList",attList);
		mav.setViewName("att/att_st_attList");
		
		return mav;
	}
	
	@RequestMapping("/att_st_subjectInfo.do")
	public ModelAndView att_st_subjectInfo(String c_code) {
		ModelAndView mav=new ModelAndView();
		SubjectDTO subdto=attdao.att_st_subjectInfo(c_code);
		mav.addObject("subdto",subdto);
		mav.setViewName("att/att_st_subjectInfo");
		return mav;
	}
	
	
	 
	
	
	
}
















