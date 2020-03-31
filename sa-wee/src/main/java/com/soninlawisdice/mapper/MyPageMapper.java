package com.soninlawisdice.mapper;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.MemberVO;

public interface MyPageMapper {

	// 회원정보
	public MemberVO mypage(@Param("m_id") String m_id) throws Exception;

	// 내 작성글 갯수
	public int myWriteCount(@Param("m_no") int m_no) throws Exception;

	// 내 댓글 갯수
	public int myReplyCount(@Param("m_no") int m_no) throws Exception;
	
	// 회원정보 수정
	public void modifyMember(MemberVO memberVO) throws Exception;

	
	
}
