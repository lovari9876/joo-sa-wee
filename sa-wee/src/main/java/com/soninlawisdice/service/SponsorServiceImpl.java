package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.SponsorMapper;

@Service("SponsorService")
public class SponsorServiceImpl implements SponsorService {

	@Autowired
	SponsorMapper sponsorMapper;
	
	// 후원 insert
	public void insertSponsor(int sponsor, int amount) {
		System.out.println("sponsor" + sponsor);
		System.out.println("amount" + amount);
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
	
	// 해당 회원 포인트 금액만큼 더하기
	public void updateSponsorPoint(int sp_no) {
		sponsorMapper.updateSponsorPoint(sp_no);
	}
	
}
