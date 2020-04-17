package com.soninlawisdice.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.JoinMapper;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.RankVO;

@Service
public class JoinServiceImpl implements JoinService {

	@Autowired
	JoinMapper joinMapper;

	// 생성자
	public JoinServiceImpl() {
	}

	public JoinServiceImpl(JoinMapper joinMapper) {
		super();
		this.joinMapper = joinMapper;
	}

	// 회원가입
	@Override
	public void join(MemberVO memberVO) throws Exception {
		joinMapper.join(memberVO);
	}

	// 패스워드 체크
	@Override
	public int pwCheck(MemberVO memberVO) throws Exception {
		int result = joinMapper.pwCheck(memberVO);
		return result;
	}

	// 아이디 중복 체크
	@Override
	public int idCheck(MemberVO memberVO) throws Exception {
		int result = joinMapper.idCheck(memberVO);
		return result;
	}
	@Override
	public int idCheck(String m_id) throws Exception {
		int result = joinMapper.idCheck(m_id);
		return result;
	}
	
	// 닉네임 중복체크
	@Override
	public int nickCheck(MemberVO memberVO) throws Exception{
		int result = joinMapper.nickCheck(memberVO);
		return result;
	}

	// 이메일 중복체크
	@Override
	public int emailCheck(MemberVO memberVO) throws Exception {
		int result = joinMapper.emailCheck(memberVO);
		return result;
	}
	
	// 핸드폰 중복체크
	@Override
  	public int phoneCheck(MemberVO memberVO) throws Exception{
		int result = joinMapper.phoneCheck(memberVO);
		return result;
	}
	
	// 로그인
	@Override
	public MemberVO login(String m_id, String m_pw) throws Exception {
		return joinMapper.login(m_id, m_pw);
	}

	// 랭크
	@Override
	public RankVO rank() throws Exception {
		return joinMapper.rank();
	}

	// 아이디 찾기
	@Override
  	public String findId(String m_email, String m_name) throws Exception{
		String id = joinMapper.findId(m_email, m_name);
		
		return id;
	}
	
	// 임시비밀번호 발급
	@Override
	public void updatePW(String m_pw, String m_id) throws Exception {
		joinMapper.updatePW(m_pw, m_id);	
	}

	

	
}
