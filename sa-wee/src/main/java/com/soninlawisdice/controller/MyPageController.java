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
		
				
		return "mypage/mypage";
	}

///////////// 내거래 및 결제 ////////////////////////////////////////////////////////	
	
	// 판매자 주문확인 모달: sell_modal_view
	@ResponseBody
	@RequestMapping(value = "/sell_modal_view/{pno}", method = RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> sell_modal_view(Model model, 
						@PathVariable(value = "pno") int pno, HttpServletRequest rq) {
		System.out.println("sell_modal_view");
			
		// mypage c:import에서 버튼 클릭 시, c:param으로 보낸 p_no
		// int p_no = rq.getParameter("pno");
		System.out.println("p_no : " + pno);

		/*
		 * ArrayList<HashMap<String, Object>> ptgList =
		 * secondhandService.selectPTGList(pno); model.addAttribute("ptgList", ptgList);
		 */
		  
		return secondhandService.selectPTGList(pno); 
	} 	
	
	// 판매자 운송장 입력 모달: sell2_modal_view
	@ResponseBody
	@RequestMapping(value = "/sell2_modal_view/{pno}", method = RequestMethod.POST)
	public ArrayList<HashMap<String, Object>> sell2_modal_view(Model model, 
			@RequestParam(value = "p_no") int p_no, HttpServletRequest rq) {
		System.out.println("sell2_modal_view");

		System.out.println("p_no : " + p_no);		
		/* rq.getParameter(name); */

		  
		return secondhandService.selectPTGList(p_no); 
	} 
	
	// 판매자 운송장 받기: FROM sell2_modal_view
	@RequestMapping(value = "sellerTracking", method = RequestMethod.POST)
	public String sellerTracking(Model model, HttpServletRequest rq, 
			@ModelAttribute("paymentVO") PaymentVO paymentVO) {
		System.out.println("sellerTracking");

		System.out.println("p_no : " + paymentVO.getP_no());		
		
		secondhandService.updatePaymentTracking(paymentVO);
		  
		return "redirect:/mypage#trade"; 
	}

	// ========구매자========================================
	// 구매자 결제 모달: buy_modal_view
	@ResponseBody
	@RequestMapping(value = "/buy_modal_view/{pno}", method = RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> buy_modal_view(Model model, 
						@PathVariable(value = "pno") int pno, HttpServletRequest rq) {
		System.out.println("buy_modal_view");
			
		// mypage c:import에서 버튼 클릭 시, c:param으로 보낸 p_no
		// int p_no = rq.getParameter("pno");
		System.out.println("p_no : " + pno);

		  
		return secondhandService.selectPTGList(pno); 
	} 
	
	// 결제 성공해서 rsp.success=true 일 때 ajax로 아임포트 서버의 결제 성공 정보 받을 곳
	@ResponseBody
	@RequestMapping(value = "/payments/complete", method = RequestMethod.POST)
	public String pay_success(Model model, HttpServletRequest rq, HttpServletResponse rs,
			@RequestParam("p_no") int p_no) throws Exception {
		
		System.out.println("payments/complete");
						
		// ajax로 보낸 json p_no 받기
		//int p_no = paymentVO.getP_no();
		System.out.println("ajax로 받은 p_no: "+ p_no);
		
		// ajax text로 넘겨줘서 받은 값 2개
		String imp_uid = rq.getParameter("imp_uid");
		String payedPrice = rq.getParameter("price"); 
		
		System.out.println("imp_uid: " + imp_uid);
		
		IamPort iamPort = new IamPort();
		String status = iamPort.getPaymentInfo(imp_uid); // 결제 상태
		System.out.println(status);
			
	
		secondhandService.updatePaymentSuccess(p_no);
		  
		return "mypage/mypage#trade"; // 사실 이 리턴값을 json으로 다시 보내야 함
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
