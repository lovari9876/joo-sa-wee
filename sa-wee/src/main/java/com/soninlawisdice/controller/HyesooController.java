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
public class HyesooController {
	
	private static final Logger logger = LoggerFactory.getLogger(HyesooController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("home");
		
		return "index";
	}
	
	

	@RequestMapping(value = "/cafe_review_write", method = RequestMethod.GET)
	public String cafe_review_write(Model model) {
		logger.info("review");
		
		return "cafe_review_write";
	}
	
	
	
	@RequestMapping(value = "/list_home", method = RequestMethod.GET)
	public String list_home(Model model) {
		logger.info("review");
		
		return "list_home";
	}
	
	@RequestMapping(value = "/modify_view", method = RequestMethod.GET)
	public String modify_view(Model model) {
		logger.info("review");
		
		return "modify_view";
	}
	
	@RequestMapping(value = "/question_list", method = RequestMethod.GET)
	public String question_list(Model model) {
		logger.info("review");
		
		return "question_list";
	}
	
	@RequestMapping(value = "/question_write_view", method = RequestMethod.GET)
	public String question_write_view(Model model) {
		logger.info("review");
		
		return "question_write_view";
	}
	
	
	@RequestMapping(value = "/cafe_map", method = RequestMethod.GET)
	public String cafe_map(Model model) {
		logger.info("review");
		
		return "cafe_map";
	}
	
	

	
	@RequestMapping(value = "/cafe_content_view", method = RequestMethod.GET)
	public String cafe_content_view(Model model) {
		logger.info("review");
		
		return "cafe_content_view";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {
		logger.info("home");
		
		return "list";
	}
	
	@RequestMapping(value = "/write_view", method = RequestMethod.GET)
	public String write_view(Locale locale, Model model) {
		logger.info("home");
		
		return "write_view";
	}
	
	
	
	
}
