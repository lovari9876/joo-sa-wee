package com.soninlawisdice.service;

import com.soninlawisdice.vo.MemberVO;

public interface MyPageService {

	// 정보조회
	public MemberVO mypage(String m_id) throws Exception;

	// 내 작성글 갯수
	public int myWriteCount(int m_no) throws Exception;

	// 내 댓글 갯수
	public int myReplyCount(int m_no) throws Exception;

	// 회원정보 수정
	public void modifyMember(MemberVO memberVO) throws Exception;

}
