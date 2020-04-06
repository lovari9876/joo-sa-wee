package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;

public interface SecondhandMapper {
	
	// list
	public ArrayList<HashMap<String, Object>> selectTradeList(
			@Param("scri") SearchCriteria scri, @Param("s_content") String s_content);	
	
	// list count
	public int tradeListCount(
			@Param("scri") SearchCriteria scri, @Param("s_content") String s_content);
	
	// content view
	public HashMap<String, Object> selectContentOne(int t_no);
	
	// delete
	public void deleteContent(TradeVO tradeVO);
	
	// 조회수: hit
	public void upHitContent(int t_no); 
}
