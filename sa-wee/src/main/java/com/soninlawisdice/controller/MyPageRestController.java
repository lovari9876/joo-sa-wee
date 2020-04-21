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
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value = "/message", method = { RequestMethod.GET, RequestMethod.POST })
	public ArrayList<HashMap<String, Object>> message(Integer n_no, MemberVO memberVO, Principal principal, Model model)
			throws Exception {
		System.out.println("============================== 쪽지함 화면 ajax start ==============================");

		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);
		System.out.println("m_id" + m_id);

		int m_no = memberVO.getM_no();
		ArrayList<HashMap<String, Object>> list = myPageService.noteView(m_no);
		model.addAttribute("message", list);

		if (n_no != null) {
			System.out.println(n_no);
			model.addAttribute("noteContent", myPageService.noteContent(n_no));
		}
		System.out.println("============================== 쪽지함 화면 ajax end ==============================");

		return myPageService.noteView(m_no);
	}

	@ResponseBody
	@RequestMapping(value = "/select_message", method = { RequestMethod.GET, RequestMethod.POST })
	public HashMap<String, Object> select_message(Integer n_no, MemberVO memberVO, Principal principal, Model model)
			throws Exception {
		System.out.println("============================== 쪽지 선택 ajax start ==============================");

		model.addAttribute("noteContent", myPageService.noteContent(n_no));
		myPageService.newNote(n_no);

		System.out.println("============================== 쪽지 선택 ajax end ==============================");

		return myPageService.noteContent(n_no);
	}

	// 쪽지 내용 삭제
	@ResponseBody
	@RequestMapping(value = "/delete_receive_message", method = RequestMethod.POST)
	public int deleteReceiveMessage(Principal principal, @RequestParam(value = "chbox[]") List<String> chArr)
			throws Exception {
		System.out.println("deleteReceiveMessage()");

		String m_id = principal.getName();
		MemberVO memberVO = myPageService.mypage(m_id);

		int result = 0;
		int n_no = 0;

		for (String i : chArr) {
			n_no = Integer.parseInt(i);
			System.out.println(n_no);
			NoteVO noteVO = myPageService.note(n_no);

			if (memberVO.getM_no() == noteVO.getM_no()) {
				myPageService.deleteReceiveMessage(n_no, noteVO.getN_blind());
			} else if (memberVO.getM_no() != noteVO.getM_no()) {
				myPageService.deleteSendMessage(n_no, noteVO.getN_blind());
			}
			result = 1;
		}
		return result;
	}

}
