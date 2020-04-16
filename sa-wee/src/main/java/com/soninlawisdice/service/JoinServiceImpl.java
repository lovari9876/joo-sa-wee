package com.soninlawisdice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.JoinMapper;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.RankVO;

@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	JoinMapper joinMapper;

	// 생성자
	public JoinServiceImpl() {
	}

	public JoinServiceImpl(JoinMapper joinMapper) {
		super();
		this.joinMapper = joinMapper;
	}

	// 회원가입
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

	// 닉네임 중복체크
	@Override
	public int nickCheck(MemberVO memberVO) throws Exception{
		int result = joinMapper.nickCheck(memberVO);
		return result;
	}

	// 이메일 중복체크
	@Override
	public int emailCheck(MemberVO memberVO) throws Exception {
		int result = joinMapper.emailCheck(memberVO);
		return result;
	}

	// 로그인
	@Override
	public MemberVO login(String m_id, String m_pw) throws Exception {
		return joinMapper.login(m_id, m_pw);
	}

	// 랭크
	@Override
	public RankVO rank() throws Exception {
		return joinMapper.rank();
	}


}
