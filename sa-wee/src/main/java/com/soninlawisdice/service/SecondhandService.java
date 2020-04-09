package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.GameVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.vo.Trade_gameVO;

public interface SecondhandService {
	
	// list
	public ArrayList<HashMap<String, Object>> selectTradeList(SearchCriteria scri, String s_content);
	
	// list count
	public int tradeListCount(SearchCriteria scri, String s_content);

	// content view
	public HashMap<String, Object> selectContentOne(int t_no);
	
	// content view: selectTrade_game
	public ArrayList<Trade_gameVO> selectTrade_gameList(int t_no); 
	
	// delete
	public void deleteContent(TradeVO tradeVO);
	
	// 조회수: hit
	public void upHitContent(int t_no);

	// 글 insert
	public void insertTrade(TradeVO tradeVO, int m_no, String gameNames, String prices);

	// 판매 또는 구매할 보드게임 insert (multiple value)
//	public void insertTrade_game(TradeVO tradeVO, int m_no, String gameName);

	// 글 작성 포인트 update
	public void boardPointUpdate(int m_no);

	// 글 수정: TRADE
	public void modify(TradeVO tradeVO, String fromIsland);

	// 글 수정: TRADE_GAME
	public void modifyTG(int t_no, String gameNames, String prices);
}
