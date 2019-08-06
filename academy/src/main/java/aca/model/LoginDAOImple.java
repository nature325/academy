package aca.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.context.request.RequestScope;

import aca.manager.model.ManagerDTO;
import aca.student.model.StudentDTO;

public class LoginDAOImple implements LoginDAO{
	
	private SqlSessionTemplate sqlMap;
	
	
	
	
	public LoginDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}




	public int login(String id, String pwd, int position,HttpSession session) {
		if(position==1) {
			StudentDTO dto=sqlMap.selectOne("studentLogin",id);
			if(dto==null) {
				return 2;
			}else if(dto.getSt_pwd().equals(pwd)) {								
				session.setAttribute("id", id);
				session.setAttribute("name", dto.getSt_name());
				session.setAttribute("level", dto.getSt_level());
				session.setAttribute("position", "student");
				return 1;
			}else{
				return 2;
			}			
		}else if(position==2) {
			ManagerDTO dto=sqlMap.selectOne("managerLogin",id);
			if(dto==null) {
				return 2;
			}else if(dto.getM_pwd().equals(pwd)) {								
				session.setAttribute("id", dto.getM_id());
				session.setAttribute("name", dto.getM_name());
				session.setAttribute("position", "Manager");
				return 1;
			}else{
				return 2;
			}	
			
		}
		return 2;
	}
}
