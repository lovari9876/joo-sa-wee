package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;

public interface SecondhandMapper {
	public ArrayList<HashMap<String, Object>> selectTradeList(SearchCriteria scri);	
	
	public int tradeListCount(SearchCriteria scri);
}
