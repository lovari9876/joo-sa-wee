package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.NoteVO;

public interface MyPageService {

	// 정보조회
	public MemberVO mypage(String m_id) throws Exception;

	// 내 작성글 갯수
	public int myWriteCount(int m_no) throws Exception;

	// 내 댓글 갯수
	public int myReplyCount(int m_no) throws Exception;

	// 회원정보 수정
	public void modifyMember(MemberVO memberVO) throws Exception;

	// 쪽지 보여주기
	public ArrayList<HashMap<String, Object>> noteView(int m_no) throws Exception;
	
	// 쪽지 내용 보기
	public HashMap<String, Object> noteContent(int n_no) throws Exception;

	// 쪽지 보내기
	public void  sendMessage(int m_no, NoteVO noteVO) throws Exception; 
		
	// 닉네임으로 회원정보 검색
	public MemberVO mypageNick(String m_nick) throws Exception;

}
