package com.soninlawisdice.service;

import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.RankVO;

public interface JoinService {

	// 회원가입
	public void join(MemberVO memberVO) throws Exception;

	// 패스워드 체크
	public int pwCheck(MemberVO memberVO) throws Exception;

	// 아이디 중복체크
	public int idCheck(MemberVO vo) throws Exception;

	// 닉네임 중복체크
	public int nickCheck(MemberVO memberVO) throws Exception;

	// 이메일 중복체크
	public int emailCheck(MemberVO memberVO) throws Exception;
	 	
	// 로그인
	public MemberVO login(String m_id, String m_pw) throws Exception;

	// 랭크
	public RankVO rank() throws Exception;

}
