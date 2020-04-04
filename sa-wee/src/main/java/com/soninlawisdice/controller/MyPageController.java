package com.soninlawisdice.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soninlawisdice.service.MyPageService;
import com.soninlawisdice.vo.MemberVO;


@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model, MemberVO memberVO) throws Exception {
		System.out.println("mypage()");
		
		memberVO = (MemberVO) session.getAttribute("member");
		System.out.println(memberVO.getM_id());

		String m_id = memberVO.getM_id();
		myPageService.mypage(m_id);
		
		model.addAttribute("member", memberVO);

		int m_no = memberVO.getM_no();
		
		int myWriteCount = myPageService.myWriteCount(m_no);
		model.addAttribute("myWriteCount", myWriteCount);

		int myReplyCount = myPageService.myReplyCount(m_no);
		model.addAttribute("myReplyCount", myReplyCount);
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "/mypageTest", method = RequestMethod.GET)
	public String mypageTest(HttpSession session, Model model, MemberVO memberVO) throws Exception {
		System.out.println("mypageTest()");
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "/modify_mypage", method = RequestMethod.GET)
	public String modify_mypage(Locale locale, Model model)  throws Exception{
		
		return "mypage/modify_mypage";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/modifyMember", method = RequestMethod.GET)
	public String modifyMember(HttpSession session, MemberVO memberVO) throws Exception{
		System.out.println("modifyMember()");
		
		memberVO = (MemberVO) session.getAttribute("member");

		myPageService.modifyMember(memberVO);
		
		return "redirect:/mypage";
	}
	
	
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(Locale locale, Model model)  throws Exception{
		
		return "message/message";
	}
	
	@RequestMapping(value = "/send_message", method = RequestMethod.GET)
	public String send_message(Locale locale, Model model)  throws Exception{
		
		return "message/send_message";
	}
	
}
