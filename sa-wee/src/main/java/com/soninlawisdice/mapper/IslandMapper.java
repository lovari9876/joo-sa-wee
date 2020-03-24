package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.soninlawisdice.vo.*;


// 무인도 게시글 가져오기: 무인도 컬럼은 게시판에 따라 다 다른 이름으로 되어있는데, 1(무인도행), 2(수정함)인 글 다 가져와야함...
// 관리자가 확인완료 버튼 같은 거 눌러야 2-> 0으로 바뀌고 무인도게시판에서 사라진다.

public interface IslandMapper {

	public ArrayList<TradeVO> selectTradeIslandList(); // 보부상
	public ArrayList<Board_writeVO> selectBoard_writeIslandList(); // 게시글
	
	// 카페 리뷰 게시판 하나만 더 추가하면 무인도행 애들은 끝!
	
	
	
// 참고	
//	public DeptEmpVO selectEmpDeptName(int deptno);
//	
//	public ArrayList<HashMap<String,Object>> selectAllEmpListHashMap();
	
	// 로그인 관련
/*	@Select("select * from users where username = #{username} and password = #{password}")
	public UserVO logInUser(@Param("username") String username,@Param("password") String password);*/
	
}
