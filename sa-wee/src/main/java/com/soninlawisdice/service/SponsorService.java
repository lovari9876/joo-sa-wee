package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;


public interface SponsorService {

	// 후원 insert
	public void insertSponsor(int sponsor, int amount);

	// 방금 생성한 거 가져오기
	public HashMap<String, Object> selectSponsorLatest(int sponsor, int amount);
	
	// select sponsor list
	public ArrayList<HashMap<String, Object>> selectSponsorList(int sp_no);

}
