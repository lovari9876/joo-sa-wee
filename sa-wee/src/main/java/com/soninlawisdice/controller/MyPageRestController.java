package com.soninlawisdice.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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

	@ResponseBody
	@RequestMapping(value = "/message", method = {RequestMethod.GET,RequestMethod.POST})
	public ArrayList<HashMap<String, Object>> message(Integer n_no, MemberVO memberVO, Principal principal, Model model) throws Exception {
		System.out.println("message");
		
		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);
		System.out.println("m_id"+m_id);
		
		int m_no = memberVO.getM_no();
		ArrayList<HashMap<String, Object>> list = myPageService.noteView(m_no);
		model.addAttribute("message", list);
		
		if(n_no != null) {
			System.out.println(n_no);
			model.addAttribute("noteContent", myPageService.noteContent(n_no));
		}
		
		return myPageService.noteView(m_no);
	}
	
	
//	@RequestMapping(value = "/delete_send_message", method = RequestMethod.GET)
//	public String delete_send_message(String m_nick, NoteVO noteVO) throws Exception {
//		System.out.println("send_message()");
//		
//		System.out.println(m_nick);
//		MemberVO memberVO = myPageService.mypageNick(m_nick);
//		int m_no = memberVO.getM_no();
//		
//		System.out.println(noteVO.getM_no2());
//		
//		myPageService.sendMessage(m_no, noteVO);
//		
//		return "message/send_message";
//	}
//	@RequestMapping(value = "/delete_receive_message", method = RequestMethod.GET)
//	public String delete_receive_message(String m_nick, NoteVO noteVO) throws Exception {
//		System.out.println("send_message()");
//		
//		System.out.println(m_nick);
//		MemberVO memberVO = myPageService.mypageNick(m_nick);
//		int m_no = memberVO.getM_no();
//		
//		System.out.println(noteVO.getM_no2());
//		
//		myPageService.sendMessage(m_no, noteVO);
//		
//		return "message/send_message";
//	}

}
