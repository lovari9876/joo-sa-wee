package com.soninlawisdice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.JoinMapper;
import com.soninlawisdice.mapper.LoginMapper;
import com.soninlawisdice.vo.MemberVO;

@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	JoinMapper joinMapper;

	// 생성자
	public JoinServiceImpl() {
	}

	// 회원가입
	public JoinServiceImpl(JoinMapper joinMapper) {
		super();
		this.joinMapper = joinMapper;
	}

	@Override
	public void join(MemberVO memberVO) throws Exception {
		joinMapper.join(memberVO);
	}

	// 패스워드 체크
	@Override
	public int pwCheck(MemberVO memberVO) throws Exception {
		int result = joinMapper.pwCheck(memberVO);
		return result;
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(MemberVO memberVO) throws Exception {
		int result = joinMapper.idCheck(memberVO);
		return result;
	}
	
}
