package aca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import aca.student.model.StudentDAO;
import aca.student.model.StudentDTO;
import aca.subject.model.SubjectDAO;
import aca.subject.model.SubjectDTO;

@Controller
public class StudentController {

	@Autowired
	private StudentDAO studentDao;
	@Autowired
	private SubjectDAO subjectDAO;
	
	@RequestMapping("st.do") /**원생 전체 리스트 출력 기능 19.07.16추가됨.*/
	public ModelAndView stCome() {
		List st_lists=studentDao.st_mainList(); 	
		ModelAndView mav=new ModelAndView(); 	
		mav.addObject("st_lists",st_lists);	
		mav.setViewName("st/st_main"); 
		return mav;
	
	}
	
	/**원생등록 폼으로 이동하는 메소드*/
	@RequestMapping("/st_addForm.do")
	public ModelAndView st_addForm() {
		int st_maxIdx=Integer.parseInt(studentDao.st_addForm());
		ModelAndView mav=new ModelAndView();
		mav.addObject("st_maxIdx",st_maxIdx);// go st_addForm
		mav.setViewName("st/st_addForm"); //2. go st_addForm
		return mav;
	}
	/**원생등록 메소드*/
	@RequestMapping("/st_addInfo.do")
	public ModelAndView st_addInfo(StudentDTO dto) {
		int result=studentDao.st_addInfo(dto);
		String msg=result>0?"등록되었습니다":"등록 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("st/stMsg");
		return mav;
	}	

	/**목록에서 클릭후 학생정보 출력. st_main에서 학생전체목록 출력은 AcaController.java에 있음*/
	@RequestMapping("/st_info.do")
	public ModelAndView st_info(int st_idx) {
		List st_info=studentDao.st_info(st_idx); 
		List st_lists=studentDao.st_mainList(); 	
			
		
		ModelAndView mav=new ModelAndView(); 
		mav.addObject("st_lists",st_lists);	
		mav.addObject("st_info",st_info);	
		mav.setViewName("st/st_main"); 
		return mav;	
	}
	/**원생정보 수정 폼으로 이동하는 메소드*/
	@RequestMapping("/st_updateForm.do")
	public ModelAndView st_updateForm(int st_idx) {
		List st_info=studentDao.st_info(st_idx); 	
		ModelAndView mav=new ModelAndView(); 	
		mav.addObject("st_info",st_info);
		mav.setViewName("st/st_updateForm");
		return mav;
	}
	/**원생정보수정 메소드*/
	@RequestMapping("/st_update.do")
	public ModelAndView st_update(StudentDTO dto) {
		int result=studentDao.st_update(dto);
		String msg=result>0?"수정되었습니다.":"수정 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("st/stMsg");
		return mav;
	}
	/**원생 조회 메소드*/
	@RequestMapping("/st_select.do")
	public ModelAndView st_select(StudentDTO dto) {
		List st_lists=studentDao.st_select(dto); 
		ModelAndView mav = new ModelAndView();
		mav.addObject("st_lists", st_lists);
		mav.setViewName("st/st_main");
		return mav;
	}	
	/**원생 삭제 기능 메서드*/
	@RequestMapping("/st_delInfo.do")
	public ModelAndView st_delInfo(int st_idx) {		
		int result=studentDao.st_delInfo(st_idx);		
		ModelAndView mav = new ModelAndView();
		String msg=result>0?"삭제되었습니다.":"삭제 실패";
		mav.addObject("msg", msg);
		mav.setViewName("st/stMsg");
		return mav;
	}
	
	
	@RequestMapping("/st_att.do")
	public ModelAndView st_att(String st_idx) {
		System.out.println("st_idx="+st_idx);
		List attInfo=studentDao.st_att(st_idx);		
		ModelAndView mav=new ModelAndView();
		mav.addObject("attInfo",attInfo);
		mav.setViewName("/st/st_att");
		return mav;
		
	}
	/**sy*/
	// 수연 추가 내용 위에 오토와이어드도 있음
	@RequestMapping("st_sub.do")
	public ModelAndView st_sub(String st_idx) {
		ModelAndView mav = new ModelAndView();
		List subList = studentDao.st_subAdded(st_idx);
		mav.addObject("subList",subList);
		mav.setViewName("st/st_sub");
		return mav;
	}
	
	@RequestMapping("st_subAddForm.do")
	public ModelAndView st_subAdd(String st_idx) {
		ModelAndView mav = new ModelAndView();
		List subList = subjectDAO.sub_select();
		mav.addObject("subList",subList);
		mav.addObject("st_idx", st_idx);
		mav.setViewName("st/st_subAdd");
		return mav;
	}
	
	@RequestMapping("st_subAdd.do")
	public ModelAndView st_subAdd(String st_idx,String c_code) {
		ModelAndView mav = new ModelAndView();
		SubjectDTO dto = studentDao.st_subAddChk(st_idx, c_code);
		String msg = "";
		if(dto==null) {
			int c = studentDao.st_subAdd(st_idx, c_code);
			msg=c>0?"수강 등록되었습니다.":"수강등록 실패";
		} else {
			msg = "이미 수강중인 강좌입니다.";
		}
		mav.addObject("msg", msg);
		mav.setViewName("acaJson");
		return mav;
	}
	
	@RequestMapping("st_subDel.do")
	public ModelAndView st_subDel(String st_idx,String c_code) {
		ModelAndView mav = new ModelAndView();
		int c = studentDao.st_subDel(st_idx,c_code);
		String msg = c>0?"수강 취소되었습니다.":"수강 취소 실패";
		mav.addObject("msg",msg);
		mav.setViewName("acaJson");
		return mav;
	}
	
	@RequestMapping("st_reci.do")
	   public ModelAndView st_reci(String st_idx) {
	      List reciList = studentDao.st_reci(st_idx);
	      ModelAndView mav = new ModelAndView();
	      mav.addObject("reciList",reciList);
	      mav.setViewName("/st/st_reci");
	      return mav;
	   }
	
	
}