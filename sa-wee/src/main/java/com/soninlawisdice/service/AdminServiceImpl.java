package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.AdminMapper;
import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.vo.WD_recordVO;
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

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	
	//생성자
	public AdminServiceImpl(AdminMapper adminMapper) {
		super();
		this.adminMapper = adminMapper;
	}
	
	public AdminServiceImpl() {}
	
	//mypage : 내가쓴글, 댓글 목록
	public ArrayList<HashMap<String, Object>> myBoardList(int m_no){
		return adminMapper.myBoardList(m_no);
	}
	
	public ArrayList<HashMap<String, Object>> myCommentList(int m_no){
		return adminMapper.myCommentList(m_no);
	}

	
	//mypage scrap 스크랩 
	public void scrapInsert(int m_no, String sc_boardtype, int sc_no) {
		adminMapper.scrapInsert(m_no, sc_boardtype, sc_no);
	}
	
	
	//mypage scrap 스크랩  삭제 
	public void scrapDelete(int m_no, String sc_boardtype, int sc_no) {
		adminMapper.scrapDelete(m_no, sc_boardtype, sc_no);
	}
	
	
	// 스크랩 중복 확인
	public int scrapSelect(int m_no, String sc_boardtype, int sc_no) {
		return adminMapper.scrapSelect(m_no, sc_boardtype, sc_no);
	}
	
	//mypage scrap List
	public ArrayList<HashMap<String, Object>> scrapList(int m_no){
		return adminMapper.scrapList(m_no);
	}
	
	//mypage report List 신고
	public ArrayList<HashMap<String, Object>> myReportList(int m_no){
		return adminMapper.myReportList(m_no);
	}
	
	// 페이징 처리된 리스트
	@Override
	public List<MemberVO> memberList(SearchCriteria scri, String sort){
		return adminMapper.memberList(scri, sort);
	}
	@Override
	public int member_listCount(SearchCriteria scri){
		return adminMapper.member_listCount(scri);
	}
	
	
	@Override
	public ArrayList<HashMap<String, Object>> reportList(SearchCriteria scri, String r_type){
		return adminMapper.reportList(scri, r_type);
	}
	@Override
	public int report_listCount(SearchCriteria scri, String r_type){
		return adminMapper.report_listCount(scri, r_type);
	}
	
	
	@Override
	public ArrayList<HashMap<String, Object>> boardList(SearchCriteria scri, int bt_no, String s_content, String sort){
		return adminMapper.boardList(scri, bt_no, s_content, sort);
	}
	@Override
	public int board_listCount(SearchCriteria scri, int bt_no, String s_content){
		return adminMapper.board_listCount(scri, bt_no, s_content);
	}
	
	
	@Override
	public ArrayList<HashMap<String, Object>> wd_recordList(SearchCriteria scri){
		return adminMapper.wd_recordList(scri);
	}
	@Override
	public int wd_record_listCount(SearchCriteria scri){
		return adminMapper.wd_record_listCount(scri);
	}
	
	
	@Override
	public ArrayList<HashMap<String, Object>> cafe_reviewList(SearchCriteria scri, String sort){
		return adminMapper.cafe_reviewList(scri, sort);
	}
	@Override
	public int cafe_review_listCount(SearchCriteria scri){
		return adminMapper.cafe_review_listCount(scri);
	}
	
	
	@Override
	public List<FaqVO> faqList(SearchCriteria scri, int s_no){
		return adminMapper.faqList(scri, s_no);
	}
	@Override
	public int faq_listCount(SearchCriteria scri, int s_no){
		return adminMapper.faq_listCount(scri, s_no);
	}
	
	
	@Override
	public ArrayList<HashMap<String, Object>> tradeList(SearchCriteria scri){
		return adminMapper.tradeList(scri);
	}
	@Override
	public int tradeListCount(SearchCriteria scri) {
		return adminMapper.tradeListCount(scri);
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> sponsorList(SearchCriteria scri){
		return adminMapper.sponsorList(scri);
	}
	@Override
	public int sponsorListCount(SearchCriteria scri) {
		return adminMapper.sponsorListCount(scri);
	}
	
	
	@Override
	public ArrayList<HashMap<String, Object>> commentList(SearchCriteria scri){
		return adminMapper.commentList(scri);
	}
	@Override
	public int commentListCount(SearchCriteria scri) {
		return adminMapper.commentListCount(scri);
	}
	
	
	
	// trade : p_price 값 가져오기 
	public PaymentVO selectTrade(int p_no) {
		return adminMapper.selectTrade(p_no);
	}
	
	
	
	
	
	
	
	
	// 메인 FAQ 페이지 조회수 
	public void upHitFaq(int faq_no) {
		adminMapper.upHitFaq(faq_no);
	}

	
	
	

	// 차트 데이터
	@Override
	public List<StatisticsVO> chartData() {
		return adminMapper.chartData();
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> wdData() {
		return adminMapper.wdData();
	}
	
	
	
	
	
	//ajax json
	@Override
	public List<ReportVO> reportTab() {
		return adminMapper.reportTab();
	}
	

	// 글보기
	@Override
	public MemberVO selectMemberView(int m_no) {
		return adminMapper.selectMemberView(m_no);
	}
	
	@Override
	public FaqVO faqView(int faq_no) {
		return adminMapper.faqView(faq_no);
	}
	
	
	@Override
	public HashMap<String, Object> selectReportView(int r_no, String r_type) {
		return adminMapper.selectReportView(r_no, r_type);
	}
	
	
	// 글쓰기 
	public void boardInsert(Board_writeVO board_writeVO) {
		adminMapper.boardInsert(board_writeVO);
	}
	
	public void cafeInsert(CafeVO cafeVO) {
		adminMapper.cafeInsert(cafeVO);
	}
	
	public void faqInsert(FaqVO faqVO) {
		adminMapper.faqInsert(faqVO);
	}
	
	
	
	
	// 수정 : 회원정보
	@Override
	public void updateMember(MemberVO memberVO) {
		adminMapper.updateMember(memberVO);
	}
	
	// 수정 : faq
	@Override
	public void updateFaq(FaqVO faqVO) {
		adminMapper.updateFaq(faqVO);
	}
	
	// 수정 : board_write(notice)
	@Override
	public void updateNotice(Board_writeVO board_writeVO) {
		adminMapper.updateNotice(board_writeVO);
	}
	
	// 수정 : cafe
	@Override
	public void updateCafe(CafeVO cafeVO) {
		adminMapper.updateCafe(cafeVO);
	}
	
	// 수정 : game
	public void updateGame(GameVO gameVO) {
		adminMapper.updateGame(gameVO);
	}
	
	
	// 회원탈퇴
	@Override
	public void outMember(int m_id) {
		adminMapper.outMember(m_id);
	}
	
	
	//무인도행
	@Override
	public void updateIsland_member(int bw_no, String r_type) {
		adminMapper.updateIsland_member(bw_no, r_type);
	}
	
	@Override
	public void updateIsland_memberReport(int m_no) {
		adminMapper.updateIsland_memberReport(m_no);
	}
	
	@Override
	public void updateIsland_bw(int bw_no) {
		adminMapper.updateIsland_bw(bw_no);
	}

	@Override
	public void updateIsland_cafe(int cr_no) {
		adminMapper.updateIsland_cafe(cr_no);
	}

	@Override
	public void updateIsland_trade(int t_no) {
		adminMapper.updateIsland_trade(t_no);
	}

	
	// 무인도 원상태 복구
	public void confirmIsland_member(int bw_no, int m_point) {
		adminMapper.confirmIsland_member(bw_no, m_point);
	}
	
	
	public void confirmIsland_bw(int bw_no) {
		adminMapper.confirmIsland_bw(bw_no);
	}
	public void confirmIsland_cafe(int cr_no) {
		adminMapper.confirmIsland_cafe(cr_no);
	}
	public void confirmIsland_trade(int t_no) {
		adminMapper.confirmIsland_trade(t_no);
	}
	
	// 회원 포인트 구하기
	public int memberPoint(int m_no) {
		return adminMapper.memberPoint(m_no);
	}
	

	
	// 글삭제
	@Override
	public void selectDelete(Board_writeVO boardVO) {
		adminMapper.selectDelete(boardVO);
	}
	
	@Override
	public void selectDelete_cafe(Cafe_reviewVO cafe_reviewVO) {
		adminMapper.selectDelete_cafe(cafe_reviewVO);
	}
	
	@Override
	public void selectDelete_trade(TradeVO tradeVO) {
		adminMapper.selectDelete_trade(tradeVO);
	}
	
	
	@Override
	public void selectDelete(int bw_no) {
		adminMapper.selectDelete(bw_no);
	}

	
	@Override
	public void selectDelete_comment(int cm_no) {
		adminMapper.selectDelete_comment(cm_no);
	}

	
	@Override
	public void selectDelete_cafe(int cr_no) {
		adminMapper.selectDelete_cafe(cr_no);
	}
	
	@Override
	public void selectDelete_trade(int t_no) {
		adminMapper.selectDelete_trade(t_no);
	}
	
	@Override
	public void cafeInfoDelete(int c_no) {
		adminMapper.cafeInfoDelete(c_no);
	}
	
	
	
	
	
	
	@Override
	public void faqDelete(int faq_no) {
		adminMapper.faqDelete(faq_no);
	}
	

	// 통계
	@Override
	public void setTotalCount() {
		adminMapper.setTotalCount();
	}
	@Override
	public int getTotalCount() {
		return adminMapper.getTotalCount();
	}
	@Override
	public int getTodayCount() {
		return adminMapper.getTodayCount();
	}
	
	
	
	@Override
	public int getTodayBoard() {
		return adminMapper.getTodayBoard();
	}
	@Override
	public int getTodayComment() {
		return adminMapper.getTodayComment();
	}
	@Override
	public int getTodayTrade() {
		return adminMapper.getTodayTrade();
	}
	@Override
	public void statisticsInsert(StatisticsVO statVo) {
		adminMapper.statisticsInsert(statVo);
	}
	
	
	@Override
	public int allMember() {
		return adminMapper.allMember();
	}
	@Override
	public int allComment() {
		return adminMapper.allComment();
	}
	@Override
	public int allBoard() {
		return adminMapper.allBoard();
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> getWeekStatistics() {
		return adminMapper.getWeekStatistics();
	}
	@Override
	public ArrayList<HashMap<String, Object>> getMonthStatistics() {
		return adminMapper.getMonthStatistics();
	}
	
	
}
