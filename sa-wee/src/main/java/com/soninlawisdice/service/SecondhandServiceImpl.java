package com.soninlawisdice.service;

import java.util.List;

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
	public List<TradeVO> selectTradeList(SearchCriteria scri) {

		return secondhandMapper.selectTradeList(scri);
	}

	@Override
	public int tradeListCount(SearchCriteria scri) {
		return secondhandMapper.tradeListCount(scri);
	}
}
