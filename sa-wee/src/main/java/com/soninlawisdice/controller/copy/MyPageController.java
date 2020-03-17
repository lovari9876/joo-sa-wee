package com.son_in_law_is_dice.plz.copy;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MyPageController {
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Locale locale, Model model) {
		
		return "mypage/mypage";
	}
	@RequestMapping(value = "/modify_mypage", method = RequestMethod.GET)
	public String modify_mypage(Locale locale, Model model) {
		
		return "mypage/modify_mypage";
	}
	
	@RequestMapping(value = "/message", method = RequestMethod.GET)
	public String message(Locale locale, Model model) {
		
		return "message/message";
	}
	
	@RequestMapping(value = "/send_message", method = RequestMethod.GET)
	public String send_message(Locale locale, Model model) {
		
		return "message/send_message";
	}
	
}
