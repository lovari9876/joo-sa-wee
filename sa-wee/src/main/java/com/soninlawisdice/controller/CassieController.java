package com.soninlawisdice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soninlawisdice.service.IslandService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.vo.PageMaker;
import com.soninlawisdice.vo.SearchCriteria;


@Controller
public class CassieController {

	private static final Logger logger = LoggerFactory.getLogger(CassieController.class);

	@Autowired
	private IslandService islandService;
	@Autowired
	private SecondhandService secondhandService;

	@RequestMapping(value = "/tlist", method = RequestMethod.GET)
	public String tlist(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		// 스프링 컨테이너가 
		// 	SearchCriteria scri = new SearchCriteria();
		// 	model.attribute("scri", scri)
		// 를 자동으로 해준다.
	
		logger.info("tlist");
		
		scri.setPerPageNum(15);
		
		ArrayList<HashMap<String, Object>> tList = secondhandService.selectTradeList(scri);
		model.addAttribute("tList", tList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(secondhandService.tradeListCount(scri));
		
		// perPageNum 부여한 것 잘 가져오니? 네
		//System.out.println(pageMaker.getCri().getPerPageNum());
		
		model.addAttribute("pageMaker", pageMaker );
		
		System.out.println(((SearchCriteria) (pageMaker.getCri())).getSearchType());
		
		return "secondhand/tlist";
	}


	@RequestMapping(value = "/island_list", method = RequestMethod.GET)
	public String island_list(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		logger.info("island_list");
		
		scri.setPerPageNum(15);
		
		ArrayList<HashMap<String, Object>> iList = islandService.selectIslandList(scri);
		model.addAttribute("iList", iList);
		
		// 사이즈 찍어보기
		System.out.println(iList.size());
		System.out.println(iList.get(0).toString()); // String key는 반드시 대문자로!

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(islandService.islandListCount(scri));
		
		// perPageNum 부여한 것 잘 가져오니? 네
		//System.out.println(pageMaker.getCri().getPerPageNum());
		
		model.addAttribute("pageMaker", pageMaker );
		
		System.out.println(((SearchCriteria) (pageMaker.getCri())).getSearchType());
		

		return "island/island_list";
	}



}
