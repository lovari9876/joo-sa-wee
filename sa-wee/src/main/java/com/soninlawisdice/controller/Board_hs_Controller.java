package com.soninlawisdice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soninlawisdice.service.AdminService;
import com.soninlawisdice.service.BoardService;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.PageMaker;
import com.soninlawisdice.vo.SearchCriteria;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Board_hs_Controller {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(Board_hs_Controller.class);

	// 베스트 + 핫이슈 + 홈화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		model.addAttribute("hit", boardService.selectHitList());
		model.addAttribute("best", boardService.selectBestList());

		return "board_hs/index";
	}

	///////////////////////////////////// 커뮤니티 관련//////////////////////////////////////

		// 리스트 홈화면
		@RequestMapping(value = "/list_home", method = RequestMethod.GET)
		public String list_home(Model model) {
			return "board_hs/list_home";
		}

		// 보드이야기 리스트
		@RequestMapping(value = "/board_story", method = RequestMethod.GET)
		public String board_story(Model model, @ModelAttribute("scri") SearchCriteria scri)  throws Exception{
			
			model.addAttribute("list", boardService.selectBoardList(scri, 1));
			
			PageMaker pageMaker  = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(boardService.cboard_listCount(scri, 1));
			model.addAttribute("pageMaker", pageMaker);
			
			return "board_hs/board_story";
		}
	
		//개봉기 및 리뷰
		@RequestMapping(value = "/board_open_review", method = RequestMethod.GET)
		public String board_open_review(Model model, @ModelAttribute("scri") SearchCriteria scri)  throws Exception{
			
			model.addAttribute("list", boardService.selectBoardList(scri, 2));
			
			PageMaker pageMaker  = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(boardService.cboard_listCount(scri, 2));
			model.addAttribute("pageMaker", pageMaker);
			
			return "board_hs/board_open_review";
		}
		
		//보드게임 모임
		@RequestMapping(value = "/board_meet", method = RequestMethod.GET)
		public String board_meet(Model model, @ModelAttribute("scri") SearchCriteria scri)  throws Exception{
			
			model.addAttribute("list", boardService.selectBoardList(scri, 3));
			
			PageMaker pageMaker  = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(boardService.cboard_listCount(scri, 3));
			model.addAttribute("pageMaker", pageMaker);
			
			return "board_hs/board_meet";
		}
		
		//보드 뉴스
		@RequestMapping(value = "/board_news", method = RequestMethod.GET)
		public String board_news(Model model, @ModelAttribute("scri") SearchCriteria scri)  throws Exception{
			
			model.addAttribute("list", boardService.selectBoardList(scri, 4));
			
			PageMaker pageMaker  = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(boardService.cboard_listCount(scri, 4));
			model.addAttribute("pageMaker", pageMaker);
			
			return "board_hs/board_news";
		}
		
		//질문 답변
		@RequestMapping(value = "/board_qna", method = RequestMethod.GET)
		public String board_qna(Model model, @ModelAttribute("scri") SearchCriteria scri)  throws Exception{
			
			model.addAttribute("list", boardService.selectBoardList(scri, 5));
			
			PageMaker pageMaker  = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(boardService.cboard_listCount(scri, 5));
			model.addAttribute("pageMaker", pageMaker);
			
			return "board_hs/board_qna";
		}
		
		//창작 보드게임
		@RequestMapping(value = "/board_creation", method = RequestMethod.GET)
		public String board_creation(Model model, @ModelAttribute("scri") SearchCriteria scri)  throws Exception{
			
			model.addAttribute("list", boardService.selectBoardList(scri, 6));
			
			PageMaker pageMaker  = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(boardService.cboard_listCount(scri, 6));
			model.addAttribute("pageMaker", pageMaker);
			
			return "board_hs/board_creation";
		}
		
	
	
	

	

	// 말머리마다 다른 내용 보여주기
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/board_list_sub") public ArrayList<HashMap<String, Object>>
	 * list(Model model) { System.out.println("test");
	 * 
	 * return boardService.selectBoardList(); }
	 */
	
	/*
	 * @RequestMapping("/board_sub") public String board_sub(Model model, int s_no){
	 * 
	 * model.addAttribute("sub_list", boardService.selectBoardSub(s_no));
	 * 
	 * 
	 * 
	 * return "board_hs/board_story";
	 * 
	 * }
	 */

	// 글쓰기 view
	@RequestMapping(value = "/board_write_view", method = RequestMethod.GET)
	public String write_view(Model model, String bt_no) {
		logger.info("home");

		model.addAttribute("bt_no", bt_no);
		
		return "board_hs/write_view";
	}

	// 글 작성
	@RequestMapping(value = "/board_write", method = RequestMethod.POST)
	public String write(Board_writeVO board_writeVO) {
		boardService.insertBoard(board_writeVO);

		int bt_no = board_writeVO.getBt_no();
		int m_no = board_writeVO.getM_no();

		System.out.println(bt_no);
		System.out.println(m_no);

		boardService.boardPointUpdate(m_no);
		
		if (bt_no == 1) {
			return "redirect:board_story";
		} else if (bt_no == 2) {
			return "redirect:board_open_review";
		} else if (bt_no == 3) {
			return "redirect:board_meet";
		} else if (bt_no == 4) {
			return "redirect:board_news";
		} else if (bt_no == 5) {
			return "redirect:board_qna";
		} else if(bt_no == 6){
			return "redirect:board_creation";
		}
		
		return null;

	}

	// 수정하기 view.
	@RequestMapping(value = "/board_modify_view", method = RequestMethod.GET)
	public String modify_view(Model model, int bw_no) {
		
		model.addAttribute("content_view", boardService.modify_view(bw_no));

		
		return "board_hs/modify_view";
	}
	
	
	//수정하기
	//수정했을때 수정된 content 보기
	@RequestMapping(value = "/board_modify", method = RequestMethod.POST)
	public String modify(Board_writeVO board_writeVO, Model model) {
		boardService.modify(board_writeVO);
		int bw_no = board_writeVO.getBw_no();
		
		return "redirect:content_view?bw_no"+bw_no;
	}
	
	/* 수정했을때 각각 게시판으로 가기
	@RequestMapping(value = "/board_modify", method = RequestMethod.POST)
	public String modify(Board_writeVO board_writeVO, Model model) {

		System.out.println("modify()");

		boardService.modify(board_writeVO);
		
		int bt_no = board_writeVO.getBt_no();
		
		if (bt_no == 1) {
			return "redirect:board_story";
		} else if (bt_no == 2) {
			return "redirect:board_open_review";
		} else if (bt_no == 3) {
			return "redirect:board_meet";
		} else if (bt_no == 4) {
			return "redirect:board_news";
		} else if (bt_no == 5) {
			return "redirect:board_qna";
		} else if(bt_no == 6){
			return "redirect:board_creation";
		}
		return null;
	}
	*/

	///////////////////////////////////////// 카페리뷰, 카페정보 관련/////////////////////////////////////

	
	// 지도
	@RequestMapping(value = "/cafe_map", method = RequestMethod.GET)
	public String cafe_map(Model model) {
		return "board_hs/cafe_map";
	}
		
	// 마커 클릭시 카페 상세정보(cafe_info)로 이동. 
	@RequestMapping(value = "/cafe_info", method = RequestMethod.GET)
	public String cafe_content_view(Model model, int c_no) {

		// 카페 정보 가져오기
		model.addAttribute("cafe_info", boardService.selectCafeInfo(c_no));
		// 댓글 불러오는것도 추가해야함

		// 밑에 관련 리스트 가져오기
		model.addAttribute("list", boardService.selectCafeReviewList(c_no));

		return "board_hs/cafe_info";
	}
	
	//카페목록 싹다 표로 보기
	@RequestMapping("/cafe_list")
	public String cafe_list(Model model) {
		model.addAttribute("list", boardService.selectAllCafeList());		
		return "board_hs/cafe_list";
	}
	
	//카페 목록 지역별로 보기
	@RequestMapping("/cafe_list_loc")
	public String cafe_list_loc(Model model, String c_add) {
		model.addAttribute("list", boardService.selectCafeLoc(c_add));
		
		return "board_hs/cafe_list";
	}

	// 카페 리뷰들 싹다 리스트(표)로 보기
	@RequestMapping(value = "/selectAllReviewList")
	public String selectAllReviewList(Model model) {
		model.addAttribute("list", boardService.selectAllReviewList());
		return "board_hs/cafe_review_list";
	}

	
	//리뷰쓰는 view 로 가기
	@RequestMapping(value = "/cafe_review_write", method = RequestMethod.GET)
	public String cafe_review_write(Model model, int c_no) {

		System.out.println(c_no);

		//작성 페이지에서 카페번호랑 카페 이름은 자동으로 입력된 상태로 나오게.
		model.addAttribute("c_no", c_no);
		model.addAttribute("c_title", boardService.get_CafeName(c_no));

		return "board_hs/cafe_review_write";
	}
	
	// 리뷰 작성하기
	@RequestMapping("/insertReview")
	public String insertReview(Cafe_reviewVO cafe_reviewVO) {

		boardService.insertReview(cafe_reviewVO);
		
		int c_no = cafe_reviewVO.getC_no();
		int m_no = cafe_reviewVO.getM_no();
		
		boardService.boardPointUpdate(m_no);
		
		return "redirect:cafe_info?c_no="+c_no;
	}
	
	// 리뷰 수정 view
	@RequestMapping(value = "/review_modify_view")
	public String review_modify_view(int cr_no, Model model) {
		model.addAttribute("cafe_review", boardService.selectReviewOne(cr_no));
		return "board_hs/cafe_review_modify_view";
	}
	//리뷰 수정 (수정 완료시 수정된 content_view 로 감.)
	@RequestMapping(value = "/review_modify", method = RequestMethod.POST)
	public String review_modify(Cafe_reviewVO cafe_reviewVO) {
		boardService.review_modify(cafe_reviewVO);
		
		int cr_no = cafe_reviewVO.getCr_no();
		System.out.println(cr_no);
		
	
		return "redirect:content_view_cr?cr_no="+cr_no;
		
	}
	//리뷰 삭제하기
	@RequestMapping("/review_delete")
	public String review_delete(int cr_no ) {
		boardService.review_delete(cr_no);
	
		//경로 어떻게 할지 생각해봐야함.
		return "redirect:list";
	}

	// HttpServletRequest request, RedirectAttributes redirectAttributes
	//String referer = request.getHeader("Referer");
	
	
	////////////////////////////////////////일단 1 : 1 문의 ///////////////////////////////////////

	// 리스트 홈화면
	@RequestMapping(value = "/help_home", method = RequestMethod.GET)
	public String help_home(Model model) {
		return "board_hs/help_home";
	}

	
	
	//1 : 1 문의 리스트
	@RequestMapping(value = "/question_list", method = RequestMethod.GET)

	public String question_list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("content_view", boardService.selectQuestionList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.cboard_listCount(scri, 8));
		model.addAttribute("pageMaker", pageMaker);
		

		return "board_hs/question_list";
	}
	
	//문의 작성 view
	@RequestMapping(value = "/question_write_view", method = RequestMethod.GET)
	public String question_write_view(Model model) {
		return "board_hs/question_write_view";
	}
	
	//문의 작성
	@RequestMapping(value = "/question_write", method = RequestMethod.POST)
	public String question_write(Model model, Board_writeVO board_writeVO) {
		boardService.insertQuestion(board_writeVO);
		
		int m_no = board_writeVO.getM_no();
		boardService.boardPointUpdate(m_no);
		
		return "redirect:question_list";
	}
	
	//문의 보기 (비밀글이면 작성자와 관리자만 볼 수 있음)
	@RequestMapping("/question_content_view")
	public String question_content_view(HttpServletRequest request,Model model) {
		
		int bw_no = Integer.parseInt(request.getParameter("bw_no"));
		
		model.addAttribute("content_view", boardService.selectQuestionOne(bw_no));
		return "board_hs/question_content_view";
	}
	
	
	//문의 수정 view
	@RequestMapping(value = "/question_modify_view")
	public String question_modify_view(int bw_no, Model model) {
		model.addAttribute("content_view", boardService.selectQuestionOne(bw_no));
		return "board_hs/question_modify_view";
	}
	
	//문의 수정(수정 후 수정한 글 다시 보기)
	@RequestMapping(value = "/question_modify" , method = RequestMethod.POST)
	public String question_modify(Board_writeVO board_writeVO) {
		boardService.modifyQuestion(board_writeVO);
		int bw_no = board_writeVO.getBw_no();
		return "redirect:question_content_view?bw_no="+bw_no;
	}
	
	//문의 삭제(댓글 달렸으면 삭제 못하게 해야함)
	@RequestMapping("/question_delete")
	public String question_delte(int bw_no) {
		boardService.deleteQuestion(bw_no);
		return "redirect:question_list";
	}
	
	
	////////////////////////////////////////자주하는 질문 FAQ/////////////////////////////////////////////////////
	
	
	@RequestMapping("/faq")
	public String faq(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		
		model.addAttribute("faq_list", adminService.faqList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.faq_listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		
		return "faq/faq";
	}

	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
	/////////////////////////////////// 게시물 작성 시 파일 업로드 부분(DB에 넣는거 X)/////////////////////////////////

	/**
	 * ck에디터 파일업로드 이벤트 발생 시 처리
	 * 
	 * @param model
	 * @param fileload
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "/fileupload", method = { RequestMethod.POST, RequestMethod.GET })
	public String fileUpload(Model model, @RequestParam(value = "upload", required = false) MultipartFile fileload,
			HttpServletRequest req, HttpServletResponse res) throws IOException {

		// 서버에 파일을 저장할 때에는 파일명을 시간값으로 변경
		// DB에 저장할 때에는 원본 파일명과 시간값을 모두 저장
		// filename 취득
		String filename = fileload.getOriginalFilename();

		// upload 경로 설정(tomcat realpath)

		String fuploadPath = req.getSession().getServletContext().getRealPath("/resources/files/img/");

		// String fuploadPath = "c://sa-wee/file";

		System.out.println(req.getSession().getServletContext().getRealPath("/"));
		System.out.println(fuploadPath);

		// (이미지)파일 이름이 되어버림. filename + jjj 했더니 1.jpgjjj 가 되었음.
		String newfilename = filename;

		// 업로드 수행
		// File file = new File( fuploadPath + "/" + newfilename);

		// fuploadPath 안에 파일 생성됨.(img 파일 만들어지고 그 안에 파일)
		// +"/"+ 이거 없으면 상위폴더에 img파일명.jpg 이런식으로 이름이 됨.
		File file = new File(fuploadPath + "/" + newfilename);

		try {
			// 실제 파일이 업로드 되는 부분

			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			System.out.println(file);

			return "{ \"uploaded\" : true, \"url\" : \"http://localhost:8282/resources/files/img/" + newfilename
					+ "\" }";
			// return "{ \"uploaded\" : true, \"url\" : \"c://sa-wee/file/"+ newfilename +
			// "\" }";

		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return "{ \"uploaded\" : false, \"error\": { \"message\": \"error.......\" } }";
		}

	}

}
