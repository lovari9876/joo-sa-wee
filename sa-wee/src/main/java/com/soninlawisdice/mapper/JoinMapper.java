package com.soninlawisdice.mapper;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.MemberVO;

public interface JoinMapper {

	// 회원가입
 	public void join(MemberVO memberVO) throws Exception;
  	
  	// 패스워드 체크
 	public int pwCheck(MemberVO memberVO) throws Exception;
 	
 	// 아이디 중복체크
 	public int idCheck(MemberVO memberVO) throws Exception;

 	// 닉네임 중복체크
 	public int nickCheck(MemberVO memberVO) throws Exception;
 	
 	// 로그인
  	public MemberVO login(@Param("m_id")String m_id, @Param("m_pw")String m_pw) throws Exception;

}
