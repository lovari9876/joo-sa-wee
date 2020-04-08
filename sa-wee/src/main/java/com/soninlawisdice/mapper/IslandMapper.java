package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.SearchCriteria;

// 무인도 게시글 가져오기: 무인도 컬럼은 게시판에 따라 다 다른 이름으로 되어있는데, 1(무인도행), 2(수정함)인 글 다 가져와야함...
// 관리자가 확인완료 버튼 같은 거 눌러야 2-> 0으로 바뀌고 무인도게시판에서 사라진다.

public interface IslandMapper {

//	public ArrayList<TradeVO> selectTradeIslandList(); // 보부상
//	public ArrayList<Board_writeVO> selectBoard_writeIslandList(); // 게시글
//	public ArrayList<Cafe_reviewVO> selectCafe_reviewIslandList(); // 카페리뷰
	
	public ArrayList<HashMap<String,Object>> selectIslandList(@Param("scri") SearchCriteria scri, 
			@Param("bt_no") int bt_no);	
	public int islandListCount(@Param("scri") SearchCriteria scri, @Param("bt_no") int bt_no);
	
// 참고	
//	public DeptEmpVO selectEmpDeptName(int deptno);
//	
//	public ArrayList<HashMap<String,Object>> selectAllEmpListHashMap();
	
}
