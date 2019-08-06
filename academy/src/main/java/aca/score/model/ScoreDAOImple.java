package aca.score.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ScoreDAOImple implements ScoreDAO {

	private SqlSessionTemplate sqlMap;
	
	public ScoreDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List sc_select(ScoreDTO dto) {
		List lists = sqlMap.selectList("sc_select", dto);
		return lists;
	}

	public ScoreDTO sc_selectOne(String s_date, int st_idx) {
		HashMap map = new HashMap();
		map.put("s_date", s_date);
		map.put("st_idx", st_idx);
		ScoreDTO dto = sqlMap.selectOne("sc_selectOne", map);
		return dto;
	}

	public ScoreDTO sc_avgSelect(String s_date, String st_level) {
		HashMap map = new HashMap();
		map.put("s_date", s_date);
		map.put("st_level", st_level);
		ScoreDTO dto = sqlMap.selectOne("sc_avgSelect",map);
		return dto;
	}

	public List sc_selectScore(int st_idx) {
		List scList = sqlMap.selectList("sc_selectScore", st_idx);
		return scList;
	}
	
	public List sc_stSelect() {
		List lists = sqlMap.selectList("sc_stSelect");
		return lists;
	}
	
	public int sc_add(ScoreDTO dto) {
		int c = sqlMap.insert("sc_add", dto);
		return c;
	}
	
	
	//추가
	public ScoreDTO sc_selectOne(ScoreDTO dto) {
		dto = sqlMap.selectOne("sc_addChk",dto);
		return dto;
	}
	
	public List sc_stScoreList(String st_idx) {
		List lists = sqlMap.selectList("sc_stScoreList", st_idx);
		return lists;
	}

	public int sc_stScoreUpdate(ScoreDTO dto) {
		int c = sqlMap.update("sc_stScoreUpdate", dto);
		return c;
	}

	public List sc_stSelect(String st_name) {
		List lists = sqlMap.selectList("sc_stSelect2",st_name);
		return lists;
	}

	public int sc_del(String st_idx, String s_date) {
		HashMap map = new HashMap();
		map.put("st_idx", st_idx);
		map.put("s_date",s_date);		
		int c = sqlMap.delete("sc_del", map);
		return c;
	}

	
}
