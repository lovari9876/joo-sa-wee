package com.soninlawisdice.controller;

import java.security.Principal;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soninlawisdice.service.AdminService;
import com.soninlawisdice.service.MyPageService;
import com.soninlawisdice.vo.MemberVO;


@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private AdminService adminService;
	
	// 시큐리티 이전 마이페이지
//	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
//	public String mypage(HttpSession session, Model model, MemberVO memberVO) throws Exception {
//		System.out.println("mypage()");
//		
//		memberVO = (MemberVO) session.getAttribute("member");
//		System.out.println(memberVO.getM_id());
//
//		String m_id = memberVO.getM_id();
//		myPageService.mypage(m_id);
//		
//		model.addAttribute("member", memberVO);
//
//		int m_no = memberVO.getM_no();
//		
//		int myWriteCount = myPageService.myWriteCount(m_no);
//		model.addAttribute("myWriteCount", myWriteCount);
//
//		int myReplyCount = myPageService.myReplyCount(m_no);
//		model.addAttribute("myReplyCount", myReplyCount);
//		
//		return "mypage/mypage";
//	}
	// 시큐리티 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Principal principal, Model model, MemberVO memberVO) throws Exception {
		System.out.println("mypage()");
		
		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);
		
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

	// 회원정보 수정뷰
	@RequestMapping(value = "/mypage_modifyview", method = RequestMethod.GET)
	public String mypageModifyView(Principal principal, Model model, MemberVO memberVO) throws Exception{
		System.out.println("mypage_modifyView()");
		
		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);
		
		model.addAttribute("member", memberVO);

		return "mypage/modify_mypage";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/mypage_modify", method = RequestMethod.POST)
	public String modifyMember(Principal principal, MemberVO memberVO) throws Exception{
		System.out.println("mypageModify()");
		
		System.out.println(memberVO.getM_id());
		myPageService.modifyMember(memberVO);
		
		return "redirect:/mypage";
	}
	
	// 회원 탈퇴 : user_view
	@RequestMapping(value = "/out", method = RequestMethod.POST)
	public String out(MemberVO memberVO, Principal principal, HttpSession session) throws Exception {
		System.out.println("out()");

		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);
		adminService.outMember(memberVO.getM_no());
		
		session.invalidate();
		
		return "redirect:/";
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
