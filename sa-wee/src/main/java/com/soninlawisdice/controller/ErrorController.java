package com.soninlawisdice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	
	
	@RequestMapping(value = "/404")
	public String error404() {
		// 404 에러 발생 시 처리할 내용이 있으면 처리를 시킴
		// => http://localhost:8282/error/404 를 치면 에러페이지로 이동
		// =>> 매핑에 따라서 return값으로 이동하는 것!
		
		System.out.println("------- 404 error --------");
		
		return "error/error_page";
	}
	
	/*
	 * @RequestMapping(value = "/500") public String error500() {
	 * 
	 * System.out.println("------- 500 error --------");
	 * 
	 * return "error/error_page"; }
	 */
	
	
}
