package com.soninlawisdice.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soninlawisdice.service.JoinService;
import com.soninlawisdice.vo.MemberVO;

@Controller
public class JoinController {

	@Autowired
	private JoinService joinService;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	// 회원가입
	@RequestMapping(value = "/joinView", method = RequestMethod.GET)
	public String Join(MemberVO memberVO) throws Exception {
		System.out.println("join_check() 성공");

		System.out.println(memberVO.getM_id());

		return "join/join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String postJoin(MemberVO memberVO) throws Exception {
		System.out.println("postJoin() 성공");

		System.out.println(memberVO.getM_id());

		int result = joinService.idCheck(memberVO);
		System.out.println("joinService.idCheck() " + result);

		if (result == 1) {
			return "/join_check";
		} else if (result == 0) {
			String inputPass = memberVO.getM_pw();
			String pwd = pwdEncoder.encode(inputPass);
			memberVO.setM_pw(pwd);

			joinService.join(memberVO);
			System.out.println("joinService.join() ");

		}
		// 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
		// 존재하지 않는다면 -> join

		return "redirect:/loginView";

	}

	@RequestMapping(value = "/join_success", method = RequestMethod.GET)
	public String join_success() throws Exception {
		System.out.println("join_success() 성공");

		return "join/join_success";
	}

	// 패스워드 체크
//	@ResponseBody
//	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
//	public int passChk(MemberVO memberVO) throws Exception {
//		int result = joinService.pwCheck(memberVO);
//		MemberVO login =  joinService.login(memberVO.getM_id(), memberVO.getM_pw());
//		boolean pwdMatch = pwdEncoder.matches(memberVO.getM_pw(), login.getM_pw());
//
//		return result;
//	}
	
	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public boolean passChk(MemberVO memberVO) throws Exception {
		MemberVO login =  joinService.login(memberVO.getM_id(), memberVO.getM_pw());
		boolean pwdMatch = pwdEncoder.matches(memberVO.getM_pw(), login.getM_pw());

		return pwdMatch;
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(MemberVO memberVO) throws Exception {
		System.out.println(memberVO.getM_id());

		int result = joinService.idCheck(memberVO);
		return result;
	}

	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public int nickCheck(MemberVO memberVO) throws Exception {
		System.out.println(memberVO.getM_id());

		int result = joinService.nickCheck(memberVO);
		return result;
	}

	@RequestMapping(value = "/loginView", method = RequestMethod.GET)
	public String login_check(MemberVO memberVO, Model model) throws Exception {
		System.out.println("login_check()");

		System.out.println(memberVO.getM_id());

		return "login/login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest req, RedirectAttributes rttr, MemberVO memberVO) throws Exception {
		System.out.println("POST login()");

		HttpSession session = req.getSession();
		String m_id = req.getParameter("m_id");
		String m_pw = req.getParameter("m_pw");
		System.out.println("m_id : " + m_id + ", m_pw : " + m_pw);

		MemberVO login = joinService.login(m_id, m_pw);
		System.out.println("loginService()");

		boolean pwdMatch = pwdEncoder.matches(memberVO.getM_pw(), login.getM_pw());

		if (login != null && pwdMatch == true) {
			session.setAttribute("member", login);
			System.out.println("login 성공");

		} else {
			session.setAttribute("member", null);
			// RedirectAttributes 새로고침하면 날라가는 데이터(1회성)
			rttr.addFlashAttribute("msg", false);
			System.out.println("login == null");
		}

		return "redirect:/loginView";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		System.out.println("logout()");

		session.invalidate();

		return "login/login";
	}

	@RequestMapping(value = "/forgot_id", method = RequestMethod.GET)
	public String forgot_id(Locale locale, Model model) {

		return "login/forgot_id";
	}

	@RequestMapping(value = "/forgot_pw", method = RequestMethod.GET)
	public String forgot_pw(Locale locale, Model model) {

		return "login/forgot_pw";
	}

	// 테스트
	@RequestMapping(value = "/address", method = RequestMethod.GET)
	public String address(Locale locale, Model model) {

		return "join/address";
	}
}
