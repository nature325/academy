package aca.score.model;

import java.util.List;

public interface ScoreDAO {

	public List sc_select(ScoreDTO dto);
	public ScoreDTO sc_selectOne(String s_date,int st_idx);
	public ScoreDTO sc_avgSelect(String s_date, String st_level);
	public List sc_selectScore(int st_idx);
	public List sc_stSelect();
	public int sc_add(ScoreDTO dto);
	
	//추가
	public ScoreDTO sc_selectOne(ScoreDTO dto);
	public List sc_stScoreList(String st_idx);
	public int sc_stScoreUpdate(ScoreDTO dto);
	public List sc_stSelect(String st_name);
	public int sc_del(String st_idx,String s_date);
}
