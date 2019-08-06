package aca.controller;

import java.util.List;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import aca.att.model.AttDAO;
import aca.subject.model.SubjectDTO;
import aca.teacher.model.TeacherDAO;
import aca.teacher.model.TeacherDTO;

@Controller
public class TeachController {
	
	@Autowired
	private TeacherDAO teacherDAO;
	
	@Autowired AttDAO attdao;
	
	@RequestMapping("teach.do")
	public ModelAndView teach_All() {
		ModelAndView mav = new ModelAndView();
		List lists = teacherDAO.selectAll();
		mav.addObject("lists", lists);
		mav.setViewName("teach/teach_main");
		return mav;
	}
	
	@RequestMapping("teach_addForm.do")
	public String teach_addForm() {
		return "teach/teach_addForm";
	}
	
	@RequestMapping("teach_add.do")
	public ModelAndView teach_add(TeacherDTO dto) {
		ModelAndView mav = new ModelAndView();
		int c = teacherDAO.teach_add(dto);
		String msg = c>0?"저장 성공":"저장 실패";
		mav.addObject("msg",msg);
		mav.setViewName("teach/teach_msg");
		return mav;
	}
	
	@RequestMapping("teach_updateForm.do")
	public ModelAndView teach_updateForm(String idx) {
		ModelAndView mav = new ModelAndView();
		int tc_idx = Integer.parseInt(idx);
		TeacherDTO dto = teacherDAO.teach_selectOne(tc_idx);
		mav.addObject("dto",dto);
		mav.setViewName("teach/teach_updateForm");
		return mav;
	}
	
	@RequestMapping("teach_update.do")
	public ModelAndView teach_update(TeacherDTO dto) {
		ModelAndView mav = new ModelAndView();
		int c = teacherDAO.teach_update(dto);
		String msg = c>0?"수정 성공":"수정 실패";
		mav.addObject("msg",msg);
		mav.setViewName("teach/teach_msg");
		return mav;
	}
	
	@RequestMapping("teach_del.do")
	public ModelAndView teach_del(String idx) {
		ModelAndView mav = new ModelAndView();
		int tc_idx = Integer.parseInt(idx);
		int c = teacherDAO.teach_del(tc_idx);
		String msg = c>0?"삭제 성공":"삭제 실패";
		mav.addObject("msg",msg);
		mav.setViewName("teach/teach_msg");
		return mav;
	}
	
	@RequestMapping("/teach_select.do")
	public ModelAndView teach_select(String tc_name) {
		ModelAndView mav = new ModelAndView();
		List lists = teacherDAO.teach_select(tc_name);
		mav.addObject("lists",lists);
		mav.setViewName("teach/teach_main");
		return mav;
	}
	
	@RequestMapping("teach_subList.do")
	public ModelAndView teach_subList(String idx) {
		ModelAndView mav = new ModelAndView();
		int tc_idx = Integer.parseInt(idx);
		System.out.println(tc_idx);
		List teach_subList = teacherDAO.teach_subList(tc_idx);
		mav.addObject("lists",teach_subList);
		mav.setViewName("teach/teach_subList");
		return mav;
	}
	
	@RequestMapping("teach_subInfo.do")
	public ModelAndView att_st_subjectInfo(String c_code) {
		ModelAndView mav=new ModelAndView();
		SubjectDTO subdto=attdao.att_st_subjectInfo(c_code);
		mav.addObject("subdto",subdto);
		mav.setViewName("teach/teach_subInfo");
		return mav;
	}
}
