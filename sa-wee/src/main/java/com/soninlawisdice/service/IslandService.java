package com.soninlawisdice.service;

import java.util.ArrayList;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.TradeVO;

public interface IslandService {
	public ArrayList<TradeVO> selectTradeIslandList();

	// 게시글에서 가져오기
	public ArrayList<Board_writeVO> selectBoard_writeIslandList();

}
