package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;

public interface BoardService {

	//////////////////메인////////////
	//히트다 히트
	public ArrayList<HashMap<String, Object>> selectHitList();

	//베스트
	public ArrayList<HashMap<String, Object>> selectBestList();

	//글 많이 쓴 사람
	public ArrayList<HashMap<String, Object>> rankWrite();
	
	//댓글 많이 쓴 사람
	public String rankWriteCo();
		
	
	
	///////////////////// 커뮤니티/////////////////////////

	
	
	
	// 커뮤니티 게시판
	public ArrayList<HashMap<String, Object>> selectBoardList(SearchCriteria scri, int bt_no, String s_content);
	public int cboard_listCount(SearchCriteria scri, int bt_no, String s_content);

	// 게시글 작성하기
	public void insertBoard(Board_writeVO board_writeVO, String gameNames, int m_no);
	

	//게임 이름들 가져오기
	public ArrayList<HashMap<String, Object>> selectGameNameCom(int bw_no);
	
	
	//modify_view 에 불러오기
	public Board_writeVO modify_view(int bw_no);

	// 글 수정하기
	public void modify(Board_writeVO board_writeVO, String gameNames);
	

	//게임 이름 수정하기
	//public void modifyGameName(String gameNames, Board_writeVO board_writeVO);

	///////////////////// 카페 리뷰///////////////////////////
	
	//카페 리뷰 전체 리스트 보기
	public ArrayList<HashMap<String, Object>> selectAllReviewList(SearchCriteria scri);
	public int allCafeReview_Count(SearchCriteria scri);
	
	//카페 목록 싹다 보기
	public List<CafeVO> selectAllCafeList(SearchCriteria scri, String add);
	public int cafe_listCount(SearchCriteria scri, String add);
	
	//카페 지역별로 보기
	public List<CafeVO> selectCafeLoc(SearchCriteria scri,String c_add);
	
	//카페 리뷰 리스트에서 review_content_view 로
	//public Cafe_reviewVO selectReviewOne(String cr_no);
	public HashMap<String, Object> selectReviewOne(int cr_no);
	
	//카페별로 밑에 리뷰 리스트 있는거
	public ArrayList<HashMap<String, Object>> selectCafeReviewList(SearchCriteria scri,int c_no);
	public int cafeReview_Count(SearchCriteria scri,@Param("c_no")int c_no);
	
	//카페 리뷰 댓글 개수
	public int countCafeReview(int cr_no);
		
	//카페정보 가져오기
	public CafeVO selectCafeInfo(int c_no);

	//카페 리뷰 조회수 올리기
	public void review_uphit(int cr_no);
	
	// 카페 리뷰 추천수 올리기
	public void review_recommend(int cr_no);

	// 올라간 추천수 가져오기
	public String review_rec(int cr_no);
	
	//카페 번호로 카페 이름 가져오기
	public String get_CafeName(int c_no);
	
	//리뷰 작성하기
	public void insertReview(Cafe_reviewVO cafe_reviewVO, String gameNames, int m_no);
		
	//리뷰 수정하기
	public void review_modify(Cafe_reviewVO cafe_reviewVO, String gameNames);
	
	//리뷰 삭제하기
	public void review_delete(int cr_no);
	
	//게임 이름들 가져오기(modify_view 에)
	public ArrayList<HashMap<String, Object>> selectGameNameCR(int cr_no);
	
	
	//////////////////////////1 : 1 문의 /////////////////////////////
	
	//문의 리스트
	public ArrayList<HashMap<String, Object>> selectQuestionList(SearchCriteria scri);
	//문의 작성
	public void insertQuestion(Board_writeVO board_writeVO, int m_no);	
	//문의 보기//비밀글때문에 따로
	public HashMap<String, Object> selectQuestionOne(int bw_no);
	//문의 수정
	public void modifyQuestion(Board_writeVO board_writeVO);
	//문의 삭제
	public void deleteQuestion(int bw_no);

	
	////////////////////////////일단 댓글////////////////////////////
		
	//댓글 수 조회
	public String countBoardComment(@Param("bw_no")int bw_no);

	////////////////////////////////////////////////////////
	public ArrayList<HashMap<String, Object>> selectBoardSub(int s_no);

	//////////////////////포인트 적립//////////////////////
	//글 작성시 10 포인트
	public void boardPointUpdate(int m_no);

	
	
	
	
	
	public ArrayList<String> gameNameList();
	/////////////////////////////////////////////////
	//public void insertGame();
	/////////////////////////////////////////////	
		
	//첨부파일 조회
	public List<Map<String, Object>> selectFileList (int t_no) throws Exception;
	
	//첨부파일 조회
		public String selectFileName (int t_no) throws Exception;
}
