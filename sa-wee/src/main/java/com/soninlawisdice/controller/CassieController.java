package com.soninlawisdice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soninlawisdice.service.BoardService;
import com.soninlawisdice.service.ContentService;
import com.soninlawisdice.service.IslandService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.PageMaker;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.TradeVO;

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

		ArrayList<HashMap<String, Object>> tList = secondhandService.selectTradeList(scri, s_content);
		model.addAttribute("tList", tList);
		model.addAttribute("s_content", s_content); // 단순히 jsp에서 select 선택 반영 위한 넘기기
		
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

		// 게시글 조회수
		secondhandService.upHitContent(t_no);

		return "secondhand/content_view";
	}
	
	// 중고거래 게시글 삭제
	@RequestMapping(value = "/delete_t", method = RequestMethod.GET)
	public String delete_t(TradeVO tradeVO, Model model) {
		System.out.println("delete_t");

		secondhandService.deleteContent(tradeVO);

		return "redirect:/tlist";
	}
	
	
	////////////////////////////////// 무인도 /////////////////////////////////////////////

	// 무인도 리스트
	@RequestMapping(value = "/island_list", method = RequestMethod.GET)
	public String island_list(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		logger.info("island_list");

		scri.setPerPageNum(15);

		ArrayList<HashMap<String, Object>> iList = islandService.selectIslandList(scri);
		model.addAttribute("iList", iList);

		// 사이즈 찍어보기
		System.out.println(iList.size());
//		System.out.println(iList.get(0).toString()); // String key는 반드시 대문자로! 
//		이 시험 출력을 계속 두면, 받아올 리스트가 없는 상황에서는 index 없다고 오류난다....	

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(islandService.islandListCount(scri));

		// perPageNum 부여한 것 잘 가져오니? 네
		// System.out.println(pageMaker.getCri().getPerPageNum());

		model.addAttribute("pageMaker", pageMaker);

		System.out.println(((SearchCriteria) (pageMaker.getCri())).getSearchType());

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
			boardService.review_uphit(i_no);
			model.addAttribute("cafe_review", boardService.selectReviewOne(i_no));
			
			return "board_hs/cafe_review_content_view";
			
		}else { // 게시글
			model.addAttribute("content_view", contentService.selectContentOne(i_no));
			contentService.upHitContent(i_no);

			return "content/content_view";
		}
		
		
	}

}
