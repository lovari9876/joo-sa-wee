package edu.bit.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.bit.board.service.EmpService;
import edu.bit.board.vo.DeptEmpVO;

@Controller
@RequestMapping("/emp")
public class EmpController {
	
	@Autowired
	private EmpService empService;
	
	@RequestMapping("/list")
	public String emp(Model model) {
		
		System.out.println("emp");
		
		//ArrayList<EmpVO> empList = empService.selectAllEmpList();
		
		/*
		 * ArrayList<HashMap<String,Object>> empList =
		 * empServie.selectAllEmpListHashMap();
		 * 
		 * for (HashMap<String, Object> hashMap : empList) {
		 * 
		 * Iterator<String> keys = hashMap.keySet().iterator(); while( keys.hasNext() ){
		 * String key = keys.next(); System.out.println( String.format("Ű : %s, �� : %s",
		 * key, hashMap.get(key)) ); } }
		 * 
		 * 
		 * System.out.println(empList.size());
		 */
		
		DeptEmpVO deptEmpVO = empService.selectEmpDeptName(10);
		 
		model.addAttribute("deptEmpVO", deptEmpVO);
		model.addAttribute("empList", deptEmpVO.getEmpList());
		
		System.out.println(deptEmpVO.getDeptno());
		System.out.println(deptEmpVO.getEmpList().size()); 
		
		return "/list";
	}
	
	//로그?��?��
	@RequestMapping(value="/logout")
	public String login(HttpSession session) {
		
		System.out.println("login ?���?");
		
		session.invalidate();
		
		return "redirect:/";
	}

}
