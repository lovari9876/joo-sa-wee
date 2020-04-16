package com.soninlawisdice.controller;

import java.security.Principal;
import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.soninlawisdice.service.JoinService;
import com.soninlawisdice.service.MailService;
import com.soninlawisdice.vo.MemberVO;

@Controller
public class JoinController {

	@Autowired
	private JoinService joinService;

	@Autowired
	private MailService mailService;

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
		System.out.println("================================= 아이디 체크 =================================");

		int result = joinService.idCheck(memberVO);
		return result;
	}

	// 닉네임 중복 체크
	@ResponseBody
	@RequestMapping(value = "/nickCheck", method = RequestMethod.POST)
	public int nickCheck(MemberVO memberVO) throws Exception {
		System.out.println("================================= nickCheck 체크 =================================");
		int result = joinService.nickCheck(memberVO);
		return result;
	}

	// 이메일 중복 체크
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public int emailCheck(MemberVO memberVO) throws Exception {
		System.out.println("================================= emailCheck 체크 =================================");
		int result = joinService.emailCheck(memberVO);
		return result;
	}

	// 이메일 인증 확인
	@ResponseBody
	@RequestMapping(value = "/createEmailCheck", method = RequestMethod.GET)
	public boolean createEmailCheck(@RequestParam String userEmail, HttpServletRequest req) {
		// 이메일 인증
		System.out.println("createEmailCheck");

		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession(true);
		String authCode = String.valueOf(ran);
		System.out.println("authCode : " + authCode);

		session.setAttribute("authCode", authCode);
		session.setAttribute("random", ran);
		String subject = "<내 사위는 주사위> 회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");

		System.out.println("sb : " + sb);

		if (userEmail == null) {
			System.out.println("유저이메일 null");
			return false;
		}

		return mailService.send(subject, sb.toString(), "lyeon615@gmail.com", userEmail);
	}

	@ResponseBody
	@RequestMapping(value = "/emailAuth", method = RequestMethod.GET)
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random,
			HttpSession session) {
		
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		System.out.println(originalJoinCode + authCode + " vs " + originalRandom + random);

		if (originalJoinCode.equals(random) && originalRandom.equals(random))
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		else
			return new ResponseEntity<String>("false", HttpStatus.OK);
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

	// ================================= 아이디, 비밀번호 찾기
	// =================================

	@RequestMapping(value = "/forgot_id", method = RequestMethod.GET)
	public String forgot_id(Locale locale, Model model) {

		return "login/forgot_id";
	}

	@RequestMapping(value = "/forgot_pw", method = RequestMethod.GET)
	public String forgot_pw(Locale locale, Model model) {

		return "login/forgot_pw";
	}

	// 접속권한 없을 때 403 에러 페이지 대신
	@RequestMapping(value = "/access_denied_page")
	public String accessDeniedPage() throws Exception {
		return "/share/access_denied_page";
	}

}
