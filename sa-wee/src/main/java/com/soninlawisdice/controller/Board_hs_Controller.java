package com.soninlawisdice.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.soninlawisdice.service.BoardService;
import com.soninlawisdice.service.ContentService;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.Cafe_reviewVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Board_hs_Controller {

	@Autowired
	private BoardService boardService;

	@Autowired
	private ContentService contentService;

	private static final Logger logger = LoggerFactory.getLogger(Board_hs_Controller.class);

	// 베스트 + 핫이슈 + 홈화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		model.addAttribute("hot", boardService.selectHotList());
		model.addAttribute("best", boardService.selectBestList());

		return "board_hs/index";
	}

	///////////////////////////////////// 커뮤니티 관련//////////////////////////////

	// 리스트 홈화면
	@RequestMapping(value = "/list_home", method = RequestMethod.GET)
	public String list_home(Model model) {
		return "board_hs/list_home";
	}

	// 보드이야기 리스트
	@RequestMapping(value = "/board_story", method = RequestMethod.GET)
	public String board_story(Model model) {
		model.addAttribute("list", boardService.selectBoard_Story());
		return "board_hs/board_story";
	}

	// 개봉기 및 리뷰 리스트
	@RequestMapping(value = "/board_open_review", method = RequestMethod.GET)
	public String board_open_review(Model model) {
		model.addAttribute("list", boardService.selectBoard_Open());
		return "board_hs/board_open_review";
	}

	// 보드게임 모임 리스트
	@RequestMapping(value = "/board_meet", method = RequestMethod.GET)
	public String board_meet(Model model) {
		model.addAttribute("list", boardService.selectBoard_Meet());
		return "board_hs/board_meet";
	}

	// 보드뉴스 리스트
	@RequestMapping(value = "/board_news", method = RequestMethod.GET)
	public String board_news(Model model) {
		model.addAttribute("list", boardService.selectBoard_News());
		return "board_hs/board_news";
	}

	@RequestMapping(value = "/board_qna", method = RequestMethod.GET)
	public String board_qna(Model model) {
		model.addAttribute("list", boardService.selectBoard_Qna());
		return "board_hs/board_qna";
	}

	// 창작 보드게임 리스트
	@RequestMapping(value = "/board_creation", method = RequestMethod.GET)
	public String board_creation(Model model) {
		model.addAttribute("list", boardService.selectBoard_Creation());
		return "board_hs/board_creation";
	}

	// 말머리마다 다른 내용 보여주기
	@ResponseBody
	@RequestMapping("/list_sub")
	public List<Board_writeVO> list(Model model) {
		System.out.println("test");

		return boardService.selectBoardList();
	}

	// 글쓰기 view
	@RequestMapping(value = "/write_view", method = RequestMethod.GET)
	public String write_view(Model model, String bt_no) {
		logger.info("home");

		model.addAttribute("bt_no", bt_no);
		
		return "board_hs/write_view";
	}

	// 글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(Board_writeVO board_writeVO) {
		boardService.insertBoard(board_writeVO);

		int bt_no = board_writeVO.getBt_no();

		System.out.println(bt_no);

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
		} else {
			return "redirect:board_creation";
		}

	}

	// 수정하기 view. 희정이 contentview 가지고 오는거. 위에 @Auto 두개 줘도 되는건가.
	@RequestMapping(value = "/modify_view", method = RequestMethod.GET)
	public String modify_view(Model model, String bw_no) {
		model.addAttribute("content_view", contentService.selectContentOne(bw_no));

		return "board_hs/modify_view";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Board_writeVO board_writeVO, Model model) {

		System.out.println("modify()");

		boardService.modify(board_writeVO);

		return "redirect:board_story";
	}

	///////////////////////////////////////// 카페리뷰 관련////////////////////////////

	@RequestMapping(value = "/cafe_review_write", method = RequestMethod.GET)
	public String cafe_review_write(Model model, String c_no) {

		System.out.println(c_no);

		model.addAttribute("c_no", c_no);
		model.addAttribute("c_title", boardService.get_CafeName(c_no));

		return "board_hs/cafe_review_write";
	}

	// 카페 리뷰 전체 리스트 보기
	@RequestMapping(value = "/selectAllReviewList")
	public String selectAllReviewList(Model model) {
		model.addAttribute("list", boardService.selectAllReviewList());
		return "board_hs/cafe_review_list";
	}

	// 카페 리뷰 리스트에서 review_content_view 로
	@RequestMapping(value = "/selectReviewOne")
	public String selectReviewOne(Model model, String cr_no) {
		// 조회수 올리기
		boardService.review_uphit(cr_no);

		model.addAttribute("cafe_review", boardService.selectReviewOne(cr_no));
		return "board_hs/cafe_review_content_view";
	}

	// 지도
	@RequestMapping(value = "/cafe_map", method = RequestMethod.GET)
	public String cafe_map(Model model) {
		logger.info("review");

		return "board_hs/cafe_map";
	}

	// 마커 클릭시 카페 상세정보(cafe_info)로 이동. 이거 url 다시 해야함.
	@RequestMapping(value = "/cafe_info", method = RequestMethod.GET)
	public String cafe_content_view(Model model, String c_no) {

		// 카페 정보 가져오기
		model.addAttribute("cafe_info", boardService.selectCafeInfo(c_no));

		// 댓글 불러오는것도 추가해야함

		// 밑에 관련 리스트 가져오기
		model.addAttribute("list", boardService.selectCafeReviewList(c_no));

		return "board_hs/cafe_info";
	}

	// 카페 리뷰 글 추천
	@ResponseBody
	@RequestMapping(value = "/review_rec")
	public String recommend(String cr_no, Model model) {
		System.out.println("recommend");

		boardService.review_recommend(cr_no);

		return boardService.review_rec(cr_no);
	}

	// 리뷰 작성하기
	@RequestMapping("/insertReview")
	public String insertReview(Cafe_reviewVO cafe_reviewVO) {

		boardService.insertReview(cafe_reviewVO);

		// 이것도 경로 다시 해야함
		return "redirect:cafe_info";
	}

	// 리뷰 수정하기

	@RequestMapping(value = "/question_list", method = RequestMethod.GET)
	public String question_list(Model model) {
		logger.info("review");

		return "board_hs/question_list";
	}

	@RequestMapping(value = "/question_write_view", method = RequestMethod.GET)
	public String question_write_view(Model model) {
		logger.info("review");

		return "board_hs/question_write_view";
	}

	//////////////////////// 게시물 작성 시 파일 업로드 부분(DB에 넣는거 X)///////////////////

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
