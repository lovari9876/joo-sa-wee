package com.soninlawisdice.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	/*
	 * @Autowired private AdminService adminService;
	 */
	@RequestMapping("/index")
	public String index() {

		return "admin/index";
	}

	
	@RequestMapping("/user_list")
	public String user_list() {

		return "admin/user_list";
	}

	////////////////////////////////////////////////////////////////////////////

	/*
	 * @RequestMapping("/report_list") public String report_list(Model model) throws
	 * Exception {
	 * 
	 * List<AdminVO> list = adminService.selectAdminList();
	 * model.addAttribute("report_list", list);
	 * 
	 * return "report_list"; }
	 * 
	 * @RequestMapping("/report_view") public String report_view(AdminVO adminVO,
	 * Model model) throws Exception { int id = adminVO.getSt_no(); AdminVO view =
	 * adminService.selectAdminView(id); model.addAttribute("report_view", view);
	 * 
	 * return "report_view"; }
	 * 
	 * ////////////////////////////////////////////////////////////////////////////
	 * 
	 * // 페이징처리
	 * 
	 * @RequestMapping(value = "/report_list2", method = RequestMethod.GET) public
	 * String report_list2(Model model, @ModelAttribute("scri") SearchCriteria scri)
	 * throws Exception {
	 * 
	 * model.addAttribute("report_list2", adminService.list(scri)); PageMaker
	 * pageMaker = new PageMaker(); pageMaker.setCri(scri);
	 * pageMaker.setTotalCount(adminService.listCount(scri));
	 * 
	 * model.addAttribute("pageMaker", pageMaker);
	 * 
	 * return "report_list2"; }
	 * 
	 * // 게시글 선택삭제
	 * 
	 * @RequestMapping(value = "/board_list2", method = RequestMethod.GET) public
	 * String board_list2(Model model, @ModelAttribute("scri") SearchCriteria scri)
	 * throws Exception {
	 * 
	 * model.addAttribute("board_list2", adminService.list(scri)); PageMaker
	 * pageMaker = new PageMaker(); pageMaker.setCri(scri);
	 * pageMaker.setTotalCount(adminService.listCount(scri));
	 * 
	 * model.addAttribute("pageMaker", pageMaker);
	 * 
	 * return "board_list2"; }
	 * 
	 * //json 객체로 변환해서 값을 보내야함, 안그러면 형변환 관련 오류뜸
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/deleteBoard", method = RequestMethod.POST) public
	 * int deleteBoard(AdminVO adminVO, @RequestParam(value = "chbox[]")
	 * List<String> chArr) throws Exception { int st_no = 0; int result = 0;//나중에
	 * 로그인여부, 관리자인지 여부를 확인하기 위함
	 * 
	 * //매개변수로 member정보도 추가해야함, //if(member != null){ //
	 * adminVO.setUserId(userId);//delete 삭제 구문에 id 값 확인하는 부분이 추가되어야함 (and userId
	 * =#{}) for (String i : chArr) { st_no = Integer.parseInt(i);
	 * adminVO.setSt_no(st_no); adminService.selectDelete(adminVO); } result = 1;
	 * //성공!
	 * 
	 * //} return result; }
	 */
	////////////////////////////////////////////////////////////////////////////

	
	@RequestMapping("/report_list")
	public String report_list() {

		return "admin/report_list";
	}
	
	
	
	
	
	
	// ajax
	@RequestMapping("/report_view2")
	public String report_view2() {

		return "admin/report_view2";
	}

	@RequestMapping("/notice_list")
	public String notice_list() {

		return "admin/notice_list";
	}

	@RequestMapping("/notice_write")
	public String notice_write() {

		return "admin/notice_write";
	}

	@RequestMapping("/board_list")
	public String board_list() {

		return "admin/board_list";
	}

	@RequestMapping("/notice_view")
	public String notice_view() {

		return "admin/notice_view";
	}

	@RequestMapping("/faq")
	public String faq() {

		return "faq";
	}

	@RequestMapping("/faq_list")
	public String faq_list() {

		return "admin/faq_list";
	}

	@RequestMapping("/faq_write")
	public String faq_write() {

		return "admin/faq_write";
	}

	@RequestMapping("/cafe_list")
	public String cafe_list() {

		return "admin/cafe_list";
	}

	@RequestMapping("/ask_list")
	public String ask_list() {

		return "admin/ask_list";
	}

	@RequestMapping("/cafe_write")
	public String cafe_write() {

		return "admin/cafe_write";
	}

	@RequestMapping("/cafe_view")
	public String cafe_view() {

		return "admin/cafe_view";
	}

	@RequestMapping("/game_list")
	public String game_list() {

		return "admin/game_list";
	}
	
	@RequestMapping("/withdrawer_list")
	public String withdrawer_list() {

		return "admin/withdrawer_list";
	}

	@RequestMapping("/game_write")
	public String game_write() {

		return "admin/game_write";
	}

	@RequestMapping("/sponsor_list")
	public String sponsor_list() {

		return "admin/sponsor_list";
	}

	@RequestMapping("/trade_list")
	public String trade_list() {

		return "admin/trade_list";
	}

	@RequestMapping("/chart")
	public String chart() {

		return "admin/chart";
	}

	@RequestMapping("/chart2")
	public String chart2() {

		return "admin/chart2";
	}

	@RequestMapping("/search")
	public String search() {

		return "search";
	}

	@RequestMapping("/footer")
	public String footer() {

		return "footer";
	}

}
