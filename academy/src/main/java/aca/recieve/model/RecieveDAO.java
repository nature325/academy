package aca.recieve.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.PayloadApplicationEvent;

import aca.joindto.model.StPayDTO;
import aca.joindto.model.SubStPayDTO;
import aca.joindto.model.SubTcDTO;

public interface RecieveDAO {
	
	public List reciList(String ymstr);
	public SubTcDTO tcSubList(String tc_idx, String c_name);
	public List stList(String st_idxs, String c_code);
	public List personalReciList(String st_idx, String c_code);
	public SubTcDTO getAddParam(String st_idx, String c_code);
	public int st_recieveAdd(StPayDTO dto);
	public SubStPayDTO getUpParam(String p_idx, String st_idx, String c_code);
	public int st_recieveUpdate(RecieveDTO dto);
	public int st_recieveDel(String p_idx);
	public List st_reciAllList(String ymstr, String st_idx);
	public List st_reciDetailList(String ymstr, String st_idx, String c_code);
	public List st_reciPdfList(String ymstr, String st_idx);
}
