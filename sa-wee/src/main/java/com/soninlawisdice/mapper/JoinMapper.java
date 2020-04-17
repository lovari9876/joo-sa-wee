package com.soninlawisdice.mapper;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.RankVO;

public interface JoinMapper {

	// 회원가입
 	public void join(MemberVO memberVO) throws Exception;
  	
  	// 패스워드 체크
 	public int pwCheck(MemberVO memberVO) throws Exception;
 	
 	// 아이디 중복체크
 	public int idCheck(MemberVO memberVO) throws Exception;
 	public int idCheck(String m_id) throws Exception;

 	// 닉네임 중복체크
 	public int nickCheck(MemberVO memberVO) throws Exception;
 	
 	// 이메일 중복체크
 	public int emailCheck(MemberVO memberVO) throws Exception;
 	
 	// 핸드폰 중복체크
  	public int phoneCheck(MemberVO memberVO) throws Exception;
  	
 	// 로그인
  	public MemberVO login(@Param("m_id")String m_id, @Param("m_pw")String m_pw) throws Exception;

  	// 랭크
  	public RankVO rank() throws Exception;
  	
  	// 아이디 찾기
  	public String findId(@Param("m_email")String m_email, @Param("m_name")String m_name) throws Exception;

	// 임시비밀번호 발급 패스워드 변경
  	public void updatePW(@Param("m_pw")String m_pw, @Param("m_id")String m_id)throws Exception;
}

