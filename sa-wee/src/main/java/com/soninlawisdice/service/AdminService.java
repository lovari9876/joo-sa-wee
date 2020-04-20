package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.FaqVO;
import com.soninlawisdice.vo.GameVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.PaymentVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.vo.WD_recordVO;

public interface AdminService {


	//mypage : 내가쓴글, 댓글 목록
	public ArrayList<HashMap<String, Object>> myBoardList(int m_no);
	
	public ArrayList<HashMap<String, Object>> myCommentList(int m_no);
		
	//mypage scrap 스크랩 
	public void scrapInsert(int m_no, String sc_boardtype, int sc_no);
	
	//mypage scrap 스크랩  삭제 
	public void scrapDelete(int m_no, String sc_boardtype, int sc_no);
	
	
	// 스크랩 중복 확인
	public int scrapSelect(int m_no, String sc_boardtype, int sc_no);
	
	//mypage scrap List
	public ArrayList<HashMap<String, Object>> scrapList(int m_no);
	
	//mypage report List 신고
	public ArrayList<HashMap<String, Object>> myReportList(int m_no);
	
		
	// 페이징 처리 + 검색  List
	public ArrayList<HashMap<String, Object>> boardList(SearchCriteria scri, int bt_no, String s_content, String sort);
	public int board_listCount(SearchCriteria scri, int bt_no, String s_content);
	
	public List<MemberVO> memberList(SearchCriteria scri, String sort);
	public int member_listCount(SearchCriteria scri);
	
	public ArrayList<HashMap<String, Object>> reportList(SearchCriteria scri, String r_type);
	public int report_listCount(SearchCriteria scri, String r_type);
	
	public ArrayList<HashMap<String, Object>> wd_recordList(SearchCriteria scri);
	public int wd_record_listCount(SearchCriteria scri);	
	
	public ArrayList<HashMap<String, Object>> cafe_reviewList(SearchCriteria scri, String sort);
	public int cafe_review_listCount(SearchCriteria scri);	
	
	public List<FaqVO> faqList(SearchCriteria scri, int s_no);
	public int faq_listCount(SearchCriteria scri, int s_no);
	
	public ArrayList<HashMap<String, Object>> tradeList(SearchCriteria scri);
	public int tradeListCount(SearchCriteria scri);
	
	
	// trade : p_price 값 가져오기 
	public PaymentVO selectTrade(int p_no);
	
	
	// 메인 FAQ 페이지 조회수 
	public void upHitFaq(int faq_no);
	

	// 차트 데이터 
	public List<StatisticsVO> chartData();
	
	// 차트 데이터 ( 탈퇴사유 )
	public ArrayList<HashMap<String, Object>> wdData();
	

	// 탭구현을 위한 ajax json 변환
	public List<ReportVO> reportTab();
	
	
	//회원정보수정
	public void updateMember(MemberVO memberVO);
	
	// faq 수정
	public void updateFaq(FaqVO faqVO);
	
	// 수정 : board_write(notice)
	public void updateNotice(Board_writeVO board_writeVO);
	
	// 수정 : cafe
	public void updateCafe(CafeVO cafeVO);
	
	// 수정 : game
	public void updateGame(GameVO gameVO);
		
		
		
	// 회원 탈퇴
	public void outMember(int m_no);

	
	// 무인도 member, board_write, cafe_review, trade 컬럼 변경
	public void updateIsland_member(int bw_no, String r_type);
	
	public void updateIsland_memberReport(int m_no);
	public void updateIsland_bw(int bw_no);
	public void updateIsland_cafe(int cr_no);
	public void updateIsland_trade(int t_no);
	
	// 무인도 원상태 복구
	public void confirmIsland_member(int bw_no, int m_point);

	public void confirmIsland_bw(int bw_no);
	public void confirmIsland_cafe(int cr_no);
	public void confirmIsland_trade(int t_no);
	
	// 회원 포인트 구하기
	public int memberPoint(int m_no);
	
	
	// 글보기

	public MemberVO selectMemberView(int m_no);
	
	public FaqVO faqView(int faq_no);

	public HashMap<String, Object> selectReportView(int r_no, String r_type);

	
	// 글쓰기 
	public void boardInsert(Board_writeVO board_writeVO);
	public void cafeInsert(CafeVO cafeVO);
	public void faqInsert(FaqVO faqVO);
	
	
	// 글삭제
	public void selectDelete(Board_writeVO boardVO);
	public void selectDelete_cafe(Cafe_reviewVO cafe_reviewVO);
	public void selectDelete_trade(TradeVO tradeVO);
	
	public void selectDelete(int bw_no);
	public void selectDelete_cafe(int cr_no);
	public void selectDelete_trade(int t_no);
	
	public void selectDelete_comment(int cm_no);
	
	public void faqDelete(int faq_no);
	
	public void cafeInfoDelete(int c_no);

	
	// 통계
	
	public void setTotalCount();
	public int getTotalCount();
	public int getTodayCount();
	
	public int getTodayBoard();
	public int getTodayComment();
	public int getTodayTrade();

	public void statisticsInsert(StatisticsVO statVo);
	
	public int allMember(); //전체 회원수
	public int allComment();//전체 댓글수
	public int allBoard();	//전체 게시글수

	public ArrayList<HashMap<String, Object>> getWeekStatistics();
	public ArrayList<HashMap<String, Object>> getMonthStatistics();
	
}
