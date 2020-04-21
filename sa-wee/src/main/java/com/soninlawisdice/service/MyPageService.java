package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.NoteVO;
import com.soninlawisdice.vo.WithdrawalVO;

public interface MyPageService {

	// 정보조회
	public MemberVO mypage(String m_id) throws Exception;

	// 내 작성글 갯수
	public int myWriteCount(int m_no) throws Exception;

	// 내 댓글 갯수
	public int myReplyCount(int m_no) throws Exception;

	// 회원정보 수정
	public void modifyMember(MemberVO memberVO) throws Exception;
	
	// 회원비밀번호수정
	public void pwModify(int m_no, String m_pw) throws Exception;
	
	// 탈퇴 정보 테이블
	public ArrayList<WithdrawalVO> withdrawal() throws Exception;
	
	// 탈퇴 사유 기록
	public void wdInsert(int m_no, int w_no, String wr_reason) throws Exception;
	
	// ================================ 쪽지 ================================

	// 쪽지 보여주기
	public ArrayList<HashMap<String, Object>> noteView(int m_no) throws Exception;
	
	// 쪽지 내용 보기
	public HashMap<String, Object> noteContent(int n_no) throws Exception;

	// 쪽지 보내기
	public void  sendMessage(int m_no, NoteVO noteVO) throws Exception; 
		
	// 닉네임으로 회원정보 검색
	public MemberVO mypageNick(String m_nick) throws Exception;

	// 받은 쪽지 삭제
	public void deleteReceiveMessage(int n_no, int n_blind) throws Exception;
		
	// 보낸 쪽지 삭제
	public void deleteSendMessage(int n_no, int n_blind) throws Exception;

	// 쪽지 전체 정보 불러오기
	public NoteVO note(int n_no) throws Exception;
}
