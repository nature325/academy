package aca.model;

import javax.servlet.http.HttpSession;

public interface LoginDAO {
	public int login(String id,String pwd,int position,HttpSession session); 	
}
