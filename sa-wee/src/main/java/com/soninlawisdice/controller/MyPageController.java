package com.soninlawisdice.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soninlawisdice.service.AdminService;
import com.soninlawisdice.service.MyPageService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.PaymentVO;
import com.soninlawisdice.vo.NoteVO;

@Controller
public class MyPageController {

	@Autowired
	private MyPageService myPageService;

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SecondhandService secondhandService;
	

	// 시큐리티 이전 마이페이지
//	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
//	public String mypage(HttpSession session, Model model, MemberVO memberVO) throws Exception {
//		System.out.println("mypage()");
//		
//		memberVO = (MemberVO) session.getAttribute("member");
//		System.out.println(memberVO.getM_id());
//
//		String m_id = memberVO.getM_id();
//		myPageService.mypage(m_id);
//		
//		model.addAttribute("member", memberVO);
//
//		int m_no = memberVO.getM_no();
//		
//		int myWriteCount = myPageService.myWriteCount(m_no);
//		model.addAttribute("myWriteCount", myWriteCount);
//
//		int myReplyCount = myPageService.myReplyCount(m_no);
//		model.addAttribute("myReplyCount", myReplyCount);
//		
//		return "mypage/mypage";
//	}
	// 시큐리티 마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage(Principal principal, Model model, MemberVO memberVO) throws Exception {
		System.out.println("mypage()");

		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);

		model.addAttribute("member", memberVO);

		int m_no = memberVO.getM_no();

		int myWriteCount = myPageService.myWriteCount(m_no);
		model.addAttribute("myWriteCount", myWriteCount);

		int myReplyCount = myPageService.myReplyCount(m_no);
		model.addAttribute("myReplyCount", myReplyCount);
			
		
		///////////// 내 판매 /////////////////////////////////
		String who = "seller"; // xml에서 판매자, 구매자 식별 위한 값
		ArrayList<HashMap<String, Object>> sPayList = 
				secondhandService.selectPaymentList(m_no, who);
		model.addAttribute("sPayList", sPayList);

		// 판매자 가격확정 모달: price_modal_view
		// 버튼 클릭시 P_NO 받아와
		
		
		///////////// 내 구매 /////////////////////////////////
		who = "buyer"; // xml에서 판매자, 구매자 식별 위한 값
		ArrayList<HashMap<String, Object>> bPayList = 
				secondhandService.selectPaymentList(m_no, who);
		model.addAttribute("bPayList", bPayList);
		
		return "mypage/mypage";
	}

	@RequestMapping(value = "/mypageTest", method = RequestMethod.GET)
	public String mypageTest(HttpSession session, Model model, MemberVO memberVO) throws Exception {
		System.out.println("mypageTest()");

		return "mypage/mypage";
	}

	// 회원정보 수정뷰
	@RequestMapping(value = "/mypage_modifyview", method = RequestMethod.GET)
	public String mypageModifyView(Principal principal, Model model, MemberVO memberVO) throws Exception {
		System.out.println("mypage_modifyView()");

		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);

		model.addAttribute("member", memberVO);

		return "mypage/modify_mypage";
	}

	// 회원정보 수정
	@RequestMapping(value = "/mypage_modify", method = RequestMethod.POST)
	public String modifyMember(Principal principal, MemberVO memberVO) throws Exception {
		System.out.println("mypageModify()");

		System.out.println(memberVO.getM_id());
		myPageService.modifyMember(memberVO);

		return "redirect:/mypage";
	}

	// 회원 탈퇴
	@RequestMapping(value = "/out", method = RequestMethod.POST)
	public String out(MemberVO memberVO, Principal principal, HttpSession session) throws Exception {
		System.out.println("out()");

		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);
		adminService.outMember(memberVO.getM_no());

		session.invalidate();

		return "redirect:/";
	}
	// ================================= 쪽지 =================================

	// 쪽지함
	@RequestMapping(value = "/message", method = { RequestMethod.GET, RequestMethod.POST })
	public String message(NoteVO noteVO, MemberVO memberVO, Principal principal, Model model) throws Exception {
		System.out.println("============================== 쪽지함 화면 start ==============================");
		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);

		model.addAttribute("member", myPageService.mypage(m_id));

		int m_no = memberVO.getM_no();
		model.addAttribute("message", myPageService.noteView(m_no));
		System.out.println("============================== 쪽지함 화면 end ==============================");
		
		return "message/message";
	}

	// 쪽지 내용 선택하기
	@ResponseBody
	@RequestMapping(value = "/select_message", method = { RequestMethod.GET, RequestMethod.POST })
	public HashMap<String, Object> select_message(int n_no, Principal principal, Model model) throws Exception {
		System.out.println("select_message" + n_no);

		model.addAttribute("noteContent", myPageService.noteContent(n_no));

		return myPageService.noteContent(n_no);
	}

	// 쪽지 내용 삭제
	@ResponseBody
	@RequestMapping(value = "/delete_receive_message", method = RequestMethod.POST)
	public int deleteReceiveMessage(Principal principal, @RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		System.out.println("deleteReceiveMessage()");

		String m_id = principal.getName();
		MemberVO memberVO = myPageService.mypage(m_id);
		
		int result = 0;
		int n_no = 0;
		
		for (String i : chArr) {
			n_no = Integer.parseInt(i);
			System.out.println(n_no);
			NoteVO noteVO = myPageService.note(n_no);
			
			if(memberVO.getM_no() == noteVO.getM_no()) {
				myPageService.deleteReceiveMessage(n_no, noteVO.getN_blind());
			}else if(memberVO.getM_no() != noteVO.getM_no() ) {
				myPageService.deleteSendMessage(n_no, noteVO.getN_blind());
			}
			result = 1;
		}
		return result;
	}

	// 쪽지 보내기 뷰
	@RequestMapping(value = "/send_messageview", method = RequestMethod.GET)
	public String send_messageview(Principal principal, MemberVO memberVO, Model model) throws Exception {
		System.out.println("send_messageview()" + memberVO.getM_no());
		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);

		model.addAttribute("member", memberVO);

		return "message/send_message";
	}

	// 쪽지 보내기
	@RequestMapping(value = "/send_message", method = RequestMethod.GET)
	public String send_message(String m_nick, NoteVO noteVO) throws Exception {
		System.out.println("send_message()");

		System.out.println(m_nick);
		MemberVO memberVO = myPageService.mypageNick(m_nick);
		int m_no = memberVO.getM_no();

		System.out.println(noteVO.getM_no2());

		myPageService.sendMessage(m_no, noteVO);

		return "message/send_message_success";
	}

}
