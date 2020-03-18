package com.soninlawisdice.controller;


import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JoinController {
	
	@RequestMapping(value = "/join_test", method = RequestMethod.GET)
	public String join_test() {
		System.out.println("join() 성공");

		return "join/join_test";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		System.out.println("join2() 성공");

		return "join/join";
	}	
	
	@RequestMapping(value = "/join_success", method = RequestMethod.GET)
	public String join_success() {
		System.out.println("join_success() 성공");

		return "join/join_success";
	}
	
	
	
	
}
