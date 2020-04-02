package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.mapper.SecondhandMapper;

@Service("SecondhandService")
public class SecondhandServiceImpl implements SecondhandService {

	@Autowired
	SecondhandMapper secondhandMapper;

	@Override
	public ArrayList<HashMap<String, Object>> selectTradeList(SearchCriteria scri, String s_content) {
		
		return secondhandMapper.selectTradeList(scri, s_content);
	}

	@Override
	public int tradeListCount(SearchCriteria scri, String s_content) {
		return secondhandMapper.tradeListCount(scri, s_content);
	}
}
