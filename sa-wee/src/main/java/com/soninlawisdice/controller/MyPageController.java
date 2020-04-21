package com.soninlawisdice.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.soninlawisdice.iamport.IamPort;
import com.soninlawisdice.service.AdminService;
import com.soninlawisdice.service.MyPageService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.service.SponsorService;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.PageMaker;
import com.soninlawisdice.vo.PaymentVO;
import com.soninlawisdice.vo.NoteVO;



@Controller
public class MyPageController {

	IamportClient client;
	
	@Autowired
	private MyPageService myPageService;

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SecondhandService secondhandService;

	@Autowired
	private SponsorService sponsorService;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

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
	public String mypage(Principal principal, Model model, MemberVO memberVO, String cate) throws Exception {
		System.out.println("mypage()");

		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);

		model.addAttribute("member", memberVO);

		int m_no = memberVO.getM_no();

		int myWriteCount = myPageService.myWriteCount(m_no);
		model.addAttribute("myWriteCount", myWriteCount);

		int myReplyCount = myPageService.myReplyCount(m_no);
		model.addAttribute("myReplyCount", myReplyCount);
			
		
		///////////// 내 후원 /////////////////////////////////
		ArrayList<HashMap<String, Object>> sponsorList = 
				sponsorService.selectSponsorList(m_no);
		model.addAttribute("sponsorList", sponsorList);
		
		
		///////////// 내 판매 /////////////////////////////////
		String who = "seller"; // xml에서 판매자, 구매자 식별 위한 값
		ArrayList<HashMap<String, Object>> sPayList = 
				secondhandService.selectPaymentList(m_no, who);
		model.addAttribute("sPayList", sPayList);

		// 판매자 가격확정 모달: sell_modal_view
		// 버튼 클릭시 P_NO 받아와
		
		
		///////////// 내 구매 /////////////////////////////////
		who = "buyer"; // xml에서 판매자, 구매자 식별 위한 값
		ArrayList<HashMap<String, Object>> bPayList = 
				secondhandService.selectPaymentList(m_no, who);
		model.addAttribute("bPayList", bPayList);
		
		
		//////////////////내가 쓴 글 목록//////////////////////////
		model.addAttribute("myBoardList", adminService.myBoardList(m_no));
		
		//////////////////내가 쓴 댓글 목록//////////////////////////
		model.addAttribute("myCommentList", adminService.myCommentList(m_no));
		
		////////////////// 스크랩 //////////////////////////
		model.addAttribute("myScrap", adminService.scrapList(m_no));
		
		//////////////////스크랩 //////////////////////////
		model.addAttribute("myReport", adminService.myReportList(m_no));
				
		return "mypage/mypage";
	}

	
//////////////////////////////////////////////////////////////////////////////////////////////

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
	public String modifyMember(MemberVO memberVO) throws Exception {
		System.out.println("mypageModify()");

		System.out.println(memberVO.getM_id());
		myPageService.modifyMember(memberVO);

		return "redirect:/mypage";
	}
	
	// 회원비밀번호 수정뷰
	@RequestMapping(value = "/pw_modifyview", method = RequestMethod.GET)
	public String pwModifyView(Principal principal, Model model, MemberVO memberVO) throws Exception {
		System.out.println("pwModifyView()");

		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);

		model.addAttribute("member", memberVO);

		return "mypage/modify_pw";
	}
	
	// 회원비밀번호 수정
	@RequestMapping(value = "/pw_modify", method = RequestMethod.POST)
	public String pwModify(MemberVO memberVO) throws Exception {
		System.out.println("pwModify()");
		System.out.println(memberVO.getM_id());
		
		String m_pw = memberVO.getM_pw();
		myPageService.pwModify(memberVO.getM_no(), pwdEncoder.encode(m_pw));

		return "mypage/modify_pw";
	}
	
	
	
	// 회원 탈퇴 뷰
	@RequestMapping(value = "/outview", method = RequestMethod.GET)
	public String outview(Model model) throws Exception {
		System.out.println("outview()");
		model.addAttribute("withdrawal", myPageService.withdrawal());

		return "mypage/out";
	}
	// 회원 탈퇴
	@RequestMapping(value = "/out", method = RequestMethod.GET)
	public String out(Principal principal, HttpSession session, HttpServletRequest rq) throws Exception {
		System.out.println("out()");

		String m_id = principal.getName();
		MemberVO memberVO = myPageService.mypage(m_id);
		int m_no = memberVO.getM_no();
		
		String w_noString = rq.getParameter("w_no");
		System.out.println(w_noString);
		String wr_reason = rq.getParameter("wr_reason");
		System.out.println(wr_reason);

		int w_no = Integer.parseInt(w_noString);
		
		myPageService.wdInsert(m_no, w_no, wr_reason);
		System.out.println("탈퇴사유 작성 완");
		adminService.outMember(memberVO.getM_no());
		System.out.println("탈퇴");
		
		session.invalidate();

		return "redirect:/";
	}
	
	// 다른 회원 정보 보기
	@RequestMapping(value = "/other", method = { RequestMethod.GET, RequestMethod.POST })
	public String other(Principal principal, String m_nick, Model model) throws Exception {
		System.out.println("other()");		
		System.out.println("m_nick" + m_nick);
		
		MemberVO otherVO = myPageService.mypageNick(m_nick);
		model.addAttribute("member", otherVO);
		
		int m_no = otherVO.getM_no();
		int myWriteCount = myPageService.myWriteCount(m_no);
		model.addAttribute("myWriteCount", myWriteCount);

		int myReplyCount = myPageService.myReplyCount(m_no);
		model.addAttribute("myReplyCount", myReplyCount);
		
		//////////////////내가 쓴 글 목록//////////////////////////
		model.addAttribute("myBoardList", adminService.myBoardList(m_no));
		
		//////////////////내가 쓴 댓글 목록//////////////////////////
		model.addAttribute("myCommentList", adminService.myCommentList(m_no));

		return "mypage/other";
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
	@RequestMapping(value = "/send_messageview", method = { RequestMethod.GET, RequestMethod.POST })
	public String send_messageview(Principal principal, MemberVO memberVO, Model model) throws Exception {
		System.out.println("send_messageview()" + memberVO.getM_no());
		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);

		model.addAttribute("member", memberVO);

		return "message/send_message";
	}
	// 쪽지 보내기 뷰 닉네임 정해져있을 때
	@RequestMapping(value = "/send_messageview_other", method = { RequestMethod.GET, RequestMethod.POST })
	public String send_messageview2(Principal principal, MemberVO memberVO, Model model, String m_nick) throws Exception {
		System.out.println("send_messageview()" + memberVO.getM_no());
		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);

		model.addAttribute("member", memberVO);

		MemberVO otherVO = myPageService.mypageNick(m_nick);
		model.addAttribute("other", otherVO);
		
		return "message/send_message2";
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
