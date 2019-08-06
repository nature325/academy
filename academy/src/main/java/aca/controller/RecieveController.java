package aca.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import aca.joindto.model.StPayDTO;
import aca.joindto.model.SubStPayDTO;
import aca.joindto.model.SubTcDTO;
import aca.recieve.model.RecieveDAO;
import aca.recieve.model.RecieveDTO;

@Controller
public class RecieveController {

	@Autowired
	private RecieveDAO rdao;
	
	//수납메인페이지
	@RequestMapping("reci.do")
	public ModelAndView reciCome(
			@RequestParam(value="year", defaultValue="0")int year,
			@RequestParam(value="month", defaultValue="0")int month
			) {

		ModelAndView mav = new ModelAndView();

		Calendar now = Calendar.getInstance();
		int nowy = now.get(Calendar.YEAR);
		int nowm = now.get(Calendar.MONTH);
		
		//날짜
		if(year==0&&month==0) {
			year = nowy;
			month = nowm+1;
		}
		
		mav.addObject("year", year);
		mav.addObject("month",month);

		mav.setViewName("reci/reci_main");
		return mav;
	}
	
	// 강좌리스트 json
	@RequestMapping("getSubList.do")
	public ModelAndView getSubList(
			@RequestParam(value="year", defaultValue="0")int year,
			@RequestParam(value="month", defaultValue="0")int month) {
		
		
		String ymstr = month<10?year+"-0"+month:year+"-"+month;
		
		List subList = rdao.reciList(ymstr);
		
		ModelAndView mav = new ModelAndView("acaJson", "subject", subList);
		return mav;
	}
	
	// 강좌. 강사명 , 수강료 json
	@RequestMapping("getSubTcList.do")
	public ModelAndView getSubTcList(
			@RequestParam(value="tc_idx", defaultValue="")String tc_idx,
			@RequestParam(value="c_name", defaultValue="")String c_name
			) {
		SubTcDTO subtc = rdao.tcSubList(tc_idx, c_name);
		
		ModelAndView mav = new ModelAndView("acaJson","subtc", subtc);
		
		return mav;
	}
	
	//강좌 듣는 수강생 정보 json
	@RequestMapping("getStudents.do")
	public ModelAndView getStudents(
			@RequestParam(value="st_idxs", defaultValue="")String st_idxs,
			@RequestParam(value="c_code", defaultValue="")String c_code) {
		
		List students = rdao.stList(st_idxs,c_code);
		
		ModelAndView mav = new ModelAndView("acaJson","students",students);
		
		return mav;
	}
	
	//개인 납부내역 json
	@RequestMapping("getReciList.do")
	public ModelAndView getReciList(
			@RequestParam(value="st_idx", defaultValue="")String st_idx,
			@RequestParam(value="c_code", defaultValue="")String c_code) {
		
		List personalReciList = rdao.personalReciList(st_idx, c_code);
		
		ModelAndView mav = new ModelAndView("acaJson","reciList",personalReciList);
		
		return mav;
	}

	// 납부등록 팝업창
	@RequestMapping("reci_addForm.do")
	public ModelAndView reci_addForm(
			@RequestParam(value="st_idx",defaultValue="")String st_idx,
			@RequestParam(value="c_code",defaultValue="")String c_code) {
	
		SubTcDTO dto = rdao.getAddParam(st_idx, c_code);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("reci/reci_add");
		return mav;
	}
	
	// 납부등록
	@RequestMapping("reci_add.do")
	public ModelAndView reci_add(StPayDTO dto) {
		
		if(dto.getP_bigo()==null||dto.getP_bigo().equals("")) {
			dto.setP_bigo(" ");
		}
		
		int result = rdao.st_recieveAdd(dto);
		
		String msg = result>0?"수납 완료":"수납 실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("reci/reciAddMsg");
		return mav;
	}
	
	//납부편집 팝업창
	@RequestMapping("reci_updateForm.do")
	public ModelAndView reci_updateForm(
			@RequestParam(value="p_idx", defaultValue="")String p_idx,
			@RequestParam(value="st_idx",defaultValue="")String st_idx,
			@RequestParam(value="c_code",defaultValue="")String c_code) {
		
		SubStPayDTO dto = rdao.getUpParam(p_idx, st_idx, c_code);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("reci/st_recieve_update");
		return mav;
	}
	
	//납부편집
	@RequestMapping("reci_update.do")
	public ModelAndView reci_update(RecieveDTO dto) {
		if(dto.getP_bigo()==null||dto.getP_bigo().equals("")) {
			dto.setP_bigo(" ");
		}
		
		int result = rdao.st_recieveUpdate(dto);
		
		String msg = result>0?"수정완료":"수정실패";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("reci/reciAddMsg");
		return mav;
	}
	
	//납부삭제
	@RequestMapping("reci_del.do")
	public ModelAndView reci_del(@RequestParam(value="p_idx", defaultValue="")String p_idx) {
		
		int result = rdao.st_recieveDel(p_idx);
		String msg = result>0?"납부내역이 삭제되었습니다.":"납부내역 삭제실패";
		ModelAndView mav= new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("reci/reciAddMsg");
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	//원생 관련
	
	
	//수납 메인페이지
	@RequestMapping("st_recieve_List.do")
	public ModelAndView st_recieve_List(
			@RequestParam(value="year", defaultValue="0")int year,
			@RequestParam(value="month", defaultValue="0")int month,
			HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		Calendar now = Calendar.getInstance();
		int nowy = now.get(Calendar.YEAR);
		int nowm = now.get(Calendar.MONTH);
		
		//날짜
		if(year==0&&month==0) {
			year = nowy;
			month = nowm+1;
		}
		
		mav.addObject("year", year);
		mav.addObject("month",month);
		
		mav.setViewName("reci/st_reci_main");
		return mav;
	}
	
	//총 납부내역 json
	@RequestMapping("getReciAllList.do")
	public ModelAndView getReciAllList(
			@RequestParam(value="year", defaultValue="0")int year,
			@RequestParam(value="month", defaultValue="0")int month,
			HttpSession session) {
		
		String ymstr = month<10?year+"-0"+month:year+"-"+month;
		
		String st_idx = (String)session.getAttribute("id"); //세션에서 받아오는 걸로 수정
		
		List reciAllList = rdao.st_reciAllList(ymstr, st_idx);
		
		ModelAndView mav = new ModelAndView("acaJson", "allList", reciAllList);
		
		return mav;
	}
	
	
	//세부 납부내역 json
	@RequestMapping("getReciDetailList.do")
	public ModelAndView getReciDetailList(
			@RequestParam(value="c_code", defaultValue="")String c_code,
			@RequestParam(value="year", defaultValue="0")int year,
			@RequestParam(value="month", defaultValue="0")int month,
			HttpSession session) {
		
		
		String ymstr = month<10?year+"-0"+month:year+"-"+month;
		
		String st_idx = (String)session.getAttribute("id"); //세션에서 받아오는 걸로 수정
		
		List reciDetailList = rdao.st_reciDetailList(ymstr, st_idx, c_code);
		
		ModelAndView mav = new ModelAndView("acaJson","detailList", reciDetailList);
		
		return mav;
	}
	
	//pdf로 저장하기 위한 페이지 이동
		@RequestMapping("st_reci_pdf.do")
		public ModelAndView reci_pdf(
				@RequestParam(value="year", defaultValue="0")int year,
				@RequestParam(value="month", defaultValue="0")int month,
				HttpSession session) {
			
			String ymstr = month<10?year+"-0"+month:year+"-"+month;
			
			String st_idx = (String)session.getAttribute("id"); //세션에서 받아오는 걸로 수정
			String st_name = (String)session.getAttribute("name"); //세션에서 받아오는 걸로 수정
			
			List lists = rdao.st_reciPdfList(ymstr, st_idx);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("lists",lists);
			mav.addObject("st_name",st_name);
			mav.setViewName("reci/st_reci_pdfList");
			
			
			return mav;
			
		}
	
	
	
	
	
	
	
}







