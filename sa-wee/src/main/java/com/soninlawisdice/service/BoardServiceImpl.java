package com.soninlawisdice.service;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.soninlawisdice.mapper.BoardMapper;
import com.soninlawisdice.util.FileUtils;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;

	/////////////// 메인/////////////////////
	// 히트다 히트
	@Override
	public ArrayList<HashMap<String, Object>> selectHitList() {
		return boardMapper.selectHitList();
	}

	// 베스트
	@Override
	public ArrayList<HashMap<String, Object>> selectBestList() {
		return boardMapper.selectBestList();
	}

	// 글 많이 쓴 사람
	public ArrayList<HashMap<String, Object>> rankWrite() {
		return boardMapper.rankWrite();
	}

	// 댓글 많이 쓴 사람
	public String rankWriteCo() {
		return boardMapper.rankWriteCo();
	}

	// 신고 많이 당한 사람
	@Override
	public String rankReport() {
		return boardMapper.rankReport();
	}

	//////////////////////// 커뮤니티////////////////////////

	@Override
	public ArrayList<HashMap<String, Object>> selectBoardList(SearchCriteria scri, int bt_no, String s_content) {
		return boardMapper.selectBoardList(scri, bt_no, s_content);
	}

	@Override
	public int cboard_listCount(SearchCriteria scri, int bt_no, String s_content) {
		return boardMapper.cboard_listCount(scri, bt_no, s_content);
	}

	// 게시글 작성.
	@Override
	public void insertBoard(Board_writeVO board_writeVO, String gameNames, int m_no) {

		// 쉼표로 구분하여 받은 gameNames 잘라서 List 에 담기
		StringTokenizer gns = new StringTokenizer(gameNames, ",");

		ArrayList<String> gameName = new ArrayList<String>();

		while (gns.hasMoreTokens()) {
			gameName.add(gns.nextToken().trim());
		}
		boardMapper.insertBoard(board_writeVO, gameName, m_no);
	}

	// content_view 랑 modify_view 에 게임 이름들 가져오기
	@Override
	public ArrayList<HashMap<String, Object>> selectGameNameCom(int bw_no) {
		return boardMapper.selectGameNameCom(bw_no);
	}

	// modify_view 에 불러오기
	public Board_writeVO modify_view(int bw_no) {
		return boardMapper.modify_view(bw_no);
	}

	@Override
	public void modify(Board_writeVO board_writeVO, String gameNames) {

		// 쉼표로 구분하여 받은 gameNames 잘라서 List 에 담기
		StringTokenizer gns = new StringTokenizer(gameNames, ",");

		ArrayList<String> gameName = new ArrayList<String>();

		while (gns.hasMoreTokens()) {
			gameName.add(gns.nextToken().trim());
		}

		boardMapper.modify(board_writeVO, gameName);
	}

	///////////////////// 카페리뷰////////////////////////

	// 카페 목록 싹다 보기
	@Override
	public List<CafeVO> selectAllCafeList(SearchCriteria scri, String add) {
		return boardMapper.selectAllCafeList(scri, add);
	}

	@Override
	public int cafe_listCount(SearchCriteria scri, String add) {
		return boardMapper.cafe_listCount(scri, add);
	}

	// 카페 지역별로 보기
	@Override
	public List<CafeVO> selectCafeLoc(SearchCriteria scri, String c_add) {
		return boardMapper.selectCafeLoc(scri, c_add);
	}

	// 카페 리뷰 전체 리스트 보기
	@Override
	public ArrayList<HashMap<String, Object>> selectAllReviewList(SearchCriteria scri) {
		return boardMapper.selectAllReviewList(scri);
	}

	@Override
	public int allCafeReview_Count(SearchCriteria scri) {
		return boardMapper.allCafeReview_Count(scri);
	}

	// 카페 리뷰 리스트에서 review_content_view 로
	public HashMap<String, Object> selectReviewOne(int cr_no) {
		return boardMapper.selectReviewOne(cr_no);
	}

	// 카페별로 밑에 리뷰 리스트 있는거
	@Override
	public ArrayList<HashMap<String, Object>> selectCafeReviewList(SearchCriteria scri, int c_no) {
		return boardMapper.selectCafeReviewList(scri, c_no);
	}

	@Override
	public int cafeReview_Count(SearchCriteria scri, int c_no) {
		return boardMapper.cafeReview_Count(scri, c_no);
	}

	// 카페 리뷰 댓글 개수
	@Override
	public int countCafeReview(int cr_no) {
		return boardMapper.countCafeReview(cr_no);
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

	// 카페 번호로 카페 이름 가져오기
	@Override
	public String get_CafeName(int c_no) {
		return boardMapper.get_CafeName(c_no);
	}

	// 카페 리뷰 작성하기
	@Override
	public void insertReview(Cafe_reviewVO cafe_reviewVO, String gameNames, int m_no) {

		// 쉼표로 구분하여 받은 gameNames 잘라서 List 에 담기
		StringTokenizer gns = new StringTokenizer(gameNames, ",");

		ArrayList<String> gameName = new ArrayList<String>();

		while (gns.hasMoreTokens()) {
			gameName.add(gns.nextToken().trim());
		}
		boardMapper.insertReview(cafe_reviewVO, gameName, m_no);
	}

	// 리뷰 수정하기
	@Override
	public void review_modify(Cafe_reviewVO cafe_reviewVO, String gameNames) {

		// 쉼표로 구분하여 받은 gameNames 잘라서 List 에 담기
		StringTokenizer gns = new StringTokenizer(gameNames, ",");

		ArrayList<String> gameName = new ArrayList<String>();

		while (gns.hasMoreTokens()) {
			gameName.add(gns.nextToken().trim());
		}

		boardMapper.review_modify(cafe_reviewVO, gameName);
	}

	// 리뷰 삭제하기
	@Override
	public void review_delete(int cr_no) {
		boardMapper.review_delete(cr_no);
	}

	// 게임 이름들 가져오기
	@Override
	public ArrayList<HashMap<String, Object>> selectGameNameCR(int cr_no) {
		return boardMapper.selectGameNameCR(cr_no);
	}

	////////////////////////// 1 : 1 문의 /////////////////////////////
	@Override
	public ArrayList<HashMap<String, Object>> selectQuestionList(SearchCriteria scri) {
		return boardMapper.selectQuestionList(scri);
	}

	@Override
	public void insertQuestion(Board_writeVO board_writeVO, int m_no) {
		boardMapper.insertQuestion(board_writeVO, m_no);
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

	//////////////////////// 포인트 적립//////////////////////
	@Override
	public void boardPointUpdate(int m_no) {
		boardMapper.boardPointUpdate(m_no);
	}

	@Override
	public ArrayList<String> gameNameList() {
		return boardMapper.gameNameList();
	}

	/////////////// 보부상 글작성////////////////

	@Override
	public List<Map<String, Object>> selectFileList(int t_no) throws Exception {
		return boardMapper.selectFileList(t_no);
	}

	@Override
	public String selectFileName(int t_no) throws Exception {
		return boardMapper.selectFileName(t_no);
	}

	/////////////////////////////////////////////

	/*
	 * @Override public void insertGame() {
	 * 
	 * ArrayList<GameVO> gameList = new ArrayList<GameVO>();
	 * 
	 * try { JsonParser jsonParser = new JsonParser(); JsonReader jsonReader = new
	 * JsonReader(new FileReader("C:\\Users\\user\\games.json")); JsonArray
	 * jsonArray = (JsonArray) jsonParser.parse(jsonReader);
	 * 
	 * GameVO gameVO = null;
	 * 
	 * for (Object object : jsonArray) { JsonObject jsonObject = (JsonObject)
	 * object;
	 * 
	 * gameVO = new GameVO();
	 * 
	 * gameVO.setG_name(jsonObject.get("name").getAsString());
	 * gameVO.setG_min(Integer.parseInt(jsonObject.get("minPlayers").getAsString()))
	 * ;
	 * gameVO.setG_max(Integer.parseInt(jsonObject.get("maxPlayers").getAsString()))
	 * ; gameVO.setG_playtime(Integer.parseInt(jsonObject.get("playingTime").
	 * getAsString()));
	 * gameVO.setG_release(Integer.parseInt(jsonObject.get("yearPublished").
	 * getAsString())); gameVO.setG_image(jsonObject.get("image").getAsString());
	 * gameVO.setG_thumbnail(jsonObject.get("thumbnail").getAsString());
	 * 
	 * System.out.println(gameVO.getG_name());
	 * System.out.println(gameVO.getG_min());
	 * System.out.println(gameVO.getG_image());
	 * 
	 * gameList.add(gameVO); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * boardMapper.insertGame(gameList); }
	 */
}
