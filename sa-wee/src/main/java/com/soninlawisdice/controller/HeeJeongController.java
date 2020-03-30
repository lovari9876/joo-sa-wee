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
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;

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
		System.out.println("content_view");

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
		System.out.println("delete");

		contentService.deleteContent(board_writeVO);

		return "redirect:list";
	}

	@ResponseBody
	@RequestMapping(value = "/rec", method = RequestMethod.GET)
	public String recommend(String bw_no, Model model) {
		System.out.println("recommend");

		// 게시글 추천수 증가
		contentService.upRecommendContent(bw_no);

		return contentService.selectRecommendContent(bw_no);
	}

	@RequestMapping(value = "/comment_view", method = RequestMethod.GET)
	public String comment_view(Locale locale, Model model) {
		System.out.println("comment_view");

		return "content/comment_view";
	}

	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String reply(Locale locale, Model model) {
		logger.info("reply");

		return "content/reply";
	}
	
	// 게시글 신고글 view
	@RequestMapping(value = "/report_view_bw", method = RequestMethod.GET)
	public String report_view_bw(HttpServletRequest request, Model model) {
		System.out.println("report_view_bw");

		String bw_no = request.getParameter("bw_no");

		Board_writeVO board_writeVO = contentService.selectContentOne(bw_no);
		
		System.out.println(bw_no);

		model.addAttribute("content_view", board_writeVO);
		model.addAttribute("board_typeVO", board_writeVO.getBoard_typeVO());
		model.addAttribute("memberVO", board_writeVO.getMemberVO());
		model.addAttribute("subjectVO", board_writeVO.getSubjectVO());

		return "content/report_view_bw";
	}
	
	// 게시글 신고글 쓰기
	@RequestMapping(value = "/report_bw", method = RequestMethod.GET)
	public String report_bw(ReportVO reportVO, Model model) {
		System.out.println("report_bw");

		System.out.println(reportVO.getR_type_no());
		
		contentService.insertReportBW(reportVO);

		return "content/report_success";
	}
	
	// 회원 신고글 view
	@RequestMapping(value = "/report_view_m", method = RequestMethod.GET)
	public String report_view_m(HttpServletRequest request, Model model) {
		System.out.println("report_view_m");
		
		String m_no = request.getParameter("m_no");

		MemberVO memberVO = contentService.selectContentM(m_no);
			
		System.out.println(m_no);

		model.addAttribute("member_view", memberVO);
		/*
		 * model.addAttribute("board_typeVO", board_writeVO.getBoard_typeVO());
		 * model.addAttribute("memberVO", board_writeVO.getMemberVO());
		 * model.addAttribute("subjectVO", board_writeVO.getSubjectVO());
		 */

		return "content/report_view_m";
	}
		
	// 회원 신고글 쓰기
	@RequestMapping(value = "/report_m", method = RequestMethod.GET)
	public String report_m(ReportVO reportVO, Model model) {
		System.out.println("report_m");

		System.out.println(reportVO.getR_type_no());
			
		contentService.insertReportM(reportVO);

		return "redirect:content_view";
	}
	
	// 댓글 신고글 view
	@RequestMapping(value = "/report_view_cm", method = RequestMethod.GET)
	public String report_view_cm(HttpServletRequest request, Model model) {
		System.out.println("report_view_cm");
			
		String cm_no = request.getParameter("cm_no");

		CM_commentVO cm_commentVO = contentService.selectContentCM(cm_no);
				
		System.out.println(cm_no);

		model.addAttribute("comment_view", cm_commentVO);
		/*
		 * model.addAttribute("board_typeVO", board_writeVO.getBoard_typeVO());
		 * model.addAttribute("memberVO", board_writeVO.getMemberVO());
		 * model.addAttribute("subjectVO", board_writeVO.getSubjectVO());
		 */

		return "content/report_view_cm";
	}
			
	// 댓글 신고글 쓰기
	@RequestMapping(value = "/report_cm", method = RequestMethod.GET)
	public String report_cm(ReportVO reportVO, Model model) {
		System.out.println("report_cm");

		System.out.println(reportVO.getR_type_no());
				
		contentService.insertReportCM(reportVO);

		return "content/report_success";
	}

	@RequestMapping(value = "/report_success", method = RequestMethod.GET)
	public String report_success(Locale locale, Model model) {
		System.out.println("report_success");

		return "content/report_success";
	}

	@RequestMapping(value = "/game_info", method = RequestMethod.GET)
	public String game_info(Locale locale, Model model) {
		System.out.println("game_info");

		return "game_info/game_info";
	}

	@RequestMapping(value = "/game_detail", method = RequestMethod.GET)
	public String game_detail(Locale locale, Model model) {
		System.out.println("game_detail");

		return "game_detail/game_detail";
	}

}
