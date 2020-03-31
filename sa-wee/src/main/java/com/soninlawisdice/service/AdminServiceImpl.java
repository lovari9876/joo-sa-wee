package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.AdminMapper;
import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.WD_recordVO;
import com.soninlawisdice.vo.Board_writeVO;
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
	
	

	// 목록
//	@Override
//	public List<StatisticsVO> selectAdminList() {
//		return adminMapper.selectAdminList();
//	}

	// 페이징 처리된 목록
//	@Override
//	public List<StatisticsVO> statisticsList(SearchCriteria scri){
//		return adminMapper.list(scri);
//	}
	
	
	
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
	public ArrayList<HashMap<String, Object>> boardList(SearchCriteria scri){
		return adminMapper.boardList(scri);
	}
	@Override
	public int board_listCount(SearchCriteria scri){
		return adminMapper.board_listCount(scri);
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
	public StatisticsVO selectAdminView(int st_no) {
		return adminMapper.selectAdminView(st_no);
	}
	
	@Override
	public MemberVO selectMemberView(int m_no) {
		return adminMapper.selectMemberView(m_no);
	}
	
	@Override
	public HashMap<String, Object> selectReportView(int r_no, String r_type) {
		return adminMapper.selectReportView(r_no, r_type);
	}
	
//	public RankVO selectRankView(int m_no) {
//		return adminMapper.selectRankView(m_no);
//	}

	// 수정 : 회원정보
	public void updateMember(MemberVO memberVO) {
		adminMapper.updateMember(memberVO);
	}
		
	
	//무인도행
	public void updateIsland_bw(int bw_no) {
		adminMapper.updateIsland_bw(bw_no);
	}
	public void updateIsland_member(int m_no) {
		adminMapper.updateIsland_member(m_no);
	}
	
	
	
	// 글삭제
	@Override
	public void selectDelete(Board_writeVO boardVO) {
		adminMapper.selectDelete(boardVO);
	}

}
