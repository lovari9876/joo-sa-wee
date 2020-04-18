package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.soninlawisdice.vo.PaymentVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.vo.Trade_gameVO;

public interface SecondhandMapper {
	
	// list
	public ArrayList<HashMap<String, Object>> selectTradeList(
			@Param("scri") SearchCriteria scri, @Param("s_content") String s_content, @Param("sort") String sort);	
	
	// list count
	public int tradeListCount(
			@Param("scri") SearchCriteria scri, @Param("s_content") String s_content);
	
	// content view
	public HashMap<String, Object> selectContentOne(int t_no);
	
	// content view: selectTrade_game
	public ArrayList<Trade_gameVO> selectTrade_gameList(int t_no);
	
	// delete
	public void deleteContent(@Param("tradeVO") TradeVO tradeVO);
	
	//admin용 delete
	public void deleteContent(int t_no);	
	
	// 조회수: hit
	public void upHitContent(int t_no); 

	// 글 insert
	public void insertTrade(@Param("tradeVO") TradeVO tradeVO, @Param("m_no") int m_no, 
								@Param("gamePrice") LinkedHashMap<String, Integer> gamePrice,
									@Param("list") List<Map<String, Object>> list);
	
	// 글 작성 포인트 update
	public void boardPointUpdate(@Param("m_no") int m_no);

	// 글 수정: TRADE
	public void modify(@Param("tradeVO") TradeVO tradeVO, 
							@Param("gamePrice") LinkedHashMap<String, Integer> gamePrice);
	
	// 구매요청(판매중-> 거래하기 modal-> checkbox 구매요청)
	public void call_buy(@Param("tradeVO") TradeVO tradeVO, 
							@Param("tg_noList") ArrayList<Integer> tg_noList, @Param("buyer") int buyer);
	
	// 회원정보 -> 내 구매/ 내 판매 리스트
	public ArrayList<HashMap<String, Object>> selectPaymentList(@Param("m_no") int m_no, @Param("who") String who);

	// 내 거래: 거래 하나의 ptgList(게임, 가격)
	public ArrayList<HashMap<String, Object>> selectPTGList(@Param("p_no") int p_no);
	
	// buy_modal에서 결제 버튼 눌러서 결제 완료 후에 payment 업뎃
	public void updatePaymentSuccess(@Param("p_no") int p_no);
	
	// trade와 관련된 payment 몇 개 있니?
	public int countPayment(@Param("t_no") int t_no);
	
	// 판매자 운송장 payment에 update
	public void updatePaymentTracking(@Param("paymentVO") PaymentVO paymentVO);
}
