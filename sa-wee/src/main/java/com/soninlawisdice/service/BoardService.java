package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.SearchCriteria;

public interface BoardService {

	//////////////////핫이슈, 베스트////////////
	//핫이슈
	public ArrayList<HashMap<String, Object>> selectHotList();

	//베스트
	public ArrayList<HashMap<String, Object>> selectBestList();

	
	
	///////////////////// 커뮤니티/////////////////////////

	
	
	
	// 커뮤니티 게시판 전체보기
	public ArrayList<HashMap<String, Object>> selectBoardList();

	// 보드 이야기 전체보기
	public ArrayList<HashMap<String, Object>> selectBoard_Story(SearchCriteria scri);
	public int b_storyCount(SearchCriteria scri);

	// 개봉기 및 리뷰 전체보기
	public ArrayList<HashMap<String, Object>> selectBoard_Open(SearchCriteria scri);
	public int b_openCount(SearchCriteria scri);
	
	// 보드게임 모임 전체보기
	public ArrayList<HashMap<String, Object>> selectBoard_Meet(SearchCriteria scri);
	public int b_meetCount(SearchCriteria scri);
	
	// 보드 뉴스 전체보기
	public ArrayList<HashMap<String, Object>> selectBoard_News(SearchCriteria scri);
	public int b_newsCount(SearchCriteria scri);
	
	// 질문 과 답변 전체보기
	public ArrayList<HashMap<String, Object>> selectBoard_Qna(SearchCriteria scri);
	public int b_qnaCount(SearchCriteria scri);
	
	// 창작 보드게임 전체보기
	public ArrayList<HashMap<String, Object>> selectBoard_Creation(SearchCriteria scri);
	public int b_creationCount(SearchCriteria scri);
	
	// 게시글 작성하기
	public void insertBoard(Board_writeVO board_writeVO);
	
	//modify_view 에 불러오기
	public Board_writeVO modify_view(String bw_no);

	// 글 수정하기
	public void modify(Board_writeVO board_writeVO);
	
	

	///////////////////// 카페 리뷰///////////////////////////
	
	//카페 리뷰 전체 리스트 보기
	public ArrayList<HashMap<String, Object>> selectAllReviewList();
	
	//카페 목록 싹다 보기
	public List<CafeVO> selectAllCafeList();
		
	
	//카페 지역별로 보기
	public List<CafeVO> selectCafeLoc(String c_add);
	
	//카페 리뷰 리스트에서 review_content_view 로
	//public Cafe_reviewVO selectReviewOne(String cr_no);
	public HashMap<String, Object> selectReviewOne(String cr_no);
	
	//카페별로 밑에 리뷰 리스트 있는거
	public ArrayList<HashMap<String, Object>> selectCafeReviewList(String c_no);
		
	//카페정보 가져오기
	public CafeVO selectCafeInfo(String c_no);

	//카페 리뷰 조회수 올리기
	public void review_uphit(String cr_no);
	
	// 카페 리뷰 추천수 올리기
	public void review_recommend(String cr_no);

	// 올라간 추천수 가져오기
	public String review_rec(String cr_no);
	
	//카페 번호로 카페 이름 가져오기
	public String get_CafeName(String c_no);
	
	//리뷰 작성하기
	public void insertReview(Cafe_reviewVO cafe_reviewVO);
		
	//리뷰 수정하기
	public void review_modify(Cafe_reviewVO cafe_reviewVO);
	
	
	//////////////////////////1 : 1 문의 /////////////////////////////
	public void insertQuestion(Board_writeVO board_writeVO);
		

}
