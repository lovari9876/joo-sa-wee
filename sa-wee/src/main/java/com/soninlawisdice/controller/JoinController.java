package com.soninlawisdice.controller;

import java.security.Principal;
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

import com.soninlawisdice.service.JoinService;
import com.soninlawisdice.vo.MemberVO;

@Controller
public class JoinController {

	@Autowired
	private JoinService joinService;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	// ================================= 회원가입 =================================

	// 회원가입뷰
	@RequestMapping(value = "/joinview", method = RequestMethod.GET)
	public String Join(MemberVO memberVO) throws Exception {
		System.out.println("join view");

		return "join/join";
	}
	
	// 회원가입
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

		return "redirect:/loginview";

	}
	
	// ================================= 체크 기능 =================================

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
		MemberVO login = joinService.login(memberVO.getM_id(), memberVO.getM_pw());
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

	// ================================= 로그인 =================================

	// 로그인 뷰
	@RequestMapping(value = "/loginview", method = RequestMethod.GET)
	public String login_check(MemberVO memberVO, Model model, Principal principal) throws Exception {
		System.out.println("login view");

		return "login/login";
	}

	// 로그인
//	@RequestMapping(value = "/login", method = RequestMethod.POST)
//	public String login(HttpServletRequest req, RedirectAttributes rttr, MemberVO memberVO) throws Exception {
//		System.out.println("POST login()");
//
//		HttpSession session = req.getSession();
//		String m_id = req.getParameter("m_id");
//		String m_pw = req.getParameter("m_pw");
//		System.out.println("m_id : " + m_id + ", m_pw : " + m_pw);
//
//		MemberVO login = joinService.login(m_id, m_pw);
//		System.out.println("loginService()");
//
//		boolean pwdMatch = pwdEncoder.matches(memberVO.getM_pw(), login.getM_pw());
//
//		if (login != null && pwdMatch == true) {
//			session.setAttribute("member", login);
//			System.out.println("login 성공");
//
//		} else {
//			session.setAttribute("member", null);
//			// RedirectAttributes 새로고침하면 날라가는 데이터(1회성)
//			rttr.addFlashAttribute("msg", false);
//			System.out.println("login == null");
//		}
//
//		return "redirect:/loginview";
//	}

	// 로그아웃
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String logout(HttpSession session) throws Exception {
//		System.out.println("logout()");
//
//		session.invalidate();
//
//		return "login/login";
//	}

	// ================================= 아이디, 비밀번호 찾기 =================================

	@RequestMapping(value = "/forgot_id", method = RequestMethod.GET)
	public String forgot_id(Locale locale, Model model) {

		return "login/forgot_id";
	}

	@RequestMapping(value = "/forgot_pw", method = RequestMethod.GET)
	public String forgot_pw(Locale locale, Model model) {

		return "login/forgot_pw";
	}

	// 접속권한 없을 때 403 에러 페이지 대신
	@RequestMapping(value="/access_denied_page")
    public String accessDeniedPage() throws Exception {
        return "/share/access_denied_page";
    }

}
