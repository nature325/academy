package aca.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import aca.model.LoginDAO;
import aca.subject.model.SubjectDAO;

@Controller
public class AcaController {
	
	@Autowired
	SubjectDAO subdao;
	@Autowired
	LoginDAO logindao;
	
	@RequestMapping("/index.do")
	public String indexCome(HttpSession session) {
		session.invalidate();
		return "index";
	}
	
	@RequestMapping("/login.do")
	public ModelAndView login(String id,String pwd,int position,HttpSession session) {
		int result=logindao.login(id, pwd, position,session);
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName("acaJson");		
		return mav;
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.do";
	}
	


	
	@RequestMapping("class.do")
	public String classCome() {
		return "class/class_main";
	}
	

}

