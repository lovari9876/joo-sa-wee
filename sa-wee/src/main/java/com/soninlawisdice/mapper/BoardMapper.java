package com.soninlawisdice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;

public interface BoardMapper {

	//////////////////핫이슈, 베스트////////////
	//핫이슈
	public List<Board_writeVO> selectHotList();
	
	//베스트
	public List<Board_writeVO> selectBestList();
	
	
	/////////////////////커뮤니티/////////////////////////
	
	//커뮤니티 게시판 아예 전체 보기
	public List<Board_writeVO> selectBoardList();
	
	//보드 이야기 전체보기
	public List<Board_writeVO> selectBoard_Story();
	
	//개봉기 및 리뷰 전체보기
	public List<Board_writeVO> selectBoard_Open();
	
	//보드게임 모임 전체보기
	public List<Board_writeVO> selectBoard_Meet();
	
	//보드 뉴스 전체보기
	public List<Board_writeVO> selectBoard_News();
	
	//질문 과 답변 전체보기
	public List<Board_writeVO> selectBoard_Qna();
	
	//창작 보드게임 전체보기
	public List<Board_writeVO> selectBoard_Creation();
	
	//게시글 작성하기
	public void insertBoard(@Param("board_writeVO") Board_writeVO board_writeVO);
	
	//modify_view 에 불러오기
	public Board_writeVO modify_view(@Param("bw_no")String bw_no);
	
	//글 수정하기
	public void modify(@Param("board_writeVO") Board_writeVO board_writeVO);
	
	
	
	
	/////////////////////카페 리뷰///////////////////////////
	
	//카페 리뷰 전체 리스트 보기
	public List<Cafe_reviewVO> selectAllReviewList();
	
	//카페 리뷰 리스트에서 review_content_view 로
	public Cafe_reviewVO selectReviewOne(@Param("cr_no")String cr_no);
	
	//카페별로 밑에 리뷰 리스트 있는거
	public List<Cafe_reviewVO> selectCafeReviewList(@Param("c_no")String c_no);
	
	//카페정보 가져오기
	public CafeVO selectCafeInfo(@Param("c_no")String c_no);
	
	//카페 리뷰 조회수 올리기
	public void review_uphit(@Param("cr_no")String cr_no);
	
	//카페 리뷰 추천수 올리기
	public void review_recommend(@Param("cr_no")String cr_no);
	
	//올라간 추천수 가져오기
	public String review_rec(@Param("cr_no")String cr_no);
	
	//카페 번호로 카페 이름 가져오기
	public String get_CafeName(@Param("c_no") String c_no);
	
	//리뷰 작성하기
	public void insertReview(@Param("cafe_reviewVO") Cafe_reviewVO cafe_reviewVO);
	
	//리뷰 수정하기
	public void review_modify(@Param("cafe_reivewVO")Cafe_reviewVO cafe_reviewVO);
	
}
