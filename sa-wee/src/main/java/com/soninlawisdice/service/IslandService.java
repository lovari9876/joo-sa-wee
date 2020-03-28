package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.IslandVO;
import com.soninlawisdice.vo.TradeVO;

public interface IslandService {

	// 보부상에서 가져오기
	public ArrayList<TradeVO> selectTradeIslandList();

	// 게시글에서 가져오기
	public ArrayList<Board_writeVO> selectBoard_writeIslandList();

	// 카페 리뷰에서 가져오기
	public ArrayList<Cafe_reviewVO> selectCafe_reviewIslandList();

	// 무인도리스트 최근 글 순으로 정렬하여 합치는 메서드
	public ArrayList<IslandVO> getIslandList();
	
	public ArrayList<HashMap<String,Object>> selectIslandList();

}
