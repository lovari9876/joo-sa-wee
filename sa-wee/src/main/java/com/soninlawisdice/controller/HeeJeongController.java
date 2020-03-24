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
public class HeeJeongController {
	
	private static final Logger logger = LoggerFactory.getLogger(HeeJeongController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/content_view", method = RequestMethod.GET)
	public String content(Locale locale, Model model) {
		logger.info("content_view");

		return "content/content_view";
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