package com.soninlawisdice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.soninlawisdice.mapper.BoardMapper;
import com.soninlawisdice.vo.Board_writeVO;

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
	
	@Override
	public void cafe_recommend(String cr_no) {
		boardMapper.cafe_recommend(cr_no);
	}

	@Override
	public String cafe_rec(String cr_no) {
		return boardMapper.cafe_rec(cr_no);
	}

	
	
	
	
	
	
}
