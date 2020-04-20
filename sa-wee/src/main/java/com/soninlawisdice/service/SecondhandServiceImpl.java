package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.soninlawisdice.mapper.SecondhandMapper;
import com.soninlawisdice.util.FileUtils;
import com.soninlawisdice.vo.PaymentVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.vo.Trade_gameVO;

@Service("SecondhandService")
public class SecondhandServiceImpl implements SecondhandService {

	@Autowired
	SecondhandMapper secondhandMapper;

	// list
	@Override
	public ArrayList<HashMap<String, Object>> selectTradeList(SearchCriteria scri, String s_content, String sort) {

		return secondhandMapper.selectTradeList(scri, s_content, sort);
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

	// content view: selectTrade_game
	public ArrayList<Trade_gameVO> selectTrade_gameList(int t_no) {

		return secondhandMapper.selectTrade_gameList(t_no);
	}

	// delete
	@Override
	public void deleteContent(TradeVO tradeVO) {

		secondhandMapper.deleteContent(tradeVO);
	}
	//admin용 delete
	@Override
	public void deleteContent(int t_no) {
		secondhandMapper.deleteContent(t_no);
	}

	// 조회수: hit
	@Override
	public void upHitContent(int t_no) {

		secondhandMapper.upHitContent(t_no);
	}

	// 글 insert
	@Resource(name = "fileUtils")
	private FileUtils fileUtils;
	@Override
	public void insertTrade(TradeVO tradeVO, int m_no, String gameNames, String prices, MultipartHttpServletRequest mpRequest) throws Exception{

		// 쉼표로 구분하여 받은 gameNames을 잘라서 List에 담기
		StringTokenizer gn = new StringTokenizer(gameNames, ",");
		// 쉼표로 구분하여 받은 prices를 잘라서 List에 담기
		StringTokenizer gp = new StringTokenizer(prices, ",");

		LinkedHashMap<String, Integer> gamePrice = new LinkedHashMap<>();

		// 차례로 넣기...
		while (gn.hasMoreTokens()) {
			String gnt = null;
			String gpt = null; // 커서 이동 막기

			if (gp.hasMoreTokens() /*
									 * & ((gpt = gp.nextToken()).trim() != "" | gpt != "" | gpt != null | gpt.trim()
									 * != null)
									 */) {// if true
				try {
					gamePrice.put((gnt = gn.nextToken()).trim(), Integer.parseInt((gpt = gp.nextToken()).trim()));
				} catch (NumberFormatException e) { // 빈 문자열 넣거나, 숫자가 아닌 문자 넣을 때...
					gamePrice.put(gnt.trim(), 0);
				} catch (Exception e) {
				}
			} else // 가격 입력 개수 적으면 걍 0 넣어
				gamePrice.put(gn.nextToken(), 0);
		}
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileIofn(mpRequest);
		
		int size = list.size();
		System.out.println("===============");
		System.out.println("ServiceImpl 에서 list size 출력 : " + size);
		System.out.println("=================");
		
		for(int i = 0; i<size; i++) {
			System.out.println("============");
			System.out.println("list for문 돌리기 ");
			System.out.println("============");
		}

		secondhandMapper.insertTrade(tradeVO, m_no, gamePrice, list);
	}
	
	// 글 작성 포인트 update
	@Override
	public void boardPointUpdate(int m_no) {
		secondhandMapper.boardPointUpdate(m_no);
	}

	// 글 수정: TRADE
	@Override
	public void modify(TradeVO tradeVO, String gameNames, String prices) {
		// 쉼표로 구분하여 받은 gameNames을 잘라서 List에 담기
		StringTokenizer gn = new StringTokenizer(gameNames, ",");
		// 쉼표로 구분하여 받은 prices를 잘라서 List에 담기
		StringTokenizer gp = new StringTokenizer(prices, ",");

		LinkedHashMap<String, Integer> gamePrice = new LinkedHashMap<>();

		// 차례로 넣기...
		while (gn.hasMoreTokens()) {
			String gnt = null;
			String gpt = null; // 커서 이동 막기

			if (gp.hasMoreTokens()) {// if true
				try {
					gamePrice.put((gnt = gn.nextToken()).trim(), Integer.parseInt((gpt = gp.nextToken()).trim()));
				} catch (NumberFormatException e) { // 빈 문자열 넣거나, 숫자가 아닌 문자 넣을 때...
					gamePrice.put(gnt.trim(), 0);
				} catch (Exception e) {
				}
			} else // 가격 입력 개수 적으면 걍 0 넣어
				gamePrice.put(gn.nextToken(), 0);
		}

		secondhandMapper.modify(tradeVO, gamePrice);
	}

	// 구매요청(판매중-> 거래하기 modal-> checkbox 구매요청)
	@Override
	public void call_buy(TradeVO tradeVO, String[] tgArr, int buyer) {
		ArrayList<Integer> tg_noList = new ArrayList<>();

		// tg_no만 담은 ArrayList 만들어서 넘기기
		for (int i = 0; i < tgArr.length; i++) {
			tg_noList.add(Integer.parseInt(tgArr[i]));
		}

		secondhandMapper.call_buy(tradeVO, tg_noList, buyer);
	}
	
	
	// 회원정보 -> 내 구매/ 내 판매 리스트
	@Override
	public ArrayList<HashMap<String, Object>> selectPaymentList(int m_no, String who) {
		return secondhandMapper.selectPaymentList(m_no, who);
	}	
	
	// 내 거래: 거래 하나의 ptgList(게임, 가격)
	@Override
	public ArrayList<HashMap<String, Object>> selectPTGList(int p_no) {
		return secondhandMapper.selectPTGList(p_no);
	}
	
	// 구매자가 거래취소 payment에 update
	@Override
	public void updatePaymentBuyerCancel(PaymentVO paymentVO) {
		secondhandMapper.updatePaymentBuyerCancel(paymentVO);
	}
	
	// buy_modal에서 결제 버튼 눌러서 결제 완료 후에 payment 업뎃
	@Override
	public void updatePaymentSuccess(int p_no) {
		secondhandMapper.updatePaymentSuccess(p_no);
	}
	
	// trade와 관련된 payment 몇 개 있니?
	@Override
	public int countPayment(int t_no) {
		return secondhandMapper.countPayment(t_no);
	}
	
	// 판매자 운송장 payment에 update
	@Override
	public void updatePaymentTracking(PaymentVO paymentVO) {
		secondhandMapper.updatePaymentTracking(paymentVO);
	}
	
	// 구매자가 수취확인 payment에 update
	@Override
	public void updatePaymentBuyerConfirm(PaymentVO paymentVO) {
		secondhandMapper.updatePaymentBuyerConfirm(paymentVO);
	}

	
}
