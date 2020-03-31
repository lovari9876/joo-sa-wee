package com.soninlawisdice.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;

public interface BoardService {

	//////////////////핫이슈, 베스트////////////
	//핫이슈
	public List<Board_writeVO> selectHotList();

	//베스트
	public List<Board_writeVO> selectBestList();

	
	
	///////////////////// 커뮤니티/////////////////////////

	// 커뮤니티 게시판 전체보기
	public List<Board_writeVO> selectBoardList();

	// 보드 이야기 전체보기
	public List<Board_writeVO> selectBoard_Story();

	// 개봉기 및 리뷰 전체보기
	public List<Board_writeVO> selectBoard_Open();

	// 보드게임 모임 전체보기
	public List<Board_writeVO> selectBoard_Meet();

	// 보드 뉴스 전체보기
	public List<Board_writeVO> selectBoard_News();

	// 질문 과 답변 전체보기
	public List<Board_writeVO> selectBoard_Qna();

	// 창작 보드게임 전체보기
	public List<Board_writeVO> selectBoard_Creation();

	// 게시글 작성하기
	public void insertBoard(Board_writeVO board_writeVO);

	// 글 수정하기
	public void modify(Board_writeVO board_writeVO);
	
	

	///////////////////// 카페 리뷰///////////////////////////
	
	//카페 리뷰 전체 리스트 보기
	public List<Cafe_reviewVO> selectAllReviewList();
	
	//카페 리뷰 리스트에서 review_content_view 로
	public Cafe_reviewVO selectReviewOne(String cr_no);
	
	//카페별로 밑에 리뷰 리스트 있는거
	public List<Cafe_reviewVO> selectCafeReviewList(String c_no);
		
	//카페정보 가져오기
	public CafeVO selectCafeInfo(String c_no);

	// 카페 리뷰 추천수 올리기
	public void cafe_recommend(String cr_no);

	// 올라간 추천수 가져오기
	public String cafe_rec(String cr_no);

}
