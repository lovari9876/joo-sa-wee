package com.soninlawisdice.service;

import com.soninlawisdice.vo.MemberVO;

public interface JoinService {
	
	// 회원가입
	public void join(MemberVO memberVO) throws Exception;
	
	// 패스워드 체크
	public int pwCheck(MemberVO memberVO) throws Exception;

	// 아이디 중복체크
	public int idCheck(MemberVO vo) throws Exception;

	// 로그인
	public MemberVO login(String m_id, String m_pw) throws Exception;

}
