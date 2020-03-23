package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.IslandMapper;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.TradeVO;

@Service
public class IslandService {

	@Inject
	IslandMapper islandMapper;

	// 보부상에서 가져오기
	public ArrayList<TradeVO> selectTradeIslandList() {
		return islandMapper.selectTradeIslandList();
	}

	// 게시글에서 가져오기
	public ArrayList<Board_writeVO> selectBoard_writeIslandList() {
		return islandMapper.selectBoard_writeIslandList();
	}

	
	
// 참고	

//	@Inject
//	EmpMapper empMapper;
//	
//	public ArrayList<EmpVO> selectAllEmpList() {
//			return empMapper.selectAllEmpList() ;
//   }
//		
//   public DeptEmpVO selectEmpDeptName(int deptno) {
//		return empMapper.selectEmpDeptName(deptno) ;
//   }
//   
//	public ArrayList<HashMap<String,Object>> selectAllEmpListHashMap() {
//		return empMapper.selectAllEmpListHashMap() ;
//}

}