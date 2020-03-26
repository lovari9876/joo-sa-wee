package com.soninlawisdice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.JoinMapper;
import com.soninlawisdice.mapper.LoginMapper;
import com.soninlawisdice.vo.MemberVO;

@Service
public class JoinServiceImpl implements JoinService{

	@Autowired	
	JoinMapper joinMapper;
	
	// 생성자
	public JoinServiceImpl() {}

	public JoinServiceImpl(JoinMapper joinMapper) {
		super();
		this.joinMapper = joinMapper;
	}

	@Override
	public void join(MemberVO memberVO) throws Exception{
		joinMapper.join(memberVO);
	}

}
