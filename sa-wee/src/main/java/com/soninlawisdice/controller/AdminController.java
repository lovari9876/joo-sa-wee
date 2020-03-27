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

import com.soninlawisdice.controller.AdminController;
import com.soninlawisdice.service.AdminService;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.PageMaker;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.WD_recordVO;


/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private AdminService adminService;

	@RequestMapping("/index")
	public String index() {

		return "admin/index";
	}

	@RequestMapping("/user_list")
	public String user_list() {

		return "admin/user_list";
	}

	
	/*
	 * @RequestMapping("/user_view") public String user_view() {
	 * 
	 * return "user_view"; }
	 */
	////////////////////////////////////////////////////////////////////////////


	@RequestMapping("/report_view")
	public String report_view(ReportVO reportVO, Model model) throws Exception {
		int id = reportVO.getR_no();
		String type = reportVO.getR_type(); 
		
		ReportVO view = adminService.selectReportView(id, type);
		model.addAttribute("report_view", view);

		return "admin/report_view";
	}
	
	
	@RequestMapping("/user_view")
	public String user_view(MemberVO memberVO, Model model) throws Exception {
		int id = memberVO.getM_no();
		MemberVO view = adminService.selectMemberView(id);
		model.addAttribute("user_view", view);

		return "admin/user_view";
	}
	
	
	////////////////////////////////////////////////////////////////////////////

	// 페이징 처리 된 목록
	@RequestMapping(value = "/report_list", method = RequestMethod.GET)
	public String report_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("report_list", adminService.reportList(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.report_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/report_list";
	}
	
	@RequestMapping(value = "/user_list", method = RequestMethod.GET)
	public String user_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("user_list", adminService.memberList(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.member_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/user_list";
	}
	
	
	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public String board_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		model.addAttribute("board_list", adminService.boardList(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.board_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/board_list";
	}
	
	
	@RequestMapping(value = "/withdrawer_list", method = RequestMethod.GET)
	public String withdrawer_list(Model model, WD_recordVO wd_recordVO, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		
		model.addAttribute("withdrawer_list", adminService.wd_recordList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.wd_record_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/withdrawer_list";
	}
	
	
	
	
	
	
	//선택한 글 삭제 ! !  json 객체로 변환해서 값을 보내야함, 안그러면 형변환 관련 오류뜸
	@ResponseBody
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.POST)
	public int deleteBoard(Board_writeVO boardVO, @RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		int bw_no = 0;
		int result = 0;//나중에 로그인여부, 관리자인지 여부를 확인하기 위함
		
		//매개변수로 member정보도 추가해야함, 
		//if(member != null){
		//	adminVO.setUserId(userId);//delete 삭제 구문에 id 값 확인하는 부분이 추가되어야함 (and userId =#{})
		for (String i : chArr) {
			bw_no = Integer.parseInt(i);
			boardVO.setBw_no(bw_no);
			adminService.selectDelete(boardVO);
		}
		result = 1; //성공!
		
		//}
		return result;
	}

	////////////////////////////////////////////////////////////////////////////

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

	@RequestMapping("/notice_view")
	public String notice_view() {

		return "admin/notice_view";
	}

	@RequestMapping("/faq")
	public String faq() {

		return "admin/faq";
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
	
	@RequestMapping("/island_list")
	public String island_list() {

		return "admin/island_list";
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

	@RequestMapping("/search")
	public String search() {

		return "admin/search";
	}

	@RequestMapping("/footer")
	public String footer() {

		return "admin/footer";
	}

}
