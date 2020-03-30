package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.IslandMapper;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.TradeVO;

@Service("IslandService")
public class IslandServiceImpl implements IslandService {

	@Autowired
	private IslandMapper islandMapper;

//	ArrayList<TradeVO> tList;
//	ArrayList<Board_writeVO> bwList;
//	ArrayList<Cafe_reviewVO> crList;

//	// 보부상에서 가져오기
//	@Override
//	public ArrayList<TradeVO> selectTradeIslandList() {
//		return islandMapper.selectTradeIslandList();
//	}
//
//	// 게시글에서 가져오기
//	@Override
//	public ArrayList<Board_writeVO> selectBoard_writeIslandList() {
//		return islandMapper.selectBoard_writeIslandList();
//	}
//
//	// 카페 리뷰에서 가져오기
//	@Override
//	public ArrayList<Cafe_reviewVO> selectCafe_reviewIslandList() {
//		return islandMapper.selectCafe_reviewIslandList();
//	}

	// 무인도리스트 작성일 기준 최신순
	@Override
	public ArrayList<HashMap<String, Object>> selectIslandList() {
		return islandMapper.selectIslandList();
	}

}