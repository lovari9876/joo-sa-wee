package com.soninlawisdice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
