package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;

public interface SecondhandService {
	
	// list
	public ArrayList<HashMap<String, Object>> selectTradeList(SearchCriteria scri, String s_content);
	
	// list count
	public int tradeListCount(SearchCriteria scri, String s_content);

	// content view
	public HashMap<String, Object> selectContentOne(int t_no);
	
	// delete
	public void deleteContent(TradeVO tradeVO);
	
	// 조회수: hit
	public void upHitContent(int t_no); 
}
