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

//  목록
//	public List<StatisticsVO> selectAdminList();

	
	// 페이징 처리 + 검색  List
	public ArrayList<HashMap<String, Object>> boardList(SearchCriteria scri);
	public int board_listCount(SearchCriteria scri);
	
	public List<MemberVO> memberList(SearchCriteria scri);
	public int member_listCount(SearchCriteria scri);
	
	public ArrayList<HashMap<String, Object>> reportList(SearchCriteria scri);
	public int report_listCount(SearchCriteria scri);
	
	public ArrayList<HashMap<String, Object>> wd_recordList(SearchCriteria scri);
	public int wd_record_listCount(SearchCriteria scri);	
	

//	public List<StatisticsVO> statisticsList(SearchCriteria scri);
//	public int statistics_listCount(SearchCriteria scri);
	
	
	
	

	// 차트 데이터 
	public List<StatisticsVO> chartData();
	
	// 차트 데이터 ( 탈퇴사유 )
	public ArrayList<HashMap<String, Object>> wdData();
	

	// 탭구현을 위한 ajax json 변환
	public List<ReportVO> reportTab();
	
	
	public void updateMember(MemberVO memberVO);
	

	// 글보기
	public StatisticsVO selectAdminView(int st_no);

	public MemberVO selectMemberView(int m_no);

	public HashMap<String, Object> selectReportView(int r_no, String r_type);

	
	
	// 글삭제
	public void selectDelete(Board_writeVO boardVO);

}
