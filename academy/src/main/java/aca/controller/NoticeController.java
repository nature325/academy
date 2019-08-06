package aca.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aca.notice.model.NoticeDAO;
import aca.notice.model.NoticeDTO;
import aca.subject.model.SubjectDTO;
import aca.page.pageModule;



@Controller
public class NoticeController {

	@Autowired
	private NoticeDAO noticeDao;
	private pageModule pmodule;
	
	//공지사랑 리스트 목록
	@RequestMapping("/notice.do")
	public ModelAndView list(@RequestParam(defaultValue="n_subject") String searchOption,
							 @RequestParam(defaultValue="") String keyword,
							 @RequestParam(defaultValue="") String n_head,
							 @RequestParam(defaultValue="1")int crpath) {		
		
		//공지사항의 갯수 계산
		int count =noticeDao.count(searchOption, keyword, n_head);
		int rowsize=10;
		int pagesize=5;	
		
		int startrow=(crpath-1)*rowsize+1;
		int endrow=(crpath-1)*rowsize+rowsize;		
				
		List list=noticeDao.listAll(searchOption, keyword,n_head, startrow, endrow);		
		
		ModelAndView mav=new ModelAndView();
		
		String page=pmodule.makePage(count, rowsize, pagesize, crpath);
		
		mav.addObject("list", list);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		mav.addObject("n_head", n_head);		
		mav.addObject("page", page);		
		mav.setViewName("notice/notice");
		return mav; 
	}
	
	
	
	
	
	
	// 글쓰기 작성 폼 
	@RequestMapping(value = "/noti_addForm.do",method=RequestMethod.GET)

	public ModelAndView n_write() {
		List subList=noticeDao.notice_subList();
		ModelAndView mav=new ModelAndView();
		mav.addObject("subList",subList);
		mav.setViewName("notice/noti_addForm");
		
		return mav;
	}
	// 처리
		 @RequestMapping("/noti_addForm_ok.do")
		    public ModelAndView noti_write(NoticeDTO dto) {
			 	int count = noticeDao.noti_addForm(dto);	
			 	String msg=count>0?"공지사항이 등록되었습니다.":"공지사항 등록실패";	
			 	ModelAndView mav=new ModelAndView();
			 	mav.addObject("msg",msg);
			 	mav.setViewName("notice/notiMsg");
			 	return mav;	
		    }
	 	 
	 	  	 
	 //공지사항 내용
	 @RequestMapping("/noti_view.do")
	 public ModelAndView noti_content(int n_idx) {
		 ModelAndView mav=new ModelAndView();
		 NoticeDTO dto=noticeDao.noti_content(n_idx);
		 dto.setN_content(dto.getN_content().replaceAll("\n", "<br>"));
		 mav.addObject("dto",dto);
		 mav.setViewName("notice/noti_view");
		 return mav;
	 }
	 
	 
	 
	 
	 
	 
	// 글 내용 수정
	@RequestMapping(value = "noti_viewForm.do", method = RequestMethod.GET)
	public ModelAndView view(int n_idx) {		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", noticeDao.noti_view(n_idx));
		mav.setViewName("notice/noti_viewForm");
		return mav;
	}
	@RequestMapping(value = "noti_update.do", method = RequestMethod.POST)
	public ModelAndView noti_update(NoticeDTO dto) {
		ModelAndView mav = new ModelAndView();
		int c = noticeDao.noti_update(dto);
		String msg = c>0?"수정 성공":"수정 실패";
		mav.addObject("msg",msg);
		mav.setViewName("notice/notiMsg");
		return mav;
	}

	@RequestMapping("noti_delete.do")
	public ModelAndView n_delete(@RequestParam int n_idx) {
		ModelAndView mav = new ModelAndView();
		int c = noticeDao.noti_delete(n_idx);
		String msg = c>0?"삭제 성공":"삭제 실패";
		mav.addObject("msg", msg);
		mav.setViewName("notice/notiMsg");
		return mav;
	}
}
