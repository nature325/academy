package aca.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import aca.score.model.ScoreDAO;
import aca.score.model.ScoreDTO;

@Controller
public class ScoreController {
	
	@Autowired
	private ScoreDAO scoreDAO;

	   @RequestMapping("score.do")
	   public ModelAndView score_main(HttpSession session) {
	      ModelAndView mav = new ModelAndView();
	      if(session.getAttribute("position").equals("student")) {
	         mav.setViewName("score/score_main");
	      } else if(session.getAttribute("position").equals("Manager")) {
	         List lists = scoreDAO.sc_stSelect();
	         mav.addObject("lists",lists);
	         mav.setViewName("score/score_mMain");
	      }
	      return mav;
	   }
	
	@RequestMapping("sc_select.do")
	public ModelAndView sc_select(ScoreDTO dto) {
		ModelAndView mav = new ModelAndView();
		List lists = scoreDAO.sc_select(dto);
		mav.addObject("lists", lists);
		mav.setViewName("score/score_main");
		return mav;
	}
	
	@RequestMapping("sc_selectOne.do")
	public ModelAndView sc_selectOne(String s_date,int st_idx, String st_level) {
		ModelAndView mav = new ModelAndView();
		ScoreDTO dto = scoreDAO.sc_selectOne(s_date, st_idx);
		ScoreDTO dto2 = scoreDAO.sc_avgSelect(s_date,st_level);
		List scList = scoreDAO.sc_selectScore(st_idx);
		mav.addObject("scList",scList); 
		mav.addObject("dto",dto);
		mav.addObject("dto2",dto2);
		mav.setViewName("acaJson");
		return mav;
	}
	//수정
	@RequestMapping("sc_add.do")
	public ModelAndView st_add(ScoreDTO dto) {
		ModelAndView mav = new ModelAndView();
		//추가
		ScoreDTO dtos = scoreDAO.sc_selectOne(dto);
		String msg ="";
		if(dtos==null) {
			int c = scoreDAO.sc_add(dto);
			msg = c>0?"입력 성공":"입력 실패";
		} else  {
			msg="이미 등록되어 있는 날짜 입니다. 다시확인해 주세요";
		}
		mav.addObject("msg",msg);
		mav.setViewName("score/score_msg");
		return mav;
	}
	
	//추가
	@RequestMapping("sc_stScoreList.do")
	public ModelAndView sc_stScoreList(String st_idx) {
		ModelAndView mav = new ModelAndView();
		List lists = scoreDAO.sc_stScoreList(st_idx);
		mav.addObject("lists",lists);
		mav.setViewName("score/stScoreList");
		return mav;
	}
	
	@RequestMapping("sc_stScoreUpdate.do")
	public ModelAndView sc_stScoreUpdate(ScoreDTO dto) {
		ModelAndView mav = new ModelAndView();
		int c = scoreDAO.sc_stScoreUpdate(dto);
		String msg = c>0?"수정 성공":"수정 실패";
		mav.addObject("msg",msg);
		mav.setViewName("score/score_msg");
		return mav;
	}
	
	@RequestMapping("sc_stSelect.do")
	public ModelAndView sc_stSelect(String st_name) {
		ModelAndView mav = new ModelAndView();
		List lists = scoreDAO.sc_stSelect(st_name);
		mav.addObject("lists", lists);
		mav.setViewName("score/score_mMain");
		return mav;
	}
	
	@RequestMapping("sc_chart.do")
	public ModelAndView sc_chart(String s_date, String st_level) {
		ModelAndView mav = new ModelAndView();
		ScoreDTO dto2 = scoreDAO.sc_avgSelect(s_date,st_level);
		mav.addObject("dto2",dto2);
		mav.setViewName("acaJson");
		return mav;
	}
	
	@RequestMapping("sc_del.do")
	public ModelAndView sc_del(String st_idx, String s_date) {
		ModelAndView mav = new ModelAndView();
		int c = scoreDAO.sc_del(st_idx,s_date);
		String msg= c>0?"삭제성공":"삭제실패";
		mav.addObject("msg",msg);
		mav.setViewName("acaJson");
		return mav;
	}
	@RequestMapping("sc_graf.do")
	public String graf() {
		return "score/graf";
	}

}
