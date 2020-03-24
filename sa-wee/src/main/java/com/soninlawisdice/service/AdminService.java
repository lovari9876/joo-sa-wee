package com.soninlawisdice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.AdminMapper;
import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;

import com.soninlawisdice.vo.SearchCriteria;

@Service
public class AdminService {

	@Autowired
	AdminMapper adminMapper;

	// 목록
	public List<StatisticsVO> selectAdminList() throws Exception {
		return adminMapper.selectAdminList();
	}

	// 페이징 처리된 목록
	public List<StatisticsVO> list(SearchCriteria scri) throws Exception {
		return adminMapper.list(scri);
	}
	
	public List<MemberVO> memberList(SearchCriteria scri) throws Exception {
		return adminMapper.memberList(scri);
	}
	
	public List<ReportVO> reportList(SearchCriteria scri) throws Exception {
		return adminMapper.reportList(scri);
	}
	
	public List<Board_writeVO> boardList(SearchCriteria scri) throws Exception {
		return adminMapper.boardList(scri);
	}
	
	

	// 전체 글 갯수
	public int listCount(SearchCriteria scri) throws Exception {
		return adminMapper.listCount(scri);
	}

	// 차트 데이터
	public List<StatisticsVO> chartData() throws Exception {
		return adminMapper.chartData();
	}
	
	//ajax json
	public List<ReportVO> reportTab() throws Exception {
		return adminMapper.reportTab();
	}
	

	// 글보기
	public StatisticsVO selectAdminView(int st_no) throws Exception {
		return adminMapper.selectAdminView(st_no);
	}
	
	public MemberVO selectMemberView(int m_no) throws Exception {
		return adminMapper.selectMemberView(m_no);
	}
	
	public ReportVO selectReportView(int r_no) throws Exception {
		return adminMapper.selectReportView(r_no);
	}
	
//	public RankVO selectRankView(int m_no) throws Exception {
//		return adminMapper.selectRankView(m_no);
//	}

	// 글삭제
	public void selectDelete(Board_writeVO boardVO) throws Exception {
		adminMapper.selectDelete(boardVO);
	}

}
