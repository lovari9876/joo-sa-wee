package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.SponsorMapper;

@Service("SponsorService")
public class SponsorServiceImpl implements SponsorService {

	SponsorMapper sponsorMapper;
	
	// 후원 insert
	public void insertSponsor(int sponsor, int amount) {
		sponsorMapper.insertSponsor(sponsor, amount);
	}

	// 방금 생성한 거 가져오기
	public HashMap<String, Object> selectSponsorLatest(int sponsor, int amount) {
		return sponsorMapper.selectSponsorLatest(sponsor, amount);
	}
	
	// select sponsor list
	public ArrayList<HashMap<String, Object>> selectSponsorList(int sp_no) {
		return sponsorMapper.selectSponsorList(sp_no);
	}
	
}
