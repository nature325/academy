package aca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

import aca.page.qnaPageModule;
import aca.qna.model.QnaDAO;
import aca.qna.model.QnaDTO;
import aca.reply.model.ReplyDAO;
import aca.reply.model.ReplyDTO;
import aca.subject.model.SubjectDAO;
import aca.subject.model.SubjectDTO;

@Controller 
public class QnaController {

	@Autowired
	private QnaDAO qnaDao;
	@Autowired
	private SubjectDAO subjectDao;
	@Autowired
	private ReplyDAO rDao;
	private qnaPageModule pmodule;
	
	/**메인화면 , 전체 질문글 목록 출력*/
	@RequestMapping("/qna.do")
	public ModelAndView qna(@RequestParam(defaultValue="0")int c_code,
							@RequestParam(defaultValue="1")int crpath) {
		
		int count=qnaDao.qna_count(c_code);
		int rowsize=10;
		int pagesize=5;	
		
		int startrow=(crpath-1)*rowsize+1;
		int endrow=(crpath-1)*rowsize+rowsize;		
		
		
		List qna_list=qnaDao.qna_allList(c_code,startrow,endrow);	
		List c_codes= qnaDao.qna_getC_code();
		ModelAndView mav=new ModelAndView();
		
		String page=pmodule.makePage(count, rowsize, pagesize, crpath);
		
		mav.addObject("qna_list", qna_list);
		mav.addObject("subList", c_codes);
		mav.addObject("c_code",c_code);
		mav.addObject("page",page);
		mav.setViewName("qna/qna_main");
		return mav;
	}
	/**질문글쓰기 폼으로 이동, 과목코드(c_code)를 가져감*/
	@RequestMapping("/qna_writeForm.do")
	public ModelAndView qna_writeForm() {
		List c_codes= qnaDao.qna_getC_code();
		ModelAndView mav=new ModelAndView();
		mav.addObject("c_codes", c_codes);
		mav.setViewName("qna/qna_writeForm");
		return mav;
	}
	
	@RequestMapping("/qna_write.do")
	public ModelAndView qna_write(QnaDTO dto) {
		//System.out.println(dto.getC_name());
		int count = qnaDao.qna_write(dto);
		String msg=count>0?"질문글이 등록되었습니다.":"질문글 등록실패";	
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("qna/qnaMsg");
		return mav;
	}
	@RequestMapping("/qna_content.do")
	public ModelAndView qna_content(int q_idx) {
		QnaDTO qna_contents=qnaDao.qna_content(q_idx);
		ReplyDTO rdto=rDao.reply_select(q_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",qna_contents);
		mav.addObject("rdto",rdto);
		mav.setViewName("qna/qna_content");
		return mav;
	}
	@RequestMapping("/qna_conDel.do")
	public ModelAndView qna_conDel(int q_idx) {
		int count=qnaDao.qna_conDel(q_idx);
		String msg=count>0?"질문글 삭제 완료":"질문글 삭제 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("qna/qnaMsg");
		return mav;
	}
	@RequestMapping("/qna_conUpdate.do")
	public ModelAndView qna_conUpdate(int q_idx, SubjectDTO dto) {														
		List q_updateForm =qnaDao.qna_conUpdate(q_idx, dto);
		List c_codes= qnaDao.qna_getC_code(); /**<--글쓰기폼으로 이동 메서드도 실행해서 c_code,c_name도 가져옴.*/
		ModelAndView mav = new ModelAndView();
		mav.addObject("q_updateForm",q_updateForm);
		mav.addObject("c_codes",c_codes);
		mav.setViewName("qna/qna_updateForm");
		return mav;
	}
	@RequestMapping("/qna_conUpdate_ok.do")
	public ModelAndView qna_conUpdate_ok(QnaDTO dto) {
		int count=qnaDao.qna_conUpdate_ok(dto);
		String msg=count>0?"질문글이 편집되었습니다.":"질문글 편집실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("qna/qnaMsg");
		return mav;
	}
	@RequestMapping("/qna_search.do")
	public ModelAndView qna_search(String q_subject) {
		List q_searchList = qnaDao.qna_search(q_subject);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qna_list",q_searchList);
		mav.setViewName("qna/qna_main");
		return mav;
	}
	
	@RequestMapping("/qna_reply.do")
	public ModelAndView qna_reply(ReplyDTO rdto) {
		ModelAndView mav=new ModelAndView();		
		rDao.reply_write(rdto);
		mav.addObject("q_idx",rdto.getQ_idx());
		mav.setViewName("redirect:qna_content.do");
		return mav;
	}
	
	@RequestMapping("/qna_replyDel.do")
	public ModelAndView qna_replyDel(int q_idx) {
		ModelAndView mav=new ModelAndView();
		int count=rDao.reply_delete(q_idx);
		String msg=count>0?"삭제되었습니다.":"삭제 실패";
		mav.addObject("msg",msg);
		mav.setViewName("qna/qnaMsg");
		return mav;
	}
	
}
