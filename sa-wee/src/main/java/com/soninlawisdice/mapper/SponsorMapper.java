package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

public interface SponsorMapper {
	
	// 후원 insert
	public void insertSponsor(@Param("sponsor") int sponsor, @Param("amount") int amount);

	// 방금 생성한 거 가져오기
	public HashMap<String, Object> selectSponsorLatest(@Param("sponsor") int sponsor, @Param("amount") int amount);
	
	// select sponsor list
	public ArrayList<HashMap<String, Object>> selectSponsorList(@Param("m_no") int m_no);

	// 해당 회원 포인트 금액만큼 더하기
	public void updateSponsorPoint(int sp_no);
	
}
