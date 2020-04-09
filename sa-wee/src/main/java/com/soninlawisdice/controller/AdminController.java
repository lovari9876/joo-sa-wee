package com.soninlawisdice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soninlawisdice.controller.AdminController;
import com.soninlawisdice.service.AdminService;
import com.soninlawisdice.service.BoardService;
import com.soninlawisdice.service.ContentService;
import com.soninlawisdice.service.IslandService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.FaqVO;
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
	@Autowired
	private BoardService boardService;
	
	
	@RequestMapping("/index")
	public String index(Model model) {
		// 전체 글, 회원, 댓글 개수 (방문자수는 session으로 출력)
		model.addAttribute("count_board", adminService.allBoard());
		model.addAttribute("count_member", adminService.allMember());
		model.addAttribute("count_comment", adminService.allComment());

		return "admin/index";
	}

	@RequestMapping("/user_list")
	public String user_list() {

		return "admin/user_list";
	}

	////////////////////////////////////////////////////////////////////////////

	@RequestMapping("/report_view")
	public String report_view(ReportVO reportVO, Model model, @RequestParam String r_type) throws Exception {
		int id = reportVO.getR_no();
		String type = reportVO.getR_type();
		// type을 받아와 type에 따라 글 제목, 댓글 내용, 아이디를 각각 출력한다

		// ReportVO view = adminService.selectReportView(id, type);
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

	// 회원정보 수정
	@RequestMapping(value = "/updateMember", method = RequestMethod.POST)
	public String updateMember(MemberVO memberVO, @RequestParam int m_no, RedirectAttributes re) throws Exception {

//		String nick = memberVO.getM_nick();
//		System.out.println("updateMember()");
//		System.out.println(nick);

		adminService.updateMember(memberVO);

		re.addAttribute("m_no", m_no);

		return "redirect:user_view";

	}
	
	
	// 회원정보 수정 - 표류자인 회원 등급 복구하기 
		@RequestMapping(value = "/member_confirm", method = RequestMethod.POST)
		public String member_confirm(MemberVO memberVO, @RequestParam int m_no, RedirectAttributes re) throws Exception {

			int mem = memberVO.getM_no();
			int point = memberVO.getM_point();			
			System.out.println("복구할 회원 번호 : " + mem);
			System.out.println("복구할 회원 포인트 : " + point);
			
			adminService.confirmIsland_member(mem, point);
			

			re.addAttribute("m_no", m_no);

			return "redirect:user_view";

		}

	// 회원 탈퇴 : user_view
	@RequestMapping(value = "/outMember_user", method = RequestMethod.POST)
	public String outMember_user(MemberVO memberVO, @RequestParam int m_no, RedirectAttributes re) throws Exception {

		adminService.outMember(memberVO.getM_no());
		re.addAttribute("m_no", m_no);

		return "redirect:user_view";
	}

	// 회원 탈퇴 : report_view
	@RequestMapping(value = "/outMember_report", method = RequestMethod.POST)
	public String outMember_report(ReportVO reportVO, @RequestParam String r_no, @RequestParam String r_type,
			RedirectAttributes re) throws Exception {

		StringTokenizer st;
		st = new StringTokenizer(r_no);
		int r = Integer.parseInt(st.nextToken());
		System.out.println("r_no 신고번호 : " + r);
		int no = Integer.parseInt(st.nextToken());
		System.out.println("no 탈퇴할 회원번호 : " + no);
		adminService.outMember(no);

		re.addAttribute("r_no", r);
		re.addAttribute("r_type", r_type);

		return "redirect:report_view";
	}

	// 무인도행
	@ResponseBody
	@RequestMapping(value = "/updateIsland", method = RequestMethod.POST)
	public int updateIsland(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {

		int bt = 0;
		int no = 0;
		int mem = 0;
		int result = 0;// 나중에 로그인여부, 관리자인지 여부를 확인하기 위함 >> 지금은 테이블별로 다른 링크 걸기 위함

		StringTokenizer st;
		for (String i : chArr) {
			st = new StringTokenizer(i);
			bt = Integer.parseInt(st.nextToken());
			no = Integer.parseInt(st.nextToken());
			mem = Integer.parseInt(st.nextToken());

			if (1 <= bt && bt <= 6) { // bt_no이 1~6인 커뮤니티
				adminService.updateIsland_bw(no);
				result = 1;
			} else if (bt == 11) { // bt_no이 11인 카페리뷰
				adminService.updateIsland_cafe(no);
				result = 2;
			} else {// 중고거래는 bt 테이블과 조인하지않음
				adminService.updateIsland_trade(no);
				result = 3;
			}
		}
		System.out.println(bt);
		System.out.println("무인도행 갈 회원 : "+mem);
		adminService.updateIsland_memberReport(mem);

		return result;
	}
	
		// 무인도행 - 수정완료 컨펌
		@ResponseBody
		@RequestMapping(value = "/updateIsland_confirm", method = RequestMethod.POST)
		public int updateIsland_confirm(@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {

			int bt = 0;
			int no = 0;
			int mem = 0;
			int result = 0;// 나중에 로그인여부, 관리자인지 여부를 확인하기 위함 >> 지금은 테이블별로 다른 링크 걸기 위함

			StringTokenizer st;
			for (String i : chArr) {
				st = new StringTokenizer(i);
				bt = Integer.parseInt(st.nextToken());
				no = Integer.parseInt(st.nextToken());
				mem = Integer.parseInt(st.nextToken());

				if (1 <= bt && bt <= 6) { // bt_no이 1~6인 커뮤니티
					adminService.confirmIsland_bw(no);
				} else if (bt == 11) { // bt_no이 11인 카페리뷰
					adminService.confirmIsland_cafe(no);
				} else {// 중고거래는 bt 테이블과 조인하지않음
					adminService.confirmIsland_trade(no);
				}
			}
			result = 1;
			
			int point = adminService.memberPoint(mem);
			
			System.out.println("bt : " + bt);
			System.out.println("복구할 회원 : " + mem);
			System.out.println("복구할 회원 포인트 : " + point);
			adminService.confirmIsland_member(mem, point);

			return result;
		}

	
	
	//신고관리 : 무인도행 - 글
	@RequestMapping(value = "/island", method = RequestMethod.POST)
	public String island(@RequestParam String r_no, @RequestParam String r_type, RedirectAttributes re ) throws Exception {

		StringTokenizer st;
		st = new StringTokenizer(r_no);
		int r = Integer.parseInt(st.nextToken());
		System.out.println("r_no 신고번호 : " + r);
		int no = Integer.parseInt(st.nextToken());
		System.out.println("no 무인도행 보낼 글번호 : " + no);
		
		
		if(r_type.equals("게시글")){
			adminService.updateIsland_bw(no);
		}else if (r_type.equals("중고거래")) {
			adminService.updateIsland_trade(no);
		}else if (r_type.equals("카페리뷰")) {
			adminService.updateIsland_cafe(no);
		}
		
		System.out.println("========r_type : " + r_type);
		adminService.updateIsland_member(no, r_type);//해당 글을 쓴 멤버의 등급을 4로 만든다. 글 번호와 테이블 이름을 보내 처리 m_no을 구해 처리 
		
		re.addAttribute("r_no", r);
		re.addAttribute("r_type", r_type);
		
		return "redirect:report_view";
	}

	
	
		//신고관리 : 무인도행 - 회원
		@RequestMapping(value = "/m_island", method = RequestMethod.POST)
		public String m_island(@RequestParam String r_no, @RequestParam String r_type, RedirectAttributes re) throws Exception {
			System.out.println("==============m_island================");
			
			StringTokenizer st;
			st = new StringTokenizer(r_no);
			int r = Integer.parseInt(st.nextToken());
			System.out.println("r_no 신고번호 : " + r);
			int no = Integer.parseInt(st.nextToken());
			System.out.println("no 신고당한 회원번호 : " + no);
			
			
			adminService.updateIsland_memberReport(no);
			
			

			System.out.println("=========리다이렉트확인 : " + r);
			System.out.println("=========리다이렉트확인 : " + r_type);
			
			re.addAttribute("r_no", r);
			re.addAttribute("r_type", r_type);
			
			return "redirect:report_view";
		}
	
	
	
	
	
	
	
	
	////////////////////////////////////////////////////////////////////////////

	// 페이징 처리 된 목록
	@RequestMapping(value = "/report_list", method = RequestMethod.GET)
	public String report_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) throws Exception {

		scri.setPerPageNum(15);
		
		String r_type = rq.getParameter("r_type");
		
		model.addAttribute("report_list", adminService.reportList(scri, r_type));
		model.addAttribute("r_type", r_type);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.report_listCount(scri, r_type));

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
	public String board_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) throws Exception {

		scri.setPerPageNum(15);
		
		System.out.println("s_content: " + rq.getParameter("s_content"));
		String bt = rq.getParameter("bt_no");
		int bt_no;
		
		if (bt != null) {
			bt_no = Integer.parseInt(rq.getParameter("bt_no")); 
			System.out.println("===============bt_no" + bt_no);
		}else {
			bt_no = 13;
		}
		
		model.addAttribute("board_list", adminService.boardList(scri, bt_no, rq.getParameter("s_content")));
		
		model.addAttribute("s_content", rq.getParameter("s_content"));
		model.addAttribute("bt_no", rq.getParameter("bt_no"));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.board_listCount(scri, bt_no, rq.getParameter("s_content")));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/board_list";
	}

	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public String notice_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) {
		scri.setPerPageNum(15);
		
		//int s_no = Integer.parseInt(rq.getParameter("s_no"));
		model.addAttribute("notice_list", adminService.boardList(scri, 12, rq.getParameter("s_content"))); // 공지사항은 bt_no 12임..

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.board_listCount(scri, 12, rq.getParameter("s_content")));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/notice_list";
	}

	@RequestMapping(value = "/withdrawer_list", method = RequestMethod.GET)
	public String withdrawer_list(Model model, WD_recordVO wd_recordVO, @ModelAttribute("scri") SearchCriteria scri)
			throws Exception {

		// model.addAttribute("withdrawer_list", adminService.wd_recordList(scri));
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
	public String board_list_trade(Model model, @ModelAttribute("scri") SearchCriteria scri,
			/* @RequestParam(name="s_content", defaultValue = "n") String s_content, */ HttpServletRequest rq)
			throws Exception {
		// @RequestParam으로 받으면, 처음에 검색어 없이 /tlist로 갈때는 없는 파라미터 오류 발생

		String s_content = rq.getParameter("s_content");

		scri.setPerPageNum(15);
		model.addAttribute("board_list_trade", secondhandService.selectTradeList(scri, s_content));
		model.addAttribute("s_content", s_content);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(secondhandService.tradeListCount(scri, s_content));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/board_list_trade";
	}

	@RequestMapping(value = "/island_list", method = RequestMethod.GET)
	public String island_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) throws Exception {

		scri.setPerPageNum(15);
		
		System.out.println("s_content: " + rq.getParameter("s_content"));
		String b = rq.getParameter("bt_no");
		int bt_no;
		
		if (b != null) {
			bt_no = Integer.parseInt(rq.getParameter("bt_no")); 
			System.out.println("===============bt_no" + bt_no);
		}else {
			bt_no = 0;
		}
		
		
		model.addAttribute("island_list", islandService.selectIslandList(scri, bt_no));
		model.addAttribute("bt_no", bt_no);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(islandService.islandListCount(scri, bt_no));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/island_list";
	}

	@RequestMapping(value = "/cafe_list", method = RequestMethod.GET)
	public String cafe_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		scri.setPerPageNum(15);
		model.addAttribute("cafe_list", boardService.selectAllCafeList(scri));

		
		  PageMaker pageMaker = new PageMaker();
		  pageMaker.setCri(scri);
		  pageMaker.setTotalCount(boardService.cafe_listCount(scri));
		  
		  model.addAttribute("pageMaker", pageMaker);
		 
		return "admin/cafe_list";
	}

	@RequestMapping(value = "/faq_list", method = RequestMethod.GET)
	public String faq_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) {

		String temp = rq.getParameter("s_no");
		int s_no;
		if (temp != null) {
			s_no = Integer.parseInt(temp);
		}else {
			s_no=0;
		}
		
		model.addAttribute("faq_list", adminService.faqList(scri, s_no));
		model.addAttribute("s_no", s_no);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.faq_listCount(scri, s_no));

		model.addAttribute("pageMaker", pageMaker);
		return "admin/faq_list";
	}

	

	
	
	@RequestMapping("/ask_list")
	public String ask_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) {

		String s_content = rq.getParameter("s_content");
		//int s_no = Integer.parseInt(rq.getParameter("s_no"));
		
		model.addAttribute("ask_list", adminService.boardList(scri, 8, s_content));
		model.addAttribute("s_content", s_content);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.board_listCount(scri, 8, s_content));

		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/ask_list";
	}
	
	
	////////////////////////////////////////////////////////////////////////////

	//신고관리 : 댓글삭제 
	@RequestMapping(value = "/commentDelete", method = RequestMethod.POST)
	public String commentDelete(CM_commentVO cm_commentVO,  @RequestParam String r_no, @RequestParam String r_type, RedirectAttributes re) throws Exception {

		StringTokenizer st;
		st = new StringTokenizer(r_no);
		int r = Integer.parseInt(st.nextToken());
		System.out.println("r_no 신고번호 : " + r);
		int no = Integer.parseInt(st.nextToken());
		System.out.println("no 삭제할 댓글번호 : " + no);
		adminService.selectDelete_comment(no);
	
		re.addAttribute("r_no", r);
		re.addAttribute("r_type", r_type);
		
		return "redirect:report_view";
	}
	
	
	//신고관리 : 글삭제 
		@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
		public String boardDelete(Board_writeVO board_writeVO,  @RequestParam String r_no, @RequestParam String r_type, RedirectAttributes re) throws Exception {

			StringTokenizer st;
			st = new StringTokenizer(r_no);
			int r = Integer.parseInt(st.nextToken());
			System.out.println("r_no 신고번호 : " + r);
			int no = Integer.parseInt(st.nextToken());
			System.out.println("no 삭제할 글번호 : " + no);
			adminService.selectDelete(no);
		
			re.addAttribute("r_no", r);
			re.addAttribute("r_type", r_type);
			
			return "redirect:report_view";
		}
	
	
	// 선택한 글 삭제 ! ! json 객체로 변환해서 값을 보내야함, 안그러면 형변환 관련 오류뜸
	@ResponseBody
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.POST)
	public int deleteBoard(Board_writeVO boardVO, Cafe_reviewVO cafe_reviewVO, TradeVO tradeVO,
			@RequestParam(value = "chbox[]") List<String> chArr) throws Exception {

		int bt = 0;
		int no = 0;
		int result = 0;// 나중에 로그인여부, 관리자인지 여부를 확인하기 위함 >> 지금은 테이블별로 다른 링크 걸기 위함

		StringTokenizer st;

		// 매개변수로 member정보도 추가해야함,
		// if(member != null){
		// adminVO.setUserId(userId);//delete 삭제 구문에 id 값 확인하는 부분이 추가되어야함 (and userId
		// =#{})
		for (String i : chArr) {
			st = new StringTokenizer(i);
			bt = Integer.parseInt(st.nextToken());
			no = Integer.parseInt(st.nextToken());

			if (1 <= bt && bt <= 6) { // bt_no이 1~6인 커뮤니티
				boardVO.setBw_no(no);
				adminService.selectDelete(boardVO);
				result = 1;
			} else if (bt == 11) { // bt_no이 11인 카페리뷰
				cafe_reviewVO.setCr_no(no);
				adminService.selectDelete_cafe(cafe_reviewVO);
				result = 2;
			} else {// 중고거래는 bt 테이블과 조인하지않음
				tradeVO.setT_no(no);
				adminService.selectDelete_trade(tradeVO);
				result = 3;
			}
			
		}
		System.out.println(bt);

		// }
		return result;
	}

	////////////////////////////////////////////////////////////////////////////

	// 통계 : 카운트된 데이터 insert
	// @RequestMapping(value = "/statistic_count")
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

	// statistic_count() 하루에 한번 11시 59분에 실행
	@Scheduled(cron = "0 59 23 * * * ")
	public void testt() throws Exception {
		statistic_count();
	}

	////////////////////////////////////////////////////////////////////////////

	// 글쓰기 : 공지사항
	@RequestMapping(value = "/boardInsert", method = RequestMethod.POST)
	public String boardInsert(Board_writeVO board_writeVO) throws Exception {

		adminService.boardInsert(board_writeVO);

		return "redirect:notice_list";
	}

	// 글쓰기 : 보드게임카페 정보
	@RequestMapping(value = "/cafeInsert", method = RequestMethod.POST)
	public String cafeInsert(CafeVO cafeVO) throws Exception {

		adminService.cafeInsert(cafeVO);

		return "redirect:cafe_list";
	}

	// 글쓰기 : faq 자주하는 질문 
		@RequestMapping(value = "/faqInsert", method = RequestMethod.POST)
		public String faqInsert(FaqVO faqVO) throws Exception {

			adminService.faqInsert(faqVO);

			return "redirect:faq_list";
		}
	////////////////////////////////////////////////////////////////////////////

	@RequestMapping("/notice_write")
	public String notice_write() {

		return "admin/notice_write";
	}

	@RequestMapping("/notice_view")
	public String notice_view() {

		return "admin/notice_view";
	}

	

	@RequestMapping("/faq_write")
	public String faq_write() {

		return "admin/faq_write";
	}

	@RequestMapping("/cafe_list")
	public String cafe_list() {

		return "admin/cafe_list";
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
