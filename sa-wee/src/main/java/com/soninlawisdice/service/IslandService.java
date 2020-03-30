package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.TradeVO;

public interface IslandService {

//	// 보부상에서 가져오기
//	public ArrayList<TradeVO> selectTradeIslandList();
//
//	// 게시글에서 가져오기
//	public ArrayList<Board_writeVO> selectBoard_writeIslandList();
//
//	// 카페 리뷰에서 가져오기
//	public ArrayList<Cafe_reviewVO> selectCafe_reviewIslandList();

	// 무인도리스트 작성일 기준 최신순
	public ArrayList<HashMap<String, Object>> selectIslandList();

}
