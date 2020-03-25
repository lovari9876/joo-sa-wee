package com.soninlawisdice.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soninlawisdice.service.ContentService;
import com.soninlawisdice.service.ContentServiceImpl;
import com.soninlawisdice.vo.Board_writeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HeeJeongController {
	
	@Autowired
	ContentService contentService;
	
	private static final Logger logger = LoggerFactory.getLogger(HeeJeongController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/content_view", method = RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {
		logger.info("content_view");
		
		String bw_no = request.getParameter("bw_no");
		
		Board_writeVO board_writeVO = contentService.selectContentOne(bw_no);
		
		model.addAttribute("content_view", board_writeVO);
		model.addAttribute("board_typeVO", board_writeVO.getBoard_typeVO());
		model.addAttribute("memberVO", board_writeVO.getMemberVO());
		model.addAttribute("subjectVO", board_writeVO.getSubjectVO());
		
		// 게시글 조회수
		contentService.upHitContent(bw_no);

		return "content/content_view";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Board_writeVO board_writeVO, Model model) {
		logger.info("delete");
		
		contentService.deleteContent(board_writeVO);

		return "redirect:list";
	}
	
	@ResponseBody
	@RequestMapping(value = "/rec", method = RequestMethod.GET)
	public String recommend(String bw_no, Model model) {
		logger.info("recommend");
		
		// 게시글 추천수 증가
		contentService.upRecommendContent(bw_no);

		return contentService.selectRecommendContent(bw_no);
	}
	
	@RequestMapping(value = "/comment_view", method = RequestMethod.GET)
	public String comment_view(Locale locale, Model model) {
		logger.info("comment_view");

		return "content/comment_view";
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String reply(Locale locale, Model model) {
		logger.info("reply");

		return "content/reply";
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.GET)
	public String report(Locale locale, Model model) {
		logger.info("report");

		return "content/report";
	}
	
	@RequestMapping(value = "/report_success", method = RequestMethod.GET)
	public String report_success(Locale locale, Model model) {
		logger.info("report_success");

		return "content/report_success";
	}
	
	@RequestMapping(value = "/game_info", method = RequestMethod.GET)
	public String game_info(Locale locale, Model model) {
		logger.info("game_info");

		return "game_info/game_info";
	}
	
	@RequestMapping(value = "/game_detail", method = RequestMethod.GET)
	public String game_detail(Locale locale, Model model) {
		logger.info("game_detail");

		return "game_detail/game_detail";
	}
	
}
