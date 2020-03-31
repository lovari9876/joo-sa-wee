package com.soninlawisdice.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
import com.soninlawisdice.vo.TradeVO;

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
		
		scri.setPerPageNum(20);
		
		List<TradeVO> tList = secondhandService.selectTradeList(scri);
		model.addAttribute("tList", tList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(secondhandService.tradeListCount(scri));
		
		model.addAttribute("pageMager", pageMaker );
		
		return "secondhand/tlist";
	}


	@RequestMapping(value = "/island_list", method = RequestMethod.GET)
	public String island_list(Model model) {
		logger.info("island_list");

		ArrayList<HashMap<String, Object>> iList = islandService.selectIslandList();

		// 사이즈 찍어보기
		System.out.println(iList.size());
		System.out.println(iList.get(0).toString()); // String key는 반드시 대문자로!

		model.addAttribute("iList", iList);

		return "island/island_list";
	}

	
	@RequestMapping(value = "/island/list", method = RequestMethod.GET)
	public String list(Model model) {
		logger.info("islandList");

		ArrayList<HashMap<String, Object>> iList = islandService.selectIslandList();

		// 사이즈 찍어보기
		System.out.println(iList.size());
		System.out.println(iList.get(0).toString()); // String key가 대문자임..

		model.addAttribute("iList", iList);

		return "island/list";
	}

//	@Autowired
//	private EmpService empService;
//	
//	@RequestMapping("/list")
//	public String emp(Model model) {
//		
//		System.out.println("emp");
//		
//		//ArrayList<EmpVO> empList = empService.selectAllEmpList();
//		
//		/*
//		 * ArrayList<HashMap<String,Object>> empList =
//		 * empServie.selectAllEmpListHashMap();
//		 * 
//		 * for (HashMap<String, Object> hashMap : empList) {
//		 * 
//		 * Iterator<String> keys = hashMap.keySet().iterator(); while( keys.hasNext() ){
//		 * String key = keys.next(); System.out.println( String.format("Ű : %s, �� : %s",
//		 * key, hashMap.get(key)) ); } }
//		 * 
//		 * 
//		 * System.out.println(empList.size());
//		 */
//		
//		DeptEmpVO deptEmpVO = empService.selectEmpDeptName(10);
//		 
//		model.addAttribute("deptEmpVO", deptEmpVO);
//		model.addAttribute("empList", deptEmpVO.getEmpList());
//		
//		System.out.println(deptEmpVO.getDeptno());
//		System.out.println(deptEmpVO.getEmpList().size()); 
//		
//		return "/list";
//	}

}
