package com.soninlawisdice.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.soninlawisdice.service.MyPageService;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.NoteVO;

@RestController
@RequestMapping("/rest/*")
public class MyPageRestController {

	@Autowired
	private MyPageService myPageService;
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageRestController.class);	
	
	// ================================= 쪽지 데이터 =================================

	@RequestMapping(value = "/message", method = RequestMethod.POST)
	public HashMap<String, Object> message(NoteVO noteVO, MemberVO memberVO, Principal principal, Model model) throws Exception {
		
		int n_no = 20;
		model.addAttribute("noteContent", myPageService.noteContent(n_no));
		
		return myPageService.noteContent(n_no);		

	}

	@RequestMapping(value = "/send_message", method = RequestMethod.GET)
	public String send_message(Locale locale, Model model) throws Exception {

		return "message/send_message";
	}

}
