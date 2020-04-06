package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.vo.WD_recordVO;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.SearchCriteria;

public interface AdminMapper {

	// 목록 출력
//	@Select("select * from statistics")
//	public List<StatisticsVO> selectAdminList();
	

	// 페이징 처리 + 검색  List
	public ArrayList<HashMap<String, Object>> boardList(@Param("scri") SearchCriteria scri, @Param("bt_no") int bt_no);
	
	public int board_listCount(@Param("scri") SearchCriteria scri, @Param("bt_no") int bt_no);
	
	public List<MemberVO> memberList(SearchCriteria scri);
	public int member_listCount(SearchCriteria scri);
	
	public ArrayList<HashMap<String, Object>> reportList(SearchCriteria scri);
	public int report_listCount(SearchCriteria scri);
	
	public  ArrayList<HashMap<String, Object>> wd_recordList(SearchCriteria scri);
	public int wd_record_listCount(SearchCriteria scri);
	
	public ArrayList<HashMap<String, Object>> cafe_reviewList(SearchCriteria scri);
	public int cafe_review_listCount(SearchCriteria scri);
	



	
	
	
//	public List<StatisticsVO> list(SearchCriteria scri);

	
	
	// 차트 : 최근 값 7개 출력 
	@Select("select * from (select st_no, st_post_num, st_date, st_comment_num, st_trade_num, st_visitor_num from statistics order by st_no desc)" + 
			"where rownum <= 7")
	public List<StatisticsVO> chartData();
	
	// 차트 : 탈퇴사유
	public ArrayList<HashMap<String, Object>> wdData();

	
	//ajax json tab 
	@Select("select * from report")
	public List<ReportVO> reportTab();
	
	
	// 수정 : 회원정보 수정
	public void updateMember(@Param("memberVO")MemberVO memberVO);
	
	// 회원 탈퇴
	public void outMember(int m_no);
	
	// 무인도 member, board_write, cafe_review, trade 컬럼 변경
	public void updateIsland_member(@Param("bw_no")int bw_no, @Param("r_type")String r_type);
	
	public void updateIsland_memberReport(int m_no);
	public void updateIsland_bw(int bw_no);
	public void updateIsland_cafe(int cr_no);
	public void updateIsland_trade(int t_no);
	
	// 삭제
	public void selectDelete(Board_writeVO boardVO);
	public void selectDelete_cafe(Cafe_reviewVO cafe_reviewVO);
	public void selectDelete_trade(TradeVO tradeVO);
	
	public void selectDelete(int bw_no);
	public void selectDelete_comment(int cm_no);
	
	
	
	
	// 글보기
	public MemberVO selectMemberView(int m_no);

	/* @Select("select * from report where r_no=#{r_no}") */
	public HashMap<String, Object> selectReportView(@Param("r_no") int r_no, @Param("r_type")String r_type);

	

	// 글쓰기 
	public void boardInsert(@Param("board_writeVO") Board_writeVO board_writeVO);
	public void cafeInsert(@Param("cafeVO") CafeVO cafeVO);

	
//	public RankVO selectRankView(int m_no);
	
	
	
	// 방문자수 
	public void setTotalCount(); // session 단위로 현재시간을 date 타입 데이터로 insert 
	public int getTodayCount();	//오늘 방문자수
	public int getTotalCount();	//전체 방문자수
	
	//통계
	public int getTodayBoard();	//오늘 글 개수
	public int getTodayComment();//오늘 댓글개수
	public int getTodayTrade();	//오늘 성사된 중고거래 개수

	public void statisticsInsert(StatisticsVO statVo); //위의 데이터 insert
	
	public int allMember(); //전체 회원수
	public int allComment();//전체 댓글수
	public int allBoard();	//전체 게시글수

}
