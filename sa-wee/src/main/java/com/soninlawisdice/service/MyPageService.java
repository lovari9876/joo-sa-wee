package com.soninlawisdice.service;

import com.soninlawisdice.vo.MemberVO;

public interface MyPageService {

	// 정보조회
	public MemberVO mypage(String m_id) throws Exception;

	// 회원정보 수정
	public void modifyMember(MemberVO memberVO) throws Exception;

}
