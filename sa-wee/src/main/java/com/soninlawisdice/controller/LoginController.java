package com.soninlawisdice.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
	
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
}
