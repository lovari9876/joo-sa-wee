package com.soninlawisdice.service;

import com.soninlawisdice.vo.MemberVO;

public interface LoginService {
	
	public MemberVO login(String m_id, String m_pw) throws Exception;
}
