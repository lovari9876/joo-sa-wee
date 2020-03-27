package com.soninlawisdice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.mapper.SecondhandMapper;

@Service("SecondhandService")
public class SecondhandServiceImpl implements SecondhandService {
	
	@Autowired
	SecondhandMapper secondhandMapper; 
	
	@Override
	public ArrayList<TradeVO> selectTradeList() {
		
		return secondhandMapper.selectTradeList();
	}

}
