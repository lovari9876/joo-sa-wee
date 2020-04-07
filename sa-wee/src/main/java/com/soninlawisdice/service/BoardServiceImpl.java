package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.BoardMapper;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;

	/////////////// 히트다 히트, 베스트/////////////////////
	@Override
	public ArrayList<HashMap<String, Object>> selectHitList() {
		return boardMapper.selectHitList();
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectBestList() {
		return boardMapper.selectBestList();
	}

	//////////////////////// 커뮤니티////////////////////////

	@Override
	public ArrayList<HashMap<String, Object>> selectBoardList(SearchCriteria scri, int bt_no){
		return boardMapper.selectBoardList(scri, bt_no);
	}
	@Override
	public int cboard_listCount(SearchCriteria scri, int bt_no) {
		return boardMapper.cboard_listCount(scri, bt_no);
	}
	

	@Override
	public void insertBoard(Board_writeVO board_writeVO) {
		boardMapper.insertBoard(board_writeVO);
	}

	// modify_view 에 불러오기
	public Board_writeVO modify_view(int bw_no) {
		return boardMapper.modify_view(bw_no);
	}

	@Override
	public void modify(Board_writeVO board_writeVO) {
		boardMapper.modify(board_writeVO);
	}

	///////////////////// 카페리뷰////////////////////////

	//카페 목록 싹다 보기
	@Override
	public List<CafeVO> selectAllCafeList(){
		return boardMapper.selectAllCafeList();
	}
	
	//카페 지역별로 보기
	@Override
	public List<CafeVO> selectCafeLoc(String c_add){
		return boardMapper.selectCafeLoc(c_add);
	}
	
	// 카페 리뷰 전체 리스트 보기
	@Override
	public ArrayList<HashMap<String, Object>> selectAllReviewList() {
		return boardMapper.selectAllReviewList();
	}

	// 카페 리뷰 리스트에서 review_content_view 로
	public HashMap<String, Object> selectReviewOne(int cr_no) {
		return boardMapper.selectReviewOne(cr_no);
	}

	// 카페별로 밑에 리뷰 리스트 있는거
	@Override
	public ArrayList<HashMap<String, Object>> selectCafeReviewList(int c_no) {
		return boardMapper.selectCafeReviewList(c_no);
	}

	// 카페정보 가져오기
	@Override
	public CafeVO selectCafeInfo(int c_no) {
		return boardMapper.selectCafeInfo(c_no);
	}

	// 카페 리뷰 조회수 올리기
	public void review_uphit(int cr_no) {
		boardMapper.review_uphit(cr_no);
	}

	// 카페 리뷰 추천수 올리기
	@Override
	public void review_recommend(int cr_no) {
		boardMapper.review_recommend(cr_no);
	}

	// 카페 리뷰 추천수 가져오기
	@Override
	public String review_rec(int cr_no) {
		return boardMapper.review_rec(cr_no);
	}

	@Override
	public String get_CafeName(int c_no) {
		return boardMapper.get_CafeName(c_no);
	}

	// 카페 리뷰 작성하기
	@Override
	public void insertReview(Cafe_reviewVO cafe_reviewVO) {
		boardMapper.insertReview(cafe_reviewVO);
	}

	// 리뷰 수정하기
	@Override
	public void review_modify(Cafe_reviewVO cafe_reviewVO) {
		boardMapper.review_modify(cafe_reviewVO);
	}
	
	//리뷰 삭제하기
	@Override
	public void review_delete(int cr_no) {
		boardMapper.review_delete(cr_no);
	}
		

	
	//////////////////////////1 : 1 문의 /////////////////////////////
	@Override
	public ArrayList<HashMap<String, Object>> selectQuestionList(SearchCriteria scri) {
		return boardMapper.selectQuestionList(scri);
	}
	@Override
	public void insertQuestion(Board_writeVO board_writeVO) {
		boardMapper.insertQuestion(board_writeVO);
	}
	@Override
	public HashMap<String, Object> selectQuestionOne(int bw_no) {
		return boardMapper.selectQuestionOne(bw_no);
	}
	@Override
	public void modifyQuestion(Board_writeVO board_writeVO) {
		boardMapper.modifyQuestion(board_writeVO);
	}
	@Override
	public void deleteQuestion(int bw_no) {
		boardMapper.deleteQuestion(bw_no);
	}
	
	@Override
	public String countBoardComment(int bw_no) {
		return boardMapper.countBoardComment(bw_no);
	}
	///////////////////////////////////////////////////////////
	@Override
	public ArrayList<HashMap<String, Object>> selectBoardSub(int s_no) {
		return boardMapper.selectBoardSub(s_no);
	}
	
	////////////////////////포인트 적립//////////////////////
	@Override
	public void boardPointUpdate(int m_no) {
		boardMapper.boardPointUpdate(m_no);	
	}
}
