package com.soninlawisdice.mapper;

import com.soninlawisdice.vo.MemberVO;

public interface JoinMapper {

	// 회원가입
 	public void join(MemberVO memberVO) throws Exception;
  	
  	// 패스워드 체크
 	public int pwCheck(MemberVO memberVO) throws Exception;
 	
 	// 아이디 중복체크
 	public int idCheck(MemberVO vo) throws Exception;


}
