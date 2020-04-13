package com.soninlawisdice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.soninlawisdice.service.BoardService;
import com.soninlawisdice.service.ContentService;
import com.soninlawisdice.service.IslandService;
import com.soninlawisdice.service.MyPageService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.PageMaker;
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
	

	////////////////////////////////// 보부상 /////////////////////////////////////////////
	
	// 보부상 리스트
	@RequestMapping(value = "/tlist", method = RequestMethod.GET)
	public String tlist(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq
			/*@RequestParam(name="s_content", defaultValue = "n") String s_content, */ ) {
		//@RequestParam으로 받으면, 처음에 검색어 없이 /tlist로 갈때는 없는 파라미터 오류 발생
		
		// 스프링 컨테이너가
		// SearchCriteria scri = new SearchCriteria();
		// model.attribute("scri", scri)
		// 를 자동으로 해준다.

		logger.info("tlist");	

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
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(secondhandService.tradeListCount(scri, s_content));

		// perPageNum 부여한 것 잘 가져오니? 네
		// System.out.println(pageMaker.getCri().getPerPageNum());

		model.addAttribute("pageMaker", pageMaker);

		// System.out.println(((SearchCriteria) (pageMaker.getCri())).getSearchType());

		return "secondhand/tlist";
	}
	
	// 중고거래 게시글 view
	@RequestMapping(value = "/content_view_t", method = RequestMethod.GET)
	public String content_view_t(Model model, HttpServletRequest request, CM_commentVO cm_commentVO) {
		System.out.println("content_view_t");

		System.out.println(request.getParameter("t_no"));
		
		int t_no = Integer.parseInt(request.getParameter("t_no"));
		
		model.addAttribute("content_view_t", secondhandService.selectContentOne(t_no));
		
		// 게임, 가격 리스트
		model.addAttribute("tgList", secondhandService.selectTrade_gameList(t_no));
		
		// 보련이가 로그인한 회원 m_no 받는거 해주면 받아오기
		int m_no = 9;
		model.addAttribute("m_no", m_no);
		
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
		
//		로그인 된 상태라면 이렇게 해서 현재 로그인 한 회원의 MemberVO 가져올 수 있다.
//		memberVO = (MemberVO) session.getAttribute("member");
//		model.addAttribute("member", memberVO);	
//		이렇게 넘겨야 m_no 받아올 수 있다.
		
		return "secondhand/write_view";
	}

	// 글 작성
	@RequestMapping(value = "/trade_write", method = RequestMethod.POST)
	public String write(HttpSession session, Model model, @ModelAttribute("tradeVO") TradeVO tradeVO, 
						/* @ModelAttribute("tgVO") Trade_gameVO tgVO, */
						String gameNames, String prices) throws Exception {

//		로그인 된 상태라면 이렇게 해서 현재 로그인 한 회원의 MemberVO 가져올 수 있다.
//		MemberVO memberVO = (MemberVO) session.getAttribute("member");
//		model.addAttribute("memberVO", memberVO);	
//		이렇게 넘겨야 m_no 받아올 수 있다.
		
//		System.out.println(memberVO.getM_no());
		
//		GameVO gameVO = new GameVO();
		
		// 세션 매번하기 힘드니까 임의 값 부여
		MemberVO memberVO = myPageService.mypage("test4");		
		
		secondhandService.insertTrade(tradeVO, memberVO.getM_no(), gameNames, prices);			
		
		secondhandService.boardPointUpdate(memberVO.getM_no());		
		
				
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
	public String modify(Model model, @ModelAttribute("tradeVO") TradeVO tradeVO, 
							HttpServletRequest rq) {
		// jsp에서 tg_no하고 t_no 넘어온 상태..
		logger.info("call_buy");
		
		// 보련이가 로그인한 회원 m_no 받는거 해주면 받아오기
		int m_no = 9;
		int buyer = m_no;
		
		// checkbox에서 넘긴 tg_no 배열 갖고오기
		String[] tgArr = rq.getParameterValues("tg");
		
		
		// 결제 insert/ tg_no으로 select해서 한 줄 씩 불러오기.
		secondhandService.call_buy(tradeVO, tgArr, buyer);
		
		
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

}
