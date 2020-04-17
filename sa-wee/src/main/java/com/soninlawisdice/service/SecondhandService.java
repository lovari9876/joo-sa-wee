package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.soninlawisdice.vo.GameVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.vo.Trade_gameVO;

public interface SecondhandService {
	
	// list
	public ArrayList<HashMap<String, Object>> selectTradeList(SearchCriteria scri, String s_content, String sort);
	
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
	
	// 글 작성 포인트 update
	public void boardPointUpdate(int m_no);

	// 글 수정: TRADE
	public void modify(TradeVO tradeVO, String gameNames, String prices);

	// 구매요청(판매중-> 거래하기 modal-> checkbox 구매요청)
	public void call_buy(TradeVO tradeVO, String[] tgArr, int buyer);

	// 회원정보 -> 내 구매/ 내 판매 리스트
	public ArrayList<HashMap<String, Object>> selectPaymentList(int m_no, String who);

	// 내 거래: 거래 하나의 ptgList(게임, 가격)
	public ArrayList<HashMap<String, Object>> selectPTGList(int pno);

	// pay_modal에서 결제 버튼 눌러서 결제 완료 후에 payment 업뎃
	public void updatePaymentSuccess(int p_no);

	// trade와 관련된 payment 몇 개 있니?
	public int countPayment(int t_no);
}
