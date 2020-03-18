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


@Controller
public class CassieController {
	
	private static final Logger logger = LoggerFactory.getLogger(CassieController.class);
	
	
	@RequestMapping(value = "/tlist", method = RequestMethod.GET)
	public String tlist(Model model) {
		logger.info("tlist");
		
		return "secondhand/tlist";
	}
	
	@RequestMapping(value = "/island_list", method = RequestMethod.GET)
	public String island_list(Model model) {
		logger.info("island_list");
		
		return "island/island_list";
	}
	
	
	
	
		
	
}
