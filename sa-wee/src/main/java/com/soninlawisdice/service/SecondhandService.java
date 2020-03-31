package com.soninlawisdice.service;

import java.util.List;

import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;

public interface SecondhandService {
	public List<TradeVO> selectTradeList(SearchCriteria scri);
	
	public int tradeListCount(SearchCriteria scri);
}
