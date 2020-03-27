package com.soninlawisdice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soninlawisdice.service.JoinService;
import com.soninlawisdice.vo.MemberVO;

@Controller
public class JoinController {

	@Autowired
	private JoinService joinService;

	// 회원가입
	@RequestMapping(value = "/join_check", method = RequestMethod.GET)
	public String Join() throws Exception {
		System.out.println("join_check() 성공");

		return "join/join";
	}

	@RequestMapping(value = "/join")
	public String postJoin(MemberVO memberVO) throws Exception {
		System.out.println("postJoin() 성공");

		System.out.println(memberVO.getM_id());

		int result = joinService.idCheck(memberVO);
		System.out.println("joinService.idCheck() " + result);

		if (result == 1) {
			return "/join_check";
		} else if (result == 0) {
			joinService.join(memberVO);
			System.out.println("joinService.join() ");

		}
		// 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기
		// 존재하지 않는다면 -> join

		return "redirect:/login_check";

	}

	@RequestMapping(value = "/join_success", method = RequestMethod.GET)
	public String join_success() throws Exception {
		System.out.println("join_success() 성공");

		return "join/join_success";
	}

	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public int passChk(MemberVO memberVO) throws Exception {
		int result = joinService.pwCheck(memberVO);
		return result;
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public int idCheck(MemberVO memberVO) throws Exception {
		System.out.println(memberVO.getM_id());

		int result = joinService.idCheck(memberVO);
		return result;
	}

}
