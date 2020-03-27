package com.soninlawisdice.controller;

import java.util.ArrayList;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soninlawisdice.service.IslandService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.vo.IslandVO;
import com.soninlawisdice.vo.TradeVO;

@Controller
public class CassieController {

	private static final Logger logger = LoggerFactory.getLogger(CassieController.class);

	@Autowired
	private IslandService islandService;
	@Autowired
	private SecondhandService secondhandService;

	@RequestMapping(value = "/tlist", method = RequestMethod.GET)
	public String tlist(Model model) {
		logger.info("tlist");

		ArrayList<TradeVO> tList = secondhandService.selectTradeList();

		model.addAttribute("tList", tList);

		return "secondhand/tlist";
	}

	@RequestMapping(value = "/island_list", method = RequestMethod.GET)
	public String island_list(Model model) {
		logger.info("island_list");

		ArrayList<IslandVO> iList = islandService.getIslandList();

		// 사이즈 찍어보기
		System.out.println(iList.size());

		model.addAttribute("iList", iList);

		return "island/island_list";
	}

	@RequestMapping(value = "/island/list", method = RequestMethod.GET)
	public String list(Model model) {
		logger.info("islandList");

		ArrayList<IslandVO> iList = islandService.getIslandList();

		// 사이즈 찍어보기
		System.out.println(iList.size());

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
