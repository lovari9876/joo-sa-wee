package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.NoteVO;
import com.soninlawisdice.vo.WithdrawalVO;

public interface MyPageMapper {

	// 회원정보
	public MemberVO mypage(@Param("m_id") String m_id) throws Exception;

	// 내 작성글 갯수
	public int myWriteCount(@Param("m_no") int m_no) throws Exception;

	// 내 댓글 갯수
	public int myReplyCount(@Param("m_no") int m_no) throws Exception;
	
	// 회원정보 수정
	public void modifyMember(MemberVO memberVO) throws Exception;

	// 탈퇴 정보 테이블
	public ArrayList<WithdrawalVO> withdrawal() throws Exception;
	
	// 탈퇴 사유 기록 
	public void wdInsert(@Param("m_no")int m_no, @Param("w_no")int w_no, @Param("wr_reason")String wr_reason) throws Exception;
	
	// ================================ 쪽지 ================================
	
	// 쪽지 보여주기
	public ArrayList<HashMap<String, Object>> noteView(@Param("m_no") int m_no) throws Exception;

	// 쪽지 내용 보기
	public HashMap<String, Object> noteContent(@Param("n_no") int n_no) throws Exception;

	// 쪽지 보내기
	public void sendMessage(@Param("m_no") int m_no, @Param("noteVO")NoteVO noteVO) throws Exception; 
	
	// 닉네임으로 회원정보 검색
	public MemberVO mypageNick(@Param("m_nick") String m_nick) throws Exception;

	// 받은 쪽지 삭제
	public void deleteReceiveMessage(@Param("n_no") int n_no, @Param("n_blind") int n_blind) throws Exception;
	
	// 보낸 쪽지 삭제
	public void deleteSendMessage(@Param("n_no") int n_no, @Param("n_blind") int n_blind) throws Exception;
	
	// 쪽지 전체 정보 불러오기
	public NoteVO note(@Param("n_no") int n_no) throws Exception;
	
	
}
