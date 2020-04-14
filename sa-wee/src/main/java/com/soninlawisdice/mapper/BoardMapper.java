package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.GameVO;
import com.soninlawisdice.vo.SearchCriteria;

public interface BoardMapper {

	//////////////////메인////////////
	//히트다히트
	public ArrayList<HashMap<String, Object>> selectHitList();
	
	//베스트
	public ArrayList<HashMap<String, Object>> selectBestList();
	
	//글 많이 쓴 사람
	public ArrayList<HashMap<String, Object>> rankWrite();
	
	//댓글 많이 쓴 사람
	public String rankWriteCo();
	
	
	/////////////////////커뮤니티/////////////////////////
	
	//커뮤니티 게시판 보기
	public ArrayList<HashMap<String, Object>> selectBoardList(@Param("scri")SearchCriteria scri, @Param("bt_no")int bt_no,  @Param("s_content")String s_content);
	public int cboard_listCount(@Param("scri")SearchCriteria scri, @Param("bt_no") int bt_no, @Param("s_content")String s_content);
	
	//게시글 작성하기
	public void insertBoard(@Param("board_writeVO") Board_writeVO board_writeVO, @Param("gameName") ArrayList<String> gameName, @Param("m_no")int m_no);
	
	
	//게임 이름들 가져오기(커뮤니티 modify_view 에)
	public ArrayList<HashMap<String, Object>> selectGameNameCom(@Param("bw_no") int bw_no);
	
	//modify_view 에 불러오기
	public Board_writeVO modify_view(@Param("bw_no")int bw_no);
	
	//글 수정하기
	public void modify(@Param("board_writeVO") Board_writeVO board_writeVO, @Param("gameName")ArrayList<String> gameName);
	
	
	//게임 이름 수정하기
	//public void modifyGameName(@Param("gameName") ArrayList<String> gameName, @Param("board_writeVO")Board_writeVO board_writeVO);
	
	/////////////////////카페 리뷰///////////////////////////
	
	//카페 목록 싹다 보기
	public List<CafeVO> selectAllCafeList(@Param("scri")SearchCriteria scri);
	public int cafe_listCount(@Param("scri")SearchCriteria scri);
	
	//카페 지역별로 보기
	public List<CafeVO> selectCafeLoc(@Param("scri")SearchCriteria scri,@Param("c_add")String c_add);
	
	//카페 리뷰 전체 리스트 보기
	public ArrayList<HashMap<String, Object>> selectAllReviewList(@Param("scri")SearchCriteria scri);
	public int allCafeReview_Count(@Param("scri")SearchCriteria scri);
	
	//카페 리뷰 리스트에서 review_content_view 로
	public HashMap<String, Object> selectReviewOne(@Param("cr_no")int cr_no);
	
	//카페별로 밑에 리뷰 리스트 있는거
	public ArrayList<HashMap<String, Object>> selectCafeReviewList(@Param("scri")SearchCriteria scri,@Param("c_no")int c_no);
	public int cafeReview_Count(@Param("scri")SearchCriteria scri,@Param("c_no")int c_no);
	
	//카페 리뷰 댓글 개수
	public int countCafeReview(@Param("cr_no") int cr_no);
	
	//카페정보 가져오기
	public CafeVO selectCafeInfo(@Param("c_no")int c_no);
	
	//카페 리뷰 조회수 올리기
	public void review_uphit(@Param("cr_no")int cr_no);
	
	//카페 리뷰 추천수 올리기
	public void review_recommend(@Param("cr_no")int cr_no);
	
	//올라간 추천수 가져오기
	public String review_rec(@Param("cr_no")int cr_no);
	
	//카페 번호로 카페 이름 가져오기
	public String get_CafeName(@Param("c_no") int c_no);
	
	//리뷰 작성하기
	public void insertReview(@Param("cafe_reviewVO") Cafe_reviewVO cafe_reviewVO, @Param("gameName") ArrayList<String> gameName, @Param("m_no") int m_no);
	
	//리뷰 수정하기
	public void review_modify(@Param("cafe_reviewVO") Cafe_reviewVO cafe_reviewVO, @Param("gameName")ArrayList<String> gameName);
	
	//리뷰 삭제하기
	public void review_delete(@Param("cr_no")int cr_no);
	
	//게임 이름들 가져오기(modify_view 에)
	public ArrayList<HashMap<String, Object>> selectGameNameCR(@Param("cr_no") int cr_no);
	

	////////////////////////// 1 : 1 문의 /////////////////////////////
	
	//문의 리스트
	public ArrayList<HashMap<String, Object>> selectQuestionList(@Param("scri")SearchCriteria scri);
	//문의 작성
	public void insertQuestion(@Param("board_writeVO") Board_writeVO board_writeVO, @Param("m_no") int m_no);
	
	//문의 보기//비밀글때문에 따로
	public HashMap<String, Object> selectQuestionOne(@Param("bw_no")int bw_no);
	//문의 수정
	public void modifyQuestion(@Param("board_writeVO") Board_writeVO board_writeVO);
	//문의 삭제
	public void deleteQuestion(@Param("bw_no")int bw_no);
	
	
	//댓글 수 조회
	public String countBoardComment(@Param("bw_no")int bw_no);

	
	//말머리....
	public ArrayList<HashMap<String, Object>> selectBoardSub(@Param("s_no")int s_no);

	///////////////////////////////포인트///////////////////////
	//게시글 작성시 10 포인트
	public void boardPointUpdate(@Param("m_no")int m_no);

	
	
	
	
	
	
	
	/////////////////////////////////////////////////
	public ArrayList<String> gameNameList();
	///////////////////////////////////////////////////////////////////////////////
	//public void insertGame(@Param("gameList") ArrayList<GameVO> gameList);
}
