package aca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aca.subject.model.SubjectDAO;
import aca.subject.model.SubjectDTO;
import aca.teacher.model.TeacherDTO;

@Controller
public class SubjectController {
	
	@Autowired
	private SubjectDAO subjectDAO;
	
	@RequestMapping("sub.do")
	public ModelAndView subCome() {
		ModelAndView mav = new ModelAndView();
		List lists = subjectDAO.sub_select();
		mav.addObject("lists", lists);
		mav.setViewName("sub/sub_main");
		return mav;
	}
	
	@RequestMapping("sub_select.do")
	public ModelAndView subSelect(String cho, String name) {
		ModelAndView mav = new ModelAndView();
		List lists = subjectDAO.sub_select(cho, name);
		mav.addObject("lists", lists);
		mav.setViewName("sub/sub_main");
		return mav;
	}
	
	@RequestMapping("sub_addForm.do")
	public ModelAndView sub_addForm() {
		ModelAndView mav = new ModelAndView();
		List lists = subjectDAO.select_tc();
		mav.addObject("lists",lists);
		mav.setViewName("sub/sub_addForm");
		return mav;
	}
	
	@RequestMapping("sub_add.do")
	public ModelAndView sub_add(SubjectDTO dto) {
		System.out.println(dto.toString());
		ModelAndView mav = new ModelAndView();
		int c = subjectDAO.sub_add(dto);
		String msg = c>0?"강의 추가 성공":"강의 추가 실패";
		mav.addObject("msg",msg);
		mav.setViewName("sub/sub_msg");
		return mav;
	}
	
	@RequestMapping("sub_updateForm.do")
	public ModelAndView sub_updateForm(@RequestParam("c_code")String c_code) {
		ModelAndView mav = new ModelAndView();
		int code = Integer.parseInt(c_code);
		TeacherDTO dto = subjectDAO.sub_selectOne(code);
		List lists = subjectDAO.select_tc();
		mav.addObject("lists",lists);
		mav.addObject("dto",dto);
		mav.setViewName("sub/sub_update");
		return mav;
	}
	
	@RequestMapping("sub_update.do")
	public ModelAndView sub_update(TeacherDTO dto) {
		ModelAndView mav = new ModelAndView();
		int c = subjectDAO.sub_update(dto);
		String msg = c>0?"수정 성공":"수정 실패";
		mav.addObject("msg",msg);
		mav.setViewName("sub/sub_msg");
		return mav;
	}
	
	@RequestMapping("sub_selectOne.do")
	public ModelAndView sub_selectOne(int c_code) {
		ModelAndView mav = new ModelAndView();
		TeacherDTO dto = subjectDAO.sub_selectOne(c_code);
		mav.addObject("dto",dto);
		mav.setViewName("acaJson");
		return mav;
	}
	
	@RequestMapping("sub_del.do")
	public ModelAndView sub_del(String code) {
		ModelAndView mav = new ModelAndView();
		int c_code = Integer.parseInt(code);
		int c = subjectDAO.sub_del(c_code);
		String msg = c>0?"삭제 성공":"삭제 실패";
		mav.addObject("msg",msg);
		mav.setViewName("sub/sub_msg");
		return mav;
	}
	
}
