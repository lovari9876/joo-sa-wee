package com.soninlawisdice.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soninlawisdice.service.LoginService;
import com.soninlawisdice.vo.MemberVO;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/login_check", method = RequestMethod.GET)
	public String login_check(Locale locale, Model model) {
		System.out.println("login_check()");		
		
		
		return "login/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpServletRequest req, RedirectAttributes rttr, MemberVO memberVO) throws Exception {
		System.out.println("POST login()");

		HttpSession session = req.getSession();

		String m_id = req.getParameter("m_id");
		System.out.println(m_id);
		String m_pw = req.getParameter("m_pw");
		System.out.println(m_pw);
		
		MemberVO login = loginService.login(m_id, m_pw);
		System.out.println("loginService()");

		if (login == null) {
			session.setAttribute("member", null);
			// RedirectAttributes 새로고침하면 날라가는 데이터(1회성)
			rttr.addFlashAttribute("msg", false);
			System.out.println("login == null");
		} else {
			session.setAttribute("member", login);
			System.out.println("login 성공");
		}

		return "redirect:/login_check";
	}

	@RequestMapping(value = "/forgot_id", method = RequestMethod.GET)
	public String forgot_id(Locale locale, Model model) {

		return "login/forgot_id";
	}

	@RequestMapping(value = "/forgot_pw", method = RequestMethod.GET)
	public String forgot_pw(Locale locale, Model model) {

		return "login/forgot_pw";
	}
}
