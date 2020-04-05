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

	// list
	@Override
	public ArrayList<HashMap<String, Object>> selectTradeList(SearchCriteria scri, String s_content) {
		
		return secondhandMapper.selectTradeList(scri, s_content);
	}

	// list count
	@Override
	public int tradeListCount(SearchCriteria scri, String s_content) {
		return secondhandMapper.tradeListCount(scri, s_content);
	}
	
	// content view
	@Override
	public HashMap<String, Object> selectContentOne(int t_no) {
		
		return secondhandMapper.selectContentOne(t_no);
	}
	
	// delete
	@Override
	public void deleteContent(TradeVO tradeVO) {
		
		secondhandMapper.deleteContent(tradeVO);
	}

	// 조회수: hit
	@Override
	public void upHitContent(int t_no) {
		
		secondhandMapper.upHitContent(t_no);	
	}
}
