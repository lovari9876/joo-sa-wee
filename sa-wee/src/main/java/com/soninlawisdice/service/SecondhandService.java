package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;

public interface SecondhandService {
	public ArrayList<HashMap<String, Object>> selectTradeList(SearchCriteria scri, String s_content);
	
	public int tradeListCount(SearchCriteria scri, String s_content);
}
