package com.soninlawisdice.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soninlawisdice.controller.AdminController;
import com.soninlawisdice.service.AdminService;
import com.soninlawisdice.service.IslandService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.PageMaker;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.SearchCriteria;
import com.soninlawisdice.vo.StatisticsVO;
import com.soninlawisdice.vo.TradeVO;
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
	@Autowired
	private IslandService islandService;
	@Autowired
	private SecondhandService secondhandService;
	
	
	

	@RequestMapping("/index")
	public String index() {

		return "admin/index";
	}

	@RequestMapping("/user_list")
	public String user_list() {

		return "admin/user_list";
	}

	////////////////////////////////////////////////////////////////////////////


	@RequestMapping("/report_view")
	public String report_view(ReportVO reportVO, Model model) throws Exception {
		int id = reportVO.getR_no();
		String type = reportVO.getR_type(); 
		//type을 받아와 type에 따라 글 제목, 댓글 내용, 아이디를 각각 출력한다 
		
		//ReportVO view = adminService.selectReportView(id, type);
		model.addAttribute("report_view", adminService.selectReportView(id, type));

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
	
	//회원정보 수정
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(MemberVO memberVO) throws Exception {

		String nick = memberVO.getM_nick();
		System.out.println("updateMember()");
		System.out.println(nick);
		 
		adminService.updateMember(memberVO);
		return "redirect:user_list";
	}
	

	//무인도행
	@ResponseBody
	@RequestMapping(value = "/updateIsland", method = RequestMethod.POST)
	public int updateIsland(Board_writeVO boardVO, MemberVO memberVO, Cafe_reviewVO cafe_reviewVO, TradeVO tradeVO, @RequestParam(value = "chbox[]") List<String> chArr) throws Exception {

		int bt = 0;
		int no = 0;
		int mem = 0;
		int result = 0;//나중에 로그인여부, 관리자인지 여부를 확인하기 위함 >> 지금은 테이블별로 다른 링크 걸기 위함
		

		StringTokenizer st;
		for (String i : chArr) {
			st = new StringTokenizer(i);
			bt = Integer.parseInt(st.nextToken());
			no = Integer.parseInt(st.nextToken());
			mem = Integer.parseInt(st.nextToken());
			
			if( 1<= bt && bt <= 6 ) { // bt_no이 1~6인 커뮤니티
				adminService.updateIsland_bw(no);
				result = 1;
			}else if(bt == 11) { //bt_no이 11인 카페리뷰
				adminService.updateIsland_cafe(no);
				result = 2;
			}else {//중고거래는 bt 테이블과 조인하지않음
				adminService.updateIsland_trade(no);
				result = 3;
			}
		}
		System.out.println(bt);
		adminService.updateIsland_member(mem);
		
		return result;
	}
	
	
	
	
	////////////////////////////////////////////////////////////////////////////

	// 페이징 처리 된 목록
	@RequestMapping(value = "/report_list", method = RequestMethod.GET)
	public String report_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		scri.setPerPageNum(15);
		model.addAttribute("report_list", adminService.reportList(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.report_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/report_list";
	}
	
	@RequestMapping(value = "/user_list", method = RequestMethod.GET)
	public String user_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		scri.setPerPageNum(15);
		model.addAttribute("user_list", adminService.memberList(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.member_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/user_list";
	}
	
	
	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public String board_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {


		scri.setPerPageNum(15);
		model.addAttribute("board_list", adminService.boardList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.board_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/board_list";
	}
	
	
	@RequestMapping(value = "/withdrawer_list", method = RequestMethod.GET)
	public String withdrawer_list(Model model, WD_recordVO wd_recordVO, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		
		//model.addAttribute("withdrawer_list", adminService.wd_recordList(scri));
		model.addAttribute("withdrawer_list", adminService.wd_recordList(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.wd_record_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/withdrawer_list";
	}
	
	
	@RequestMapping(value = "/board_list_cafe", method = RequestMethod.GET)
	public String board_list_cafe(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		scri.setPerPageNum(15);
		model.addAttribute("board_list_cafe", adminService.cafe_reviewList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.cafe_review_listCount(scri));
		

		model.addAttribute("pageMaker", pageMaker);

		return "admin/board_list_cafe";
	}
	
	
	@RequestMapping(value = "/board_list_trade", method = RequestMethod.GET)
	public String board_list_trade(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		scri.setPerPageNum(15);
		model.addAttribute("board_list_trade", secondhandService.selectTradeList(scri, null));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(secondhandService.tradeListCount(scri, null));
	
		
		model.addAttribute("pageMaker", pageMaker );
		
		return "admin/board_list_trade";
	}
	


	@RequestMapping(value = "/island_list", method = RequestMethod.GET)
	public String island_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		scri.setPerPageNum(15);
		model.addAttribute("island_list", islandService.selectIslandList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(islandService.islandListCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);

		return "admin/island_list";
	}
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////
	
	
	
	
	//선택한 글 삭제 ! !  json 객체로 변환해서 값을 보내야함, 안그러면 형변환 관련 오류뜸
	@ResponseBody
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.POST)
	public int deleteBoard(Board_writeVO boardVO, Cafe_reviewVO cafe_reviewVO, TradeVO tradeVO, @RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
		
		int bt = 0;
		int no=0;
		int result = 0;//나중에 로그인여부, 관리자인지 여부를 확인하기 위함 >> 지금은 테이블별로 다른 링크 걸기 위함
		
		StringTokenizer st;

		//매개변수로 member정보도 추가해야함, 
		//if(member != null){
		//	adminVO.setUserId(userId);//delete 삭제 구문에 id 값 확인하는 부분이 추가되어야함 (and userId =#{})
		for (String i : chArr) {
			st = new StringTokenizer(i);
			bt = Integer.parseInt(st.nextToken());
			no = Integer.parseInt(st.nextToken());
			
			if( 1<= bt && bt <= 6 ) { // bt_no이 1~6인 커뮤니티
			
				boardVO.setBw_no(no);
				adminService.selectDelete(boardVO);
				result = 1;
			}else if(bt == 11) { //bt_no이 11인 카페리뷰
				cafe_reviewVO.setCr_no(no);
				adminService.selectDelete_cafe(cafe_reviewVO);
				result = 2;
			}else {//중고거래는 bt 테이블과 조인하지않음
				tradeVO.setT_no(no);
				adminService.selectDelete_trade(tradeVO);
				result = 3;
			}
		}
		System.out.println(bt);
		
		//}
		return result;
	}
	
	

	////////////////////////////////////////////////////////////////////////////

	//통계 : 카운트된 데이터 insert
	//@RequestMapping(value = "/statistic_count")
	public String statistic_count() throws Exception {
		
		System.out.println("statistic_count()");
		 
		int board = adminService.getTodayBoard();
		int comment = adminService.getTodayComment();
		int trade = adminService.getTodayTrade();
		int visit = adminService.getTodayCount();
		
		System.out.println("getTodayBoard : " + board);
		System.out.println("getTodayComment : " + comment);
		System.out.println("getTodayTrade : " + trade);
		System.out.println("getTodayCount : " + visit);
		
		StatisticsVO statVO = new StatisticsVO();
		statVO.setSt_post_num(board);
		statVO.setSt_comment_num(comment);
		statVO.setSt_trade_num(trade);
		statVO.setSt_visitor_num(visit);
		
		adminService.statisticsInsert(statVO);

		return "redirect:index";
	}
	
	//statistic_count() 하루에 한번 11시 59분에 실행 
	@Scheduled(cron="0 59 23 * * * ")	
	public void testt() throws Exception {
		statistic_count();
	}
	
	
	////////////////////////////////////////////////////////////////////////////
	

	
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

		return "faq/faq";
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

	@RequestMapping("/search")
	public String search() {

		return "admin/search";
	}

	@RequestMapping("/footer")
	public String footer() {

		return "admin/footer";
	}

}
