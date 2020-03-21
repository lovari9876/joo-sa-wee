package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.soninlawisdice.vo.*;

public interface IslandMapper {

	
	public ArrayList<TradeVO, Board_writeVO> selectAllEmpList();
	
	public DeptEmpVO selectEmpDeptName(int deptno);
	
	public ArrayList<HashMap<String,Object>> selectAllEmpListHashMap();
	
/*	@Select("select * from users where username = #{username} and password = #{password}")
	public UserVO logInUser(@Param("username") String username,@Param("password") String password);*/
	
}
