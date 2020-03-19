package com.soninlawisdice.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Board_hs_Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Board_hs_Controller.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("home");
		
		return "board_hs/index";
	}
	
	

	@RequestMapping(value = "/cafe_review_write", method = RequestMethod.GET)
	public String cafe_review_write(Model model) {
		logger.info("review");
		
		return "board_hs/cafe_review_write";
	}
	
	
	
	@RequestMapping(value = "/list_home", method = RequestMethod.GET)
	public String list_home(Model model) {
		logger.info("review");
		
		return "board_hs/list_home";
	}
	
	@RequestMapping(value = "/modify_view", method = RequestMethod.GET)
	public String modify_view(Model model) {
		logger.info("review");
		
		return "board_hs/modify_view";
	}
	
	@RequestMapping(value = "/question_list", method = RequestMethod.GET)
	public String question_list(Model model) {
		logger.info("review");
		
		return "board_hs/question_list";
	}
	
	@RequestMapping(value = "/question_write_view", method = RequestMethod.GET)
	public String question_write_view(Model model) {
		logger.info("review");
		
		return "board_hs/question_write_view";
	}
	
	
	@RequestMapping(value = "/cafe_map", method = RequestMethod.GET)
	public String cafe_map(Model model) {
		logger.info("review");
		
		return "board_hs/cafe_map";
	}
	
	

	
	@RequestMapping(value = "/cafe_content_view", method = RequestMethod.GET)
	public String cafe_content_view(Model model) {
		logger.info("review");
		
		return "board_hs/cafe_content_view";
	}
	
	
	@RequestMapping(value = "/write_view", method = RequestMethod.GET)
	public String write_view(Locale locale, Model model) {
		logger.info("home");
		
		return "board_hs/write_view";
	}
	
	@RequestMapping(value = "/board_story", method = RequestMethod.GET)
	public String board_story(Locale locale, Model model) {
		logger.info("home");
		
		return "board_hs/board_story";
	}
	
	@RequestMapping(value = "/board_open_review", method = RequestMethod.GET)
	public String board_open_review(Locale locale, Model model) {
		logger.info("home");
		
		return "board_hs/board_open_review";
	}
	
	@RequestMapping(value = "/board_meet", method = RequestMethod.GET)
	public String board_meet(Locale locale, Model model) {
		logger.info("home");
		
		return "board_hs/board_meet";
	}
	
	@RequestMapping(value = "/board_news", method = RequestMethod.GET)
	public String board_news(Locale locale, Model model) {
		logger.info("home");
		
		return "board_hs/board_news";
	}
	
	@RequestMapping(value = "/board_qna", method = RequestMethod.GET)
	public String board_qna(Locale locale, Model model) {
		logger.info("home");
		
		return "board_hs/board_qna";
	}
	
	@RequestMapping(value = "/board_creation", method = RequestMethod.GET)
	public String board_creation(Locale locale, Model model) {
		logger.info("home");
		
		return "board_hs/board_creation";
	}
	
	
	
	
}
