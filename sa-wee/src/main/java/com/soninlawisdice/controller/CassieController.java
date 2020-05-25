package com.soninlawisdice.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.soninlawisdice.iamport.IamPort;
import com.soninlawisdice.service.BoardService;
import com.soninlawisdice.service.ContentService;
import com.soninlawisdice.service.IslandService;
import com.soninlawisdice.service.MyPageService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.service.SponsorService;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.PageMaker;
import com.soninlawisdice.vo.PaymentVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;
import com.soninlawisdice.vo.Trade_gameVO;

@Controller
public class CassieController {

	private static final Logger logger = LoggerFactory.getLogger(CassieController.class);

	@Autowired
	private IslandService islandService;
	@Autowired
	private SecondhandService secondhandService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ContentService contentService;
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private SponsorService sponsorService;
	

	////////////////////////////////// 보부상 /////////////////////////////////////////////
	
	// 보부상 리스트
	@RequestMapping(value = "/tlist", method = RequestMethod.GET)
	public String tlist(Model model, Principal principal, @ModelAttribute("scri") SearchCriteria scri,
					HttpServletRequest rq
			/*@RequestParam(name="s_content", defaultValue = "n") String s_content, */ ) throws Exception {
		//@RequestParam으로 받으면, 처음에 검색어 없이 /tlist로 갈때는 없는 파라미터 오류 발생
		
		// 스프링 컨테이너가
		// SearchCriteria scri = new SearchCriteria();
		// model.attribute("scri", scri)
		// 를 자동으로 해준다.

		logger.info("tlist");	
		
		// 로그인 안되어있는 상태에서도 볼 수 있음
		if(principal != null) {
			String m_id = principal.getName();
			MemberVO memberVO = myPageService.mypage(m_id);
			model.addAttribute("memberVO", memberVO);
		}
		
		// 한 페이지에 글 15개씩 보이도록
		scri.setPerPageNum(15);

		// 쿼리 uri로 보낸 파라미터들 확인
		System.out.println("query: " + rq.getQueryString());
		System.out.println("s_content: " + rq.getParameter("s_content"));
		System.out.println("searchType: " + scri.getSearchType());

//		HashMap<String, Object> search = new HashMap<>();
//		search.put("scri", scri);
//		
		String s_content = rq.getParameter("s_content");
//		search.put("s_content", s_content);
		
		String sort = rq.getParameter("sort");

		ArrayList<HashMap<String, Object>> tList = secondhandService.selectTradeList(scri, s_content, sort);
		model.addAttribute("tList", tList);
		model.addAttribute("s_content", s_content); // 단순히 jsp에서 select 선택 반영 위한 넘기기
		model.addAttribute("sort", sort);
		
		System.out.println(tList);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(secondhandService.tradeListCount(scri, s_content));

		// perPageNum 부여한 것 잘 가져오니? 네
		// System.out.println(pageMaker.getCri().getPerPageNum());

		model.addAttribute("pageMaker", pageMaker);

		// System.out.println(((SearchCriteria) (pageMaker.getCri())).getSearchType());

		return "secondhand/tlist";
	}
	
	// tList : 태그
	@RequestMapping(value = "/tListGame")
	public String tListGame(Model model, HttpServletRequest request) {
		
		int t_no = Integer.parseInt(request.getParameter("t_no"));
		System.out.println("t_no : " + t_no);
		
		model.addAttribute("gameNames", secondhandService.selectTrade_gameList(t_no));
		
		return "secondhand/tListGame";
	}
		
	
	// 중고거래 게시글(content) view
	@RequestMapping(value = "/content_view_t", method = RequestMethod.GET)
	public String content_view_t(Principal principal, Model model, 
				HttpServletRequest request, CM_commentVO cm_commentVO) throws Exception {
		
		System.out.println("content_view_t");
		
		// 로그인 안되어있는 상태에서도 볼 수 있음
		if(principal != null) {
			String m_id = principal.getName();
			MemberVO memberVO = myPageService.mypage(m_id);
			model.addAttribute("m_no", memberVO.getM_no()); // for 희정..
			model.addAttribute("memberVO", memberVO); // for cassie
		}

		System.out.println(request.getParameter("t_no"));
		
		int t_no = Integer.parseInt(request.getParameter("t_no"));
		
		// 글 삭제는 결제 있으면 하면 안되니까...			
		int pCnt = secondhandService.countPayment(t_no);
		model.addAttribute("pCnt", pCnt);
		
		model.addAttribute("content_view_t", secondhandService.selectContentOne(t_no));
		
		// 게임, 가격 리스트
		model.addAttribute("tgList", secondhandService.selectTrade_gameList(t_no));

		//파일 이름
		model.addAttribute("fileName", boardService.selectFileList(t_no));
		

		// 게시글 조회수
		secondhandService.upHitContent(t_no);

		return "secondhand/content_view";
	}
	
	// 중고거래 게시글 삭제
	@RequestMapping(value = "/delete_t", method = RequestMethod.GET)
	public String delete_t(TradeVO tradeVO, Model model) {
		System.out.println("delete_t");
		
		secondhandService.deleteContent(tradeVO);

		return "redirect:tlist";
	}
	
	// 글쓰기 view
	@RequestMapping(value = "/write_view_t", method = RequestMethod.GET)
	public String write_view(Model model) {
		logger.info("write_view_t");
		
		return "secondhand/write_view";
	}

	// 글 작성
	@RequestMapping(value = "/trade_write", method = RequestMethod.POST)
	public String write(HttpSession session, Model model, Principal principal, MultipartHttpServletRequest mpRequest,
				@ModelAttribute("tradeVO") TradeVO tradeVO, 
						/* @ModelAttribute("tgVO") Trade_gameVO tgVO, */
				String gameNames, String prices) throws Exception {

		String m_id = principal.getName();		
		MemberVO memberVO = myPageService.mypage(m_id);		
		
		secondhandService.insertTrade(tradeVO, memberVO.getM_no(), gameNames, prices, mpRequest);			
		
		secondhandService.boardPointUpdate(memberVO.getM_no());		
		
		System.out.println(tradeVO.getT_no());
				
		return "redirect:tlist";
	}

	// 수정하기 view
	@RequestMapping(value = "/trade_modify_view", method = RequestMethod.GET)
	public String modify_view(Model model, @RequestParam("t_no") int t_no, HttpServletRequest rq) {
		
		logger.info("trade_modify_view");
		
		model.addAttribute("tradeVO", secondhandService.selectContentOne(t_no)); // hashmap 리턴
		
		// 게임, 가격 가져와서 다시 string 으로 만들어준다.
		ArrayList<Trade_gameVO> tgList = secondhandService.selectTrade_gameList(t_no);
		String game= "";
		String price = "";
		
		for(Trade_gameVO tg : tgList) {
			game += tg.getTg_name();
			price += tg.getTg_price();
			
			if(tgList.get(tgList.size()-1) != tg) { // 마지막 아니면
				game += ", ";
				price += ", ";
			}
		}
		
		model.addAttribute("gameNames", game);
		model.addAttribute("prices", price);
		
		
		return "secondhand/modify_view";
	}
	
	// 수정하고나서 content_view 리다이렉트
	@RequestMapping(value = "/trade_modify", method = RequestMethod.POST)
	public String modify(Model model, @ModelAttribute("tradeVO") TradeVO tradeVO, 
							@ModelAttribute("tgVO") Trade_gameVO tgVO,
							String gameNames, String prices) {
		
		logger.info("trade_modify");
		
		secondhandService.modify(tradeVO, gameNames, prices);
		
		int t_no = tradeVO.getT_no();   
		System.out.println("t_no = "+t_no );
		
		return "redirect:content_view_t?t_no="+t_no;
	}

	// 결제 modal 구매요청 시, 결제 생성 및 처리 후 content_view 리다이렉트
	@RequestMapping(value = "/call_buy", method = RequestMethod.POST)
	public String modify(Principal principal, Model model, @ModelAttribute("tradeVO") TradeVO tradeVO, 
							HttpServletRequest rq) throws Exception {
		// jsp에서 tg_no하고 t_no 넘어온 상태..
		logger.info("call_buy");
		
		String m_id = principal.getName();		
		MemberVO memberVO = myPageService.mypage(m_id);
		
		int buyer = memberVO.getM_no();
		
		// checkbox에서 넘긴 tg_no 배열 갖고오기
		try {
			String[] tgArr = rq.getParameterValues("tg");
			
			// 결제 insert/ tg_no으로 select해서 한 줄 씩 불러오기.
			secondhandService.call_buy(tradeVO, tgArr, buyer);
		}catch(NullPointerException e) { // 체크 안하고 구매요청 시
			// 그냥 content view 리턴
		}catch(Exception e) {
		}		
		
		int t_no = tradeVO.getT_no();   
		System.out.println("t_no = "+t_no );
		
		return "redirect:content_view_t?t_no="+t_no;
	}
	
	
	////////////////////////////////// 무인도 /////////////////////////////////////////////

	// 무인도 리스트
	@RequestMapping(value = "/island_list", method = RequestMethod.GET)
	public String island_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) {
		logger.info("island_list");

		scri.setPerPageNum(15);
		
		// 검색 기능 게시판별 추가..
		String b = rq.getParameter("bt_no");
		int bt_no;
		
		if (b != null) {
			bt_no = Integer.parseInt(rq.getParameter("bt_no")); 
			System.out.println("===============bt_no" + bt_no);
		}else {
			bt_no = 0;
		}

		// <c:out selected>를 위한 값..
		model.addAttribute("bt_no", bt_no);
		
		ArrayList<HashMap<String, Object>> iList = islandService.selectIslandList(scri, bt_no);
		model.addAttribute("iList", iList);

		// 사이즈 찍어보기
		System.out.println("리스트 개수"+iList.size());
//		System.out.println(iList.get(0).toString()); // String key는 반드시 대문자로! 
//		이 시험 출력을 계속 두면, 받아올 리스트가 없는 상황에서는 index 없다고 오류난다....	

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(islandService.islandListCount(scri, bt_no));

		// perPageNum 부여한 것 잘 가져오니? 네
		// System.out.println(pageMaker.getCri().getPerPageNum());

		model.addAttribute("pageMaker", pageMaker);

		System.out.println("서치타입"+((SearchCriteria) (pageMaker.getCri())).getSearchType());

		return "island/island_list";
	}
	
	// 무인도 게시글 view
	@RequestMapping(value = "/content_view_i", method = RequestMethod.GET)
	public String content_view_i(Model model, HttpServletRequest request, CM_commentVO cm_commentVO) {
		System.out.println("content_view_i");

		System.out.println(request.getParameter("i_no"));
		
		int i_no = Integer.parseInt(request.getParameter("i_no"));
		int bt_no = Integer.parseInt(request.getParameter("bt_no"));
		
		if (bt_no==9) { // 보부상
			model.addAttribute("content_view_t", secondhandService.selectContentOne(i_no));
			secondhandService.upHitContent(i_no);

			return "secondhand/content_view";
			
		}else if(bt_no==11) { // 카페리뷰			
			model.addAttribute("content_view_cr", boardService.selectReviewOne(i_no));
			boardService.review_uphit(i_no);
			
			return "content/content_view_cr";
			
		}else { // 게시글
			model.addAttribute("content_view", contentService.selectContentOne(i_no));
			contentService.upHitContent(i_no);

			return "content/content_view";
		}		
		
	}
	
	
////////////////// 마이페이지 내거래 및 중고거래 결제 ////////////////////////////////////////////////////////

	// ========판매자==================================================
	// 판매자 주문확인 모달: sell_modal_view
	@ResponseBody
	@RequestMapping(value = "/sell_modal_view/{pno}", method = RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> sell_modal_view(Model model, @PathVariable(value = "pno") int pno,
			HttpServletRequest rq) {
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
	public ArrayList<HashMap<String, Object>> sell2_modal_view(Model model, @RequestParam(value = "p_no") int p_no,
			HttpServletRequest rq) {
		System.out.println("sell2_modal_view");

		System.out.println("p_no : " + p_no);
		/* rq.getParameter(name); */

		return secondhandService.selectPTGList(p_no);
	}

	// 판매자 운송장 받기: FROM sell2_modal_view(입력 시), sell3_modal_view(수정 시)
	@RequestMapping(value = "sellerTracking", method = RequestMethod.POST)
	public String sellerTracking(Model model, HttpServletRequest rq, @ModelAttribute("paymentVO") PaymentVO paymentVO) {
		System.out.println("sellerTracking");

		System.out.println("p_no : " + paymentVO.getP_no());

		secondhandService.updatePaymentTracking(paymentVO);

		return "redirect:/mypage#trade";
	}

	// ========구매자==================================================
	// 구매자 결제 모달: buy_modal_view
	@ResponseBody
	@RequestMapping(value = "/buy_modal_view/{pno}", method = RequestMethod.GET)
	public ArrayList<HashMap<String, Object>> buy_modal_view(Model model, @PathVariable(value = "pno") int pno,
			HttpServletRequest rq) {
		System.out.println("buy_modal_view");

		// mypage c:import에서 버튼 클릭 시, c:param으로 보낸 p_no
		// int p_no = rq.getParameter("pno");
		System.out.println("p_no : " + pno);

		return secondhandService.selectPTGList(pno);
	}

	// 구매자 구매취소(거래취소): FROM buy_modal_view
	@RequestMapping(value = "buyerCancel", method = RequestMethod.POST)
	public String buyerCancel(Model model, HttpServletRequest rq,
			@ModelAttribute("paymentVO") PaymentVO paymentVO /* ,@RequestParam("p_no") int p_no */) {
		System.out.println("buyerCancel");

		// int p_no = Integer.parseInt(rq.getParameter("p_no"));
		System.out.println("p_no : " + paymentVO.getP_no());

		// PaymentVO paymentVO = new PaymentVO();
		// paymentVO.setP_no(p_no);

		secondhandService.updatePaymentBuyerCancel(paymentVO);

		return "redirect:/mypage#trade";
	}

	// 결제 성공해서 rsp.success=true 일 때 ajax로 아임포트 서버의 결제 성공 정보 받을 곳
	@ResponseBody
	@RequestMapping(value = "/payments/complete", method = RequestMethod.POST)
	public String pay_success(Model model, HttpServletRequest rq, HttpServletResponse rs,
			@RequestParam("p_no") int p_no) throws Exception {

		System.out.println("payments/complete");

		// ajax로 보낸 json p_no 받기
		// int p_no = paymentVO.getP_no();
		System.out.println("ajax로 받은 p_no: " + p_no);

		// ajax text로 넘겨줘서 받은 값 2개
		String imp_uid = rq.getParameter("imp_uid");
		// String payedPrice = rq.getParameter("price"); // 결국 안씀

		System.out.println("imp_uid: " + imp_uid);

		IamPort iamPort = new IamPort();
		String status = iamPort.getPaymentInfo(imp_uid); // 결제 상태
		System.out.println(status);

		secondhandService.updatePaymentSuccess(p_no);

		return "mypage/mypage#trade"; // 사실 이 리턴값을 json으로 다시 보내야 함
	}

	// 구매자 수취확인: FROM buy3_modal_view
	@RequestMapping(value = "buyerConfirm", method = RequestMethod.POST)
	public String buyerConfirm(Model model, HttpServletRequest rq, @RequestParam("p_no") int p_no) {
		System.out.println("buyerConfirm");

		// int p_no = Integer.parseInt(rq.getParameter("p_no"));
		System.out.println("p_no : " + p_no);

		PaymentVO paymentVO = new PaymentVO();
		paymentVO.setP_no(p_no);

		secondhandService.updatePaymentBuyerConfirm(paymentVO);

		return "redirect:/mypage#trade";
	}	


///////////////////////////////// 후원 ///////////////////////////////////////////////////////////////////
	
	// 후원 모달에서 후원 insert 처리 후에 redirect..
	@ResponseBody
	@RequestMapping(value = "/sponsor_modal_view", method = RequestMethod.POST)
	public HashMap<String, Object> sponsor_modal_view(Principal principal, Model model, 
						@RequestParam(value = "amount") int amount, 
						HttpServletRequest rq) throws Exception {
		
		logger.info("sponsor_modal_view");
		
		String m_id = principal.getName();		
		MemberVO memberVO = myPageService.mypage(m_id);
		
		int sponsor = memberVO.getM_no();
		
		// 후원 insert
		sponsorService.insertSponsor(sponsor, amount);
		
		// 방금 생성한 거 가져오기
		return sponsorService.selectSponsorLatest(sponsor, amount);
	}
	
	
	// 결제 성공해서 rsp.success=true 일 때 ajax로 아임포트 서버의 결제 성공 정보 받을 곳
	@ResponseBody
	@RequestMapping(value = "/payments/complete/sponsor", method = RequestMethod.POST)
	public String sponsor_success(Model model, HttpServletRequest rq, HttpServletResponse rs,
			@RequestParam("sp_no") int sp_no) throws Exception {

		System.out.println("sponsor_success");

		System.out.println("ajax로 받은 sp_no: " + sp_no);

		// ajax text로 넘겨줘서 받은 값 2개
		String imp_uid = rq.getParameter("imp_uid");
		// String payedPrice = rq.getParameter("price");

		System.out.println("imp_uid: " + imp_uid);

		IamPort iamPort = new IamPort();
		String status = iamPort.getPaymentInfo(imp_uid); // 결제 상태
		System.out.println(status);

		// 해당 회원 포인트 금액만큼 더하기
		sponsorService.updateSponsorPoint(sp_no);

		return ""; // 사실 이 리턴값을 json으로 다시 보내야 함
	}
	

}
