package com.soninlawisdice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.LoginMapper;
import com.soninlawisdice.vo.MemberVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired	
	LoginMapper loginMapper;

	@Override
	public MemberVO login(String m_id, String m_pw) throws Exception{
		return loginMapper.login(m_id, m_pw);
	}

}
