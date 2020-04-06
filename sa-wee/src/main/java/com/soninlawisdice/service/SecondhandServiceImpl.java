package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.vo.Trade_gameVO;
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
	
	// 글 insert
	@Override
	public void insertTrade(TradeVO tradeVO, int m_no) {
		
	}

	// 판매 또는 구매할 보드게임 insert (multiple value)
	@Override
	public void insertTrade_game(TradeVO tradeVO, String gameName) {
		
//		List<Trade_gameVO> tgList = new ArrayList<>();
		
		// 쉼표로 구분하여 받은 gameName을 잘라서 tgVO에 담기
//		StringTokenizer st = new StringTokenizer(gameName, ",");	
//		
//		// 차례로 넣기...
//		while(st.hasMoreTokens()) {			
//			Trade_gameVO tgVO = new Trade_gameVO();
//			tgVO.setTg_name(st.nextToken());
//			
//			secondhandMapper.insertTrade_game(tradeVO, tgVO);
//			
//			//tgList.add(tgVO);
//		}
		
		secondhandMapper.insertTrade_game(tradeVO, tgVO);
		
		
	}

	// 글 작성 포인트 update
	@Override
	public void boardPointUpdate(int m_no) {
		
	}
}




