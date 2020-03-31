package com.soninlawisdice.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.BoardMapper;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;

@Service
public class BoardServiceImpl  implements BoardService{

	
	@Autowired
	BoardMapper boardMapper;
	
	///////////////핫이슈, 베스트/////////////////////
	@Override
	public List<Board_writeVO> selectHotList() {
		return boardMapper.selectHotList();
	}

	@Override
	public List<Board_writeVO> selectBestList() {
		return boardMapper.selectBestList();
	}
	

	
	////////////////////////커뮤니티////////////////////////
	
	@Override
	public List<Board_writeVO> selectBoardList(){
		return boardMapper.selectBoardList();
	}
	
	@Override
	public List<Board_writeVO> selectBoard_Story() {
		// TODO Auto-generated method stub
		return boardMapper.selectBoard_Story();
	}

	@Override
	public List<Board_writeVO> selectBoard_Open() {
		// TODO Auto-generated method stub
		return boardMapper.selectBoard_Open();
	}

	@Override
	public List<Board_writeVO> selectBoard_Meet() {
		// TODO Auto-generated method stub
		return boardMapper.selectBoard_Meet();
	}

	@Override
	public List<Board_writeVO> selectBoard_News() {
		// TODO Auto-generated method stub
		return boardMapper.selectBoard_News();
	}

	@Override
	public List<Board_writeVO> selectBoard_Qna() {
		// TODO Auto-generated method stub
		return boardMapper.selectBoard_Qna();
	}

	@Override
	public List<Board_writeVO> selectBoard_Creation() {
		// TODO Auto-generated method stub
		return boardMapper.selectBoard_Creation();
	}

	
	@Override
	public void insertBoard(Board_writeVO board_writeVO) {
		boardMapper.insertBoard(board_writeVO);
	}

	@Override
	public void modify(Board_writeVO board_writeVO) {
		boardMapper.modify(board_writeVO);
	}

	
	/////////////////////카페리뷰////////////////////////
	
	//카페 리뷰 전체 리스트 보기
	@Override
	public List<Cafe_reviewVO> selectAllReviewList(){
		return boardMapper.selectAllReviewList();
	}
	
	//카페 리뷰 리스트에서 review_content_view 로
	public Cafe_reviewVO selectReviewOne(String cr_no) {
		return boardMapper.selectReviewOne(cr_no);
	}
	
	//카페별로 밑에 리뷰 리스트 있는거
	@Override
	public List<Cafe_reviewVO> selectCafeReviewList(String c_no){
		return boardMapper.selectCafeReviewList(c_no);
	}
			
	//카페정보 가져오기
	@Override
	public CafeVO selectCafeInfo(String c_no) {
		return boardMapper.selectCafeInfo(c_no);
	}
	
	//카페 리뷰 조회수 올리기
	public void review_uphit(String cr_no) {
		boardMapper.review_uphit(cr_no);
	}
		
	//카페 리뷰 추천수 올리기
	@Override
	public void review_recommend(String cr_no) {
		boardMapper.review_recommend(cr_no);
	}

	//카페 리뷰 추천수 가져오기
	@Override
	public String review_rec(String cr_no) {
		return boardMapper.review_rec(cr_no);
	}
	
	@Override
	public String get_CafeName(String c_no) {
		return boardMapper.get_CafeName(c_no);
	}
	
	//카페 리뷰 작성하기
	@Override
	public void insertReview(Cafe_reviewVO cafe_reviewVO) {
		boardMapper.insertReview(cafe_reviewVO);
	}
	
	//리뷰 수정하기
	@Override
	public void review_modify(Cafe_reviewVO cafe_reviewVO) {
		boardMapper.review_modify(cafe_reviewVO);
	}

	
	
	
	
	
	
}
