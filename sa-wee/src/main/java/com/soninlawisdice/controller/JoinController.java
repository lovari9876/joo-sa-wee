package com.soninlawisdice.controller;


import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soninlawisdice.service.JoinService;
import com.soninlawisdice.vo.MemberVO;

@Controller
public class JoinController {
	
	@Autowired
	private JoinService joinService;

	@RequestMapping(value = "/join_check", method = RequestMethod.GET)
	public String Join() {
		System.out.println("join_check() 성공");
		
		return "join/join";
	}
	
//	@RequestMapping(value = "/join", method = RequestMethod.GET)
//	public void getJoin() {
//		System.out.println("getJoin() 성공");
//		
//	}
	@RequestMapping(value = "/join")
	public String postJoin(MemberVO memberVO) throws Exception {
		System.out.println("postJoin() 성공");
		System.out.println(memberVO.getM_id());
		
		
		joinService.join(memberVO);
		return "join/join_success";
	}
	
	@RequestMapping(value = "/join_success", method = RequestMethod.GET)
	public String join_success() {
		System.out.println("join_success() 성공");

		return "join/join_success";
	}
	
	
	
	
}
