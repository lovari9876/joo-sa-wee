package com.soninlawisdice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.WD_recordVO;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.SearchCriteria;

public interface AdminMapper {

	// 목록 출력
//	@Select("select * from statistics")
//	public List<StatisticsVO> selectAdminList();
	

	// 페이징 처리 + 검색  List
	public List<Board_writeVO> boardList(SearchCriteria scri);
	public int board_listCount(SearchCriteria scri);
	
	public List<MemberVO> memberList(SearchCriteria scri);
	public int member_listCount(SearchCriteria scri);
	
	public List<ReportVO> reportList(SearchCriteria scri);
	public int report_listCount(SearchCriteria scri);
	
	public List<WD_recordVO> wd_recordList(SearchCriteria scri);
	public int wd_record_listCount(SearchCriteria scri);
	



	
	
	
//	public List<StatisticsVO> list(SearchCriteria scri);

	
	
	// 차트 : 최근 값 7개 출력 
	@Select("select * from (select st_no, st_post_num, st_date, st_comment_num, st_trade_num from statistics order by st_no desc)" + 
			"where rownum <= 7")
	public List<StatisticsVO> chartData();
	
	// 차트 : 탈퇴사유
	public List<WD_recordVO> wdData();

	
	//ajax json tab 
	@Select("select * from report")
	public List<ReportVO> reportTab();
	
	
	
	// 삭제
	@Delete("delete board_write where bw_no = #{bw_no}")
	public void selectDelete(Board_writeVO boardVO);
	
	
	// 글보기
	@Select("select * from statistics where st_no=#{st_no}")
	public StatisticsVO selectAdminView(int st_no);
	
	@Select("select * from member where m_no=#{m_no}")
	public MemberVO selectMemberView(int m_no);

	/* @Select("select * from report where r_no=#{r_no}") */
	public ReportVO selectReportView(@Param("r_no") int r_no, @Param("r_type")String r_type);


	
//	public RankVO selectRankView(int m_no);


}
