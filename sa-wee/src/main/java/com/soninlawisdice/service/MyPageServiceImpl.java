package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.MyPageMapper;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.NoteVO;
import com.soninlawisdice.vo.WithdrawalVO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageMapper myPageMapper;

	// 생성자
	public MyPageServiceImpl() {
	}

	public MyPageServiceImpl(MyPageMapper myPageMapper) {
		super();
		this.myPageMapper = myPageMapper;
	}

	// 정보조회
	@Override
	public MemberVO mypage(String m_id) throws Exception {
		return myPageMapper.mypage(m_id);
	}
	
	// 닉네임으로 회원정보 검색
	@Override
	public MemberVO mypageNick(String m_nick) throws Exception{
		return myPageMapper.mypageNick(m_nick);
	}

	// 회원정보 수정
	@Override
	public void modifyMember(MemberVO memberVO) throws Exception {
		myPageMapper.modifyMember(memberVO);
	}
	
	// 회원비밀번호수정
	@Override
	public void pwModify(int m_no, String m_pw) throws Exception{
		myPageMapper.pwModify(m_no, m_pw);
	}

	// 내 작성글 갯수
	@Override
	public int myWriteCount(int m_no) throws Exception {
		return myPageMapper.myWriteCount(m_no);
	}

	// 내 댓글 갯수
	@Override
	public int myReplyCount(int m_no) throws Exception {
		return myPageMapper.myReplyCount(m_no);
	}
	
	// 안본쪽지 갯수
	@Override
	public int newNoteCount(int m_no) throws Exception{
		return myPageMapper.newNoteCount(m_no);
	}
		
	// 탈퇴 정보 테이블
	@Override
	public ArrayList<WithdrawalVO> withdrawal() throws Exception {
		return myPageMapper.withdrawal();
	}
	
	// 탈퇴 사유 기록
	@Override
	public void wdInsert(int m_no, int w_no, String wr_reason) throws Exception {
		myPageMapper.wdInsert(m_no, w_no, wr_reason);
	}
	
	// ================================= 쪽지 =================================
	
	// 쪽지 보여주기
	@Override
	public ArrayList<HashMap<String, Object>> noteView(int m_no) throws Exception{
		return myPageMapper.noteView(m_no);
	}
	
	// 쪽지 내용 보기
	@Override
	public HashMap<String, Object> noteContent(int n_no) throws Exception{
		return myPageMapper.noteContent(n_no);
	}

	// 쪽지 보내기
	@Override
	public void sendMessage(int m_no, NoteVO noteVO) throws Exception{
		myPageMapper.sendMessage(m_no, noteVO);
	}

	// 받은 쪽지 삭제
	@Override
	public void deleteReceiveMessage(int n_no, int n_blind) throws Exception{
		myPageMapper.deleteReceiveMessage(n_no, n_blind);
	}
			
	// 보낸 쪽지 삭제
	@Override
	public void deleteSendMessage(int n_no, int n_blind) throws Exception{
		myPageMapper.deleteSendMessage(n_no, n_blind);
	}

	// 쪽지 전체 정보 불러오기
	@Override
	public NoteVO note(int n_no) throws Exception{
		return myPageMapper.note(n_no);
	}
	// 쪽지 알림 표시 없애기
	@Override
	public void newNote(@Param("n_no") int n_no) throws Exception{
		myPageMapper.newNote(n_no);
	}
	

		
	
}
