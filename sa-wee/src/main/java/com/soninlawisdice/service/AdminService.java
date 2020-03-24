package com.soninlawisdice.service;

import java.util.List;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.StatisticsVO;

public interface AdminService {

	// 목록
//	public List<StatisticsVO> selectAdminList();

	
	// 페이징 처리 + 검색  List

	public List<Board_writeVO> boardList(SearchCriteria scri);
	public int board_listCount(SearchCriteria scri);
	
	public List<MemberVO> memberList(SearchCriteria scri);
	public int member_listCount(SearchCriteria scri);
	
	public List<ReportVO> reportList(SearchCriteria scri);
	public int report_listCount(SearchCriteria scri);

//	public List<StatisticsVO> statisticsList(SearchCriteria scri);
//	public int statistics_listCount(SearchCriteria scri);
	
	
	
	

	// 차트 데이터
	public List<StatisticsVO> chartData();

	// 탭구현을 위한 ajax json 변환
	public List<ReportVO> reportTab();
	
	

	// 글보기
	public StatisticsVO selectAdminView(int st_no);

	public MemberVO selectMemberView(int m_no);

	public ReportVO selectReportView(int r_no);

	
	
	
	// 글삭제
	public void selectDelete(Board_writeVO boardVO);

}