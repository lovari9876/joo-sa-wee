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
import com.soninlawisdice.vo.MemberVO;
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
	
	


	// 페이징 처리된 리스트
	
	
	@Override
	public List<MemberVO> memberList(SearchCriteria scri){
		return adminMapper.memberList(scri);
	}
	@Override
	public int member_listCount(SearchCriteria scri){
		return adminMapper.member_listCount(scri);
	}
	
	
	@Override
	public ArrayList<HashMap<String, Object>> reportList(SearchCriteria scri){
		return adminMapper.reportList(scri);
	}
	@Override
	public int report_listCount(SearchCriteria scri){
		return adminMapper.report_listCount(scri);
	}
	
	
	@Override
	public ArrayList<HashMap<String, Object>> boardList(SearchCriteria scri, int bt_no, String s_content){
		return adminMapper.boardList(scri, bt_no, s_content);
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
	public ArrayList<HashMap<String, Object>> cafe_reviewList(SearchCriteria scri){
		return adminMapper.cafe_reviewList(scri);
	}
	@Override
	public int cafe_review_listCount(SearchCriteria scri){
		return adminMapper.cafe_review_listCount(scri);
	}
	
	
	@Override
	public List<FaqVO> faqList(SearchCriteria scri){
		return adminMapper.faqList(scri);
	}
	@Override
	public int faq_listCount(SearchCriteria scri){
		return adminMapper.faq_listCount(scri);
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
	
}
