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

	/////////////// 핫이슈, 베스트/////////////////////
	@Override
	public ArrayList<HashMap<String, Object>> selectHotList() {
		return boardMapper.selectHotList();
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectBestList() {
		return boardMapper.selectBestList();
	}

	//////////////////////// 커뮤니티////////////////////////

	@Override
	public  ArrayList<HashMap<String, Object>> selectBoardList() {
		return boardMapper.selectBoardList();
	}
	


	@Override
	public ArrayList<HashMap<String, Object>> selectBoard_Story(SearchCriteria scri) {
		return boardMapper.selectBoard_Story(scri);
	}
	@Override
	public int b_storyCount(SearchCriteria scri) {
		return boardMapper.b_storyCount(scri);
	}

	
	@Override
	public ArrayList<HashMap<String, Object>> selectBoard_Open(SearchCriteria scri) {
		return boardMapper.selectBoard_Open(scri);
	}
	@Override
	public int b_openCount(SearchCriteria scri) {
		return boardMapper.b_openCount(scri);
	}
	

	@Override
	public ArrayList<HashMap<String, Object>> selectBoard_Meet(SearchCriteria scri) {
		return boardMapper.selectBoard_Meet(scri);
	}
	@Override
	public int b_meetCount(SearchCriteria scri) {
		return boardMapper.b_meetCount(scri);
	}

	
	@Override
	public ArrayList<HashMap<String, Object>> selectBoard_News(SearchCriteria scri) {
		return boardMapper.selectBoard_News(scri);
	}
	@Override
	public int b_newsCount(SearchCriteria scri) {
		return boardMapper.b_newsCount(scri);
	}

	
	@Override
	public ArrayList<HashMap<String, Object>> selectBoard_Qna(SearchCriteria scri) {
		return boardMapper.selectBoard_Qna(scri);
	}
	@Override
	public int b_qnaCount(SearchCriteria scri) {
		return boardMapper.b_qnaCount(scri);
	}

	
	@Override
	public ArrayList<HashMap<String, Object>> selectBoard_Creation(SearchCriteria scri) {
		return boardMapper.selectBoard_Creation();
	}
	@Override
	public int b_creationCount(SearchCriteria scri) {
		return boardMapper.b_creationCount(scri);
	}
	

	@Override
	public void insertBoard(Board_writeVO board_writeVO) {
		boardMapper.insertBoard(board_writeVO);
	}

	// modify_view 에 불러오기
	public Board_writeVO modify_view(String bw_no) {
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
	public HashMap<String, Object> selectReviewOne(String cr_no) {
		return boardMapper.selectReviewOne(cr_no);
	}

	// 카페별로 밑에 리뷰 리스트 있는거
	@Override
	public ArrayList<HashMap<String, Object>> selectCafeReviewList(String c_no) {
		return boardMapper.selectCafeReviewList(c_no);
	}

	// 카페정보 가져오기
	@Override
	public CafeVO selectCafeInfo(String c_no) {
		return boardMapper.selectCafeInfo(c_no);
	}

	// 카페 리뷰 조회수 올리기
	public void review_uphit(String cr_no) {
		boardMapper.review_uphit(cr_no);
	}

	// 카페 리뷰 추천수 올리기
	@Override
	public void review_recommend(String cr_no) {
		boardMapper.review_recommend(cr_no);
	}

	// 카페 리뷰 추천수 가져오기
	@Override
	public String review_rec(String cr_no) {
		return boardMapper.review_rec(cr_no);
	}

	@Override
	public String get_CafeName(String c_no) {
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

}
