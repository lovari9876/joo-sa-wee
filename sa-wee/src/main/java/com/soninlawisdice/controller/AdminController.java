package com.soninlawisdice.controller;

import java.security.Principal;
import java.util.List;
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
import com.soninlawisdice.service.MyPageService;
import com.soninlawisdice.service.SecondhandService;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.CafeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.FaqVO;
import com.soninlawisdice.vo.GameVO;
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
	@Autowired
	private ContentService contentService;
	@Autowired
	private MyPageService myPageService;

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

	// 스크랩기능
	@ResponseBody
	@RequestMapping(value = "/scrap", method = RequestMethod.POST)
	public int scrap(@RequestParam(value = "scrapArr[]") List<String> scrapArr, Principal principal, MemberVO memberVO)
			throws Exception {

		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);

		int m_no = memberVO.getM_no();

		System.out.println("m_no : " + m_no);

		String type_name = scrapArr.get(0);
		int num = Integer.parseInt(scrapArr.get(1));

		System.out.println("type_name : " + type_name);
		System.out.println("num : " + num);

		int result = 0;

		int overlap = adminService.scrapSelect(m_no, type_name, num); 
		// 중복값이 존재하는지 확인 0이면 존재하지 않는것, 1 이상이면 존재하는것

		if (overlap >= 1) {
			result = 0;
		} else {
			adminService.scrapInsert(m_no, type_name, num);
			result = 1;
		}
		return result;
	}

	// 스크랩 삭제 기능
	@ResponseBody
	@RequestMapping(value = "/scrapDelete", method = RequestMethod.POST)
	public int scrapDelete(@RequestParam(value = "scrapArr[]") List<String> scrapArr, Principal principal,
			MemberVO memberVO) throws Exception {

		String m_id = principal.getName();
		memberVO = myPageService.mypage(m_id);
		int m_no = memberVO.getM_no();
		System.out.println("m_no : " + m_no);

		String type_name = scrapArr.get(0);
		int num = Integer.parseInt(scrapArr.get(1));

		System.out.println("type_name : " + type_name);
		System.out.println("num : " + num);

		int result = 0;

		adminService.scrapDelete(m_no, type_name, num);

		return result;
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

	// 무인도행
	@ResponseBody
	@RequestMapping(value = "/updateIsland", method = RequestMethod.POST)
	public int updateIsland(@RequestParam(value = "chbox[]") List<String> chArr, MemberVO memberVO) throws Exception {

		int bt = 0;
		int no = 0;
		int mem = 0;
		int result = 0; // 테이블별로 다른 링크 걸기 위함

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
		System.out.println("무인도행 갈 회원 : " + mem);
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

	// 신고관리 : 회원 탈퇴
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

	// 신고관리 : 무인도행 - 글
	@RequestMapping(value = "/island", method = RequestMethod.POST)
	public String island(@RequestParam String r_no, @RequestParam String r_type, RedirectAttributes re)
			throws Exception {

		StringTokenizer st;
		st = new StringTokenizer(r_no);
		int r = Integer.parseInt(st.nextToken());
		System.out.println("r_no 신고번호 : " + r);
		int no = Integer.parseInt(st.nextToken());
		System.out.println("no 무인도행 보낼 글번호 : " + no);

		if (r_type.equals("게시글")) {
			adminService.updateIsland_bw(no);
		} else if (r_type.equals("중고거래")) {
			adminService.updateIsland_trade(no);
		} else if (r_type.equals("카페리뷰")) {
			adminService.updateIsland_cafe(no);
		}

		adminService.updateIsland_member(no, r_type);// 해당 글을 쓴 멤버의 등급을 4로 만든다. 글 번호와 테이블 이름을 보내 처리 m_no을 구해 처리

		re.addAttribute("r_no", r);
		re.addAttribute("r_type", r_type);

		return "redirect:report_view";
	}

	// 신고관리 : 무인도행 - 회원
	@RequestMapping(value = "/m_island", method = RequestMethod.POST)
	public String m_island(@RequestParam String r_no, @RequestParam String r_type, RedirectAttributes re)
			throws Exception {

		StringTokenizer st;
		st = new StringTokenizer(r_no);
		int r = Integer.parseInt(st.nextToken());
		System.out.println("r_no 신고번호 : " + r);
		int no = Integer.parseInt(st.nextToken());
		System.out.println("no 신고당한 회원번호 : " + no);

		adminService.updateIsland_memberReport(no);

		re.addAttribute("r_no", r);
		re.addAttribute("r_type", r_type);

		return "redirect:report_view";
	}

	// 신고관리 : 댓글삭제
	@RequestMapping(value = "/commentDelete", method = RequestMethod.POST)
	public String commentDelete(CM_commentVO cm_commentVO, @RequestParam String r_no, @RequestParam String r_type,
			RedirectAttributes re) throws Exception {

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

	// 신고관리 : 글삭제
	@RequestMapping(value = "/boardDelete/{table}")
	public String boardDelete(@PathVariable("table") String table, Board_writeVO board_writeVO,
			@RequestParam String r_no, @RequestParam String r_type, RedirectAttributes re) throws Exception {

		StringTokenizer st;
		st = new StringTokenizer(r_no);
		int r = Integer.parseInt(st.nextToken());
		System.out.println("r_no 신고번호 : " + r);
		int no = Integer.parseInt(st.nextToken());
		System.out.println("no 삭제할 글번호 : " + no);

		if (table.equals("board")) {
			adminService.selectDelete(no);
		} else if (table.equals("trade")) {
			// adminService.selectDelete_trade(no);
			System.out.println("trade 삭제 ");
			secondhandService.deleteContent(no);
		} else if (table.equals("cafe")) {
			System.out.println("cafe 삭제 ");
			adminService.selectDelete_cafe(no);
		}

		re.addAttribute("r_no", r);
		re.addAttribute("r_type", r_type);

		return "redirect:/admin/report_view";
	}

	////////////////////////////////////////////////////////////////////////////

	// 페이징 처리 된 목록
	@RequestMapping(value = "/report_list", method = RequestMethod.GET)
	public String report_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq)
			throws Exception {

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
	public String user_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq)
			throws Exception {

		scri.setPerPageNum(15);

		// 정렬을 하기 위한 임의의 값 sort를 지정
		String sort = rq.getParameter("sort");
		System.out.println("sort : " + sort);

		model.addAttribute("user_list", adminService.memberList(scri, sort));
		model.addAttribute("sort", sort);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.member_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/user_list";
	}

	@RequestMapping(value = "/board_list", method = RequestMethod.GET)
	public String board_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq)
			throws Exception {

		scri.setPerPageNum(15);

		String s_content = rq.getParameter("s_content"); // 말머리
		String sort = rq.getParameter("sort");
		String bt = rq.getParameter("bt_no"); // board_type 번호 (카테고리) >> int변환

		int bt_no;

		if (bt != null) {
			bt_no = Integer.parseInt(rq.getParameter("bt_no"));
			System.out.println("bt_no : " + bt_no);
		} else {
			bt_no = 13;
		}

		model.addAttribute("board_list", adminService.boardList(scri, bt_no, s_content, sort));

		// select box, 검색내용 등등 링크로 넘기기 위해서
		model.addAttribute("s_content", s_content);
		model.addAttribute("bt_no", bt_no);
		model.addAttribute("sort", sort);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.board_listCount(scri, bt_no, s_content));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/board_list";
	}

	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public String notice_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) {
		scri.setPerPageNum(15);

		String s_content = rq.getParameter("s_content");
		String sort = rq.getParameter("sort");

		model.addAttribute("notice_list", adminService.boardList(scri, 12, s_content, sort)); // 공지사항은 bt_no 12임..

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.board_listCount(scri, 12, s_content));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/notice_list";
	}

	// 글보기 : 공지사항
	@RequestMapping("/notice_view")
	public String notice_view(Board_writeVO board_writeVO, Model model, @RequestParam("bw_no") int bw_no)
			throws Exception {

		model.addAttribute("content_view", contentService.selectContentOne(bw_no));

		return "admin/notice_view";
	}

	// notice 수정화면
	@RequestMapping("/notice_modify")
	public String notice_modify(Model model, @RequestParam("bw_no") int bw_no) {

		model.addAttribute("notice", contentService.selectContentOne(bw_no));

		return "admin/notice_modify";
	}

	// notice 수정
	@RequestMapping(value = "/updateNotice", method = RequestMethod.POST)
	public String updateNotice(Board_writeVO board_writeVO, @RequestParam("bw_no") int bw_no, RedirectAttributes re)
			throws Exception {

		adminService.updateNotice(board_writeVO);

		re.addAttribute("bw_no", bw_no);

		return "redirect:notice_view";

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
	
	
	@RequestMapping(value = "/sponsor_list", method = RequestMethod.GET)
	public String sponsor_list(Model model, @ModelAttribute("scri") SearchCriteria scri)
			throws Exception {
		
		scri.setPerPageNum(15);
		model.addAttribute("sponsor_list", adminService.sponsorList(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.sponsorListCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/sponsor_list";
	}
	
	
	
	@RequestMapping(value = "/comment_list", method = RequestMethod.GET)
	public String comment_list(Model model, @ModelAttribute("scri") SearchCriteria scri)
			throws Exception {
		
		scri.setPerPageNum(15);
		model.addAttribute("comment_list", adminService.commentList(scri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.commentListCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/comment_list";
	}
	
	
	

	@RequestMapping(value = "/board_list_cafe", method = RequestMethod.GET)
	public String board_list_cafe(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq)
			throws Exception {

		scri.setPerPageNum(15);
		String sort = rq.getParameter("sort");

		model.addAttribute("board_list_cafe", adminService.cafe_reviewList(scri, sort));
		model.addAttribute("sort", sort);

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
		String sort = rq.getParameter("sort");

		scri.setPerPageNum(15);
		model.addAttribute("board_list_trade", secondhandService.selectTradeList(scri, s_content, sort));
		model.addAttribute("s_content", s_content);
		model.addAttribute("sort", sort);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(secondhandService.tradeListCount(scri, s_content));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/board_list_trade";
	}

	@RequestMapping(value = "/island_list", method = RequestMethod.GET)
	public String island_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq)
			throws Exception {

		scri.setPerPageNum(15);

		System.out.println("s_content: " + rq.getParameter("s_content"));
		String b = rq.getParameter("bt_no");
		int bt_no;

		if (b != null) {
			bt_no = Integer.parseInt(rq.getParameter("bt_no"));
			System.out.println("===============bt_no" + bt_no);
		} else {
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

	@RequestMapping("/trade_list")
	public String trade_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		scri.setPerPageNum(15);

		model.addAttribute("trade_list", adminService.tradeList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.tradeListCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "admin/trade_list";
	}

	@RequestMapping("/trade_list_pgt/{p_no}")
	public String trade_list_pgt(Model model, @PathVariable(value = "p_no") int p_no) throws Exception {

		model.addAttribute("pgt", secondhandService.selectPTGList(p_no));
		model.addAttribute("p_price", adminService.selectTrade(p_no));

		return "admin/trade_list_pgt";
	}

	@RequestMapping("/trade_list_account/{p_no}/{p_sno}/{p_bno}")
	public String trade_list_account(Model model, @PathVariable(value = "p_no") int p_no,
			@PathVariable(value = "p_sno") int p_sno,
			@PathVariable(value = "p_bno") int p_bno) throws Exception {
		
		model.addAttribute("p_no", p_no);
		model.addAttribute("account_s", adminService.selectMemberView(p_sno));
		model.addAttribute("account_b", adminService.selectMemberView(p_bno));

		return "admin/trade_list_account";
	}
	
	@RequestMapping("/trade_list_refund/{p_no}")
	public String trade_list_refund(Model model, @PathVariable(value = "p_no") int p_no) throws Exception {

		secondhandService.paymentBuyerRefund(p_no);

		return "redirect:/admin/trade_list";
	}
	
	@RequestMapping("/trade_list_remit/{p_no}")
	public String trade_list_remit(Model model, @PathVariable(value = "p_no") int p_no) throws Exception {

		secondhandService.paymentBuyerRemit(p_no);

		return "redirect:/admin/trade_list";
	}

	//////////////////////////// cafe_list///////////////////////////////////////

	@RequestMapping(value = "/cafe_list", method = RequestMethod.GET)
	public String cafe_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq)
			throws Exception {

		scri.setPerPageNum(15);
		String add = rq.getParameter("add");
		model.addAttribute("cafe_list", boardService.selectAllCafeList(scri, add));
		model.addAttribute("add", add);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.cafe_listCount(scri, add));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/cafe_list";
	}

	// cafe 수정화면
	@RequestMapping("/cafe_modify")
	public String cafe_modify(Model model, int c_no) {

		model.addAttribute("cafe_info", boardService.selectCafeInfo(c_no));

		return "admin/cafe_modify";
	}

	// cafe 수정
	@RequestMapping(value = "/updateCafe", method = RequestMethod.POST)
	public String updateCafe(CafeVO cafeVO, @RequestParam int c_no, RedirectAttributes re) throws Exception {

		adminService.updateCafe(cafeVO);

		re.addAttribute("c_no", c_no);

		return "redirect:/cafe_info";

	}

	// cafe 정보글 삭제
	@RequestMapping(value = "/deleteCafe/{c_no}", method = RequestMethod.GET)
	public String deleteCafe(@PathVariable("c_no") int c_no) throws Exception {

		adminService.cafeInfoDelete(c_no);

		return "redirect:/cafe_list";

	}

	//////////////////////////// game_list///////////////////////////////////////

	@RequestMapping("/game_list")
	public String game_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) {

		scri.setPerPageNum(15);
		String init = rq.getParameter("init");

		model.addAttribute("game_list", contentService.selectGameList(scri, init));
		model.addAttribute("init", init);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(contentService.game_listCount(scri, init));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/game_list";
	}

	// game 보드게임정보 수정화면
	@RequestMapping("/game_modify")
	public String game_modify(Model model, int g_no) {

		model.addAttribute("game_info", contentService.selectGameDetailOne(g_no));

		return "admin/game_modify";
	}

	// game 보드게임정보 수정
	@RequestMapping(value = "/updateGame", method = RequestMethod.POST)
	public String updateGame(GameVO gameVO, @RequestParam int g_no, RedirectAttributes re) throws Exception {

		adminService.updateGame(gameVO);

		re.addAttribute("g_no", g_no);

		return "redirect:/game_detail";

	}

	//////////////////////////// faq_list///////////////////////////////////////

	@RequestMapping(value = "/faq_list", method = RequestMethod.GET)
	public String faq_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) {

		scri.setPerPageNum(15);
		String temp = rq.getParameter("s_no");
		int s_no;
		if (temp != null) {
			s_no = Integer.parseInt(temp);
		} else {
			s_no = 0;
		}

		model.addAttribute("faq_list", adminService.faqList(scri, s_no));
		model.addAttribute("s_no", s_no);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.faq_listCount(scri, s_no));

		model.addAttribute("pageMaker", pageMaker);
		return "admin/faq_list";
	}

	@RequestMapping("/faq_view")
	public String faq_view(Model model, FaqVO faqVO) {
		int faq_no = faqVO.getFaq_no();
		System.out.println("faq_no : " + faq_no);

		model.addAttribute("faq_view", adminService.faqView(faq_no));
		return "admin/faq_view";
	}

	// faq 수정화면
	@RequestMapping("/faq_modify")
	public String faq_modify(Model model, FaqVO faqVO) {

		model.addAttribute("faq", adminService.faqView(faqVO.getFaq_no()));

		return "admin/faq_modify";
	}

	// faq 수정
	@RequestMapping(value = "/updateFaq", method = RequestMethod.POST)
	public String updateFaq(FaqVO faqVO, @RequestParam int faq_no, RedirectAttributes re) throws Exception {

		adminService.updateFaq(faqVO);

		re.addAttribute("faq_no", faq_no);

		return "redirect:faq_view";

	}

	// faq 삭제
	@RequestMapping(value = "/faqDelete", method = RequestMethod.POST)
	public String faqDelete(FaqVO faqVO) throws Exception {

		System.out.println("------------delete");
		System.out.println("faq_no : " + faqVO.getFaq_no());
		adminService.faqDelete(faqVO.getFaq_no());

		return "redirect:faq_list";
	}

	// notice 삭제
	@RequestMapping(value = "/notice_delete", method = RequestMethod.POST)
	public String notice_delete(Board_writeVO board_writeVO) throws Exception {

		System.out.println("------------delete");
		adminService.selectDelete(board_writeVO);

		return "redirect:notice_list";
	}

	@RequestMapping("/ask_list")
	public String ask_list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpServletRequest rq) {

		scri.setPerPageNum(15);

		String s_content = rq.getParameter("s_content");
		String sort = rq.getParameter("sort");

		model.addAttribute("ask_list", adminService.boardList(scri, 8, s_content, sort));
		model.addAttribute("s_content", s_content);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.board_listCount(scri, 8, s_content));

		model.addAttribute("pageMaker", pageMaker);

		return "admin/ask_list";
	}

	////////////////////////////////////////////////////////////////////////////

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
				/* boardVO.setBt_no(no); */
				adminService.selectDelete(no);
				result = 1;
			} else if (bt == 11) { // bt_no이 11인 카페리뷰
				/* cafe_reviewVO.setCr_no(no); */
				adminService.selectDelete_cafe(no);
				result = 2;
			} else {// 중고거래는 bt 테이블과 조인하지않음
				/* System.out.println("trade 삭제 "); */
				secondhandService.deleteContent(no);
				result = 3;
			}

		}
		System.out.println(bt);

		// }
		return result;
	}
	
	
	
	// 선택한 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	public int deleteComment(CM_commentVO cm_commentVO, @RequestParam(value = "chbox[]") List<String> chArr) throws Exception {

		int cm_no = 0;
		int result = 0;

		for (String i : chArr) {
			cm_no = Integer.parseInt(i);
			adminService.selectDelete_comment(cm_no);
		}
		System.out.println("=======================deleteComment");
		
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

	// statistic_count() 하루에 한번 11시 59분에 실행 //
	@Scheduled(cron = "0 59 23 * * * ")
	public void count_insert() throws Exception {
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

	@RequestMapping("/chart_visitor")
	public String chart_visitor() {

		return "admin/chart_visitor";
	}

	@RequestMapping("/chart_post")
	public String chart_post() {

		return "admin/chart_post";
	}

	@RequestMapping("/chart_comment")
	public String chart_comment() {

		return "admin/chart_comment";
	}

	@RequestMapping("/chart_trade")
	public String chart_trade() {

		return "admin/chart_trade";
	}

	////////////////////////////////////////////////////////////////////////////

	@RequestMapping("/notice_write")
	public String notice_write() {

		return "admin/notice_write";
	}

	@RequestMapping("/faq_write")
	public String faq_write() {

		return "admin/faq_write";
	}

	@RequestMapping("/cafe_write")
	public String cafe_write() {

		return "admin/cafe_write";
	}

	@RequestMapping("/cafe_view")
	public String cafe_view() {

		return "admin/cafe_view";
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

	@RequestMapping("/footer")
	public String footer() {

		return "admin/footer";
	}

}
