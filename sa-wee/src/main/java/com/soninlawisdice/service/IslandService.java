package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.List;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.TradeVO;

public interface IslandService {
	
	// 보부상에서 가져오기
	public ArrayList<TradeVO> selectTradeIslandList();

	// 게시글에서 가져오기
	public ArrayList<Board_writeVO> selectBoard_writeIslandList();

	// 무인도리스트 최근 글 순으로 정렬하여 합치는 메서드
	public List<Object> getIslandList();
}
