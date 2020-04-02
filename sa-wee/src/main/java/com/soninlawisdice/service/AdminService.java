package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.WD_recordVO;

public interface AdminService {


	
	// 페이징 처리 + 검색  List
	public ArrayList<HashMap<String, Object>> boardList(SearchCriteria scri);
	public int board_listCount(SearchCriteria scri);
	
	public List<MemberVO> memberList(SearchCriteria scri);
	public int member_listCount(SearchCriteria scri);
	
	public ArrayList<HashMap<String, Object>> reportList(SearchCriteria scri);
	public int report_listCount(SearchCriteria scri);
	
	public ArrayList<HashMap<String, Object>> wd_recordList(SearchCriteria scri);
	public int wd_record_listCount(SearchCriteria scri);	
	
	public ArrayList<HashMap<String, Object>> cafe_reviewList(SearchCriteria scri);
	public int cafe_review_listCount(SearchCriteria scri);	
	
	
	
	

	// 차트 데이터 
	public List<StatisticsVO> chartData();
	
	// 차트 데이터 ( 탈퇴사유 )
	public ArrayList<HashMap<String, Object>> wdData();
	

	// 탭구현을 위한 ajax json 변환
	public List<ReportVO> reportTab();
	
	
	//회원정보수정
	public void updateMember(MemberVO memberVO);
	
	//무인도행
	public void updateIsland_bw(int bw_no);
	public void updateIsland_member(int m_no);
	
	

	// 글보기

	public MemberVO selectMemberView(int m_no);

	public HashMap<String, Object> selectReportView(int r_no, String r_type);

	
	
	// 글삭제
	public void selectDelete(Board_writeVO boardVO);
	
	// 통계
	
	public void setTotalCount();
	public int getTotalCount();
	public int getTodayCount();
	
	public int getTodayBoard();
	public int getTodayComment();
	public int getTodayTrade();

	public void statisticsInsert(StatisticsVO statVo);
}
