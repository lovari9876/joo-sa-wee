package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.MyPageMapper;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.NoteVO;

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

	// 회원정보 수정
	@Override
	public void modifyMember(MemberVO memberVO) throws Exception {
		myPageMapper.modifyMember(memberVO);
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
	
	// 쪽지 보여주기
	@Override
	public ArrayList<HashMap<String, Object>> noteView(int m_no) throws Exception{
		return myPageMapper.noteView(m_no);
	}
	
	// 쪽지 내용 보기
	public HashMap<String, Object> noteContent(@Param("n_no") int n_no) throws Exception{
		return myPageMapper.noteContent(n_no);
	}

}
