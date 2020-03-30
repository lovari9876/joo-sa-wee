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
import com.soninlawisdice.service.BoardServiceImpl;
import com.soninlawisdice.service.ContentService;
import com.soninlawisdice.vo.Board_writeVO;





/**
 * Handles requests for the application home page.
 */
@Controller
public class Board_hs_Controller {
	
	
	@Autowired
	private BoardService boardService;
	
	
	@Autowired private ContentService contentService;
	 
	
	
	private static final Logger logger = LoggerFactory.getLogger(Board_hs_Controller.class);
	
	//베스트 + 핫이슈 + 홈화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		model.addAttribute("hot", boardService.selectHotList());
		model.addAttribute("best", boardService.selectBestList());
		
		return "board_hs/index";
	}
	
	
	/////////////////////////////////////커뮤니티 관련//////////////////////////////
	
	
	//리스트 홈화면
	@RequestMapping(value = "/list_home", method = RequestMethod.GET)
	public String list_home(Model model) {
		return "board_hs/list_home";
	}
	
	//보드이야기 리스트
	@RequestMapping(value = "/board_story", method = RequestMethod.GET)
	public String board_story(Model model) {
		model.addAttribute("list", boardService.selectBoard_Story());
		return "board_hs/board_story";
	}
	
	//개봉기 및 리뷰 리스트
	@RequestMapping(value = "/board_open_review", method = RequestMethod.GET)
	public String board_open_review(Model model) {
		model.addAttribute("list", boardService.selectBoard_Open());
		return "board_hs/board_open_review";
	}
	
	//보드게임 모임 리스트
	@RequestMapping(value = "/board_meet", method = RequestMethod.GET)
	public String board_meet(Model model) {
		model.addAttribute("list", boardService.selectBoard_Meet());
		return "board_hs/board_meet";
	}
	
	//보드뉴스 리스트
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
	
	//창작 보드게임 리스트
	@RequestMapping(value = "/board_creation", method = RequestMethod.GET)
	public String board_creation(Model model) {
		model.addAttribute("list", boardService.selectBoard_Creation());
		return "board_hs/board_creation";
	}
	

	//말머리마다 다른 내용 보여주기
	@ResponseBody
	@RequestMapping("/list_sub")
	public List<Board_writeVO> list(Model model) {
		System.out.println("test");

		return boardService.selectBoardList();
	}
	
	
	
	
	//글쓰기 view
	@RequestMapping(value = "/write_view", method = RequestMethod.GET)
	public String write_view(Locale locale, Model model) {
		logger.info("home");
		
		return "board_hs/write_view";
	}
	
	//글 작성
	@RequestMapping("/write")
	public String write(Board_writeVO board_writeVO) {
		boardService.insertBoard(board_writeVO);
		return "redirect:list";
	}
	
	
	//수정하기 view. 희정이 contentview 가지고 오는거. 위에 @Auto 두개 줘도 되는건가.
	@RequestMapping(value = "/modify_view", method = RequestMethod.GET)
	public String modify_view(Model model, String bw_no) {
		model.addAttribute("content_view",contentService.selectContentOne(bw_no));
		return "board_hs/modify_view";
	}
	
	
	
	@RequestMapping("/modify")
	public String modify(Board_writeVO board_writeVO, Model model) {

		System.out.println("modify()");

		boardService.modify(board_writeVO);

		return "redirect:list";
	}

	
	
	/////////////////////////////////////////카페리뷰 관련////////////////////////////
	

	@RequestMapping(value = "/cafe_review_write", method = RequestMethod.GET)
	public String cafe_review_write(Model model) {
		logger.info("review");
		
		return "board_hs/cafe_review_write";
	}
	
	
	
	
	
	
	

	
	
	
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
	
	
	@RequestMapping(value = "/cafe_map", method = RequestMethod.GET)
	public String cafe_map(Model model) {
		logger.info("review");
		
		return "board_hs/cafe_map";
	}
	
	

	
	@RequestMapping(value = "/cafe_content_view", method = RequestMethod.GET)
	public String cafe_content_view(Model model) {
		logger.info("review");
		
		return "board_hs/cafe_content_view";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	////////////////////////게시물 작성 시 파일 업로드 부분(DB에 넣는거 X)///////////////////
	
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
//		String fuploadPath = req.getSession().getServletContext().getRealPath("/upload/editor");

		
		
		System.out.println(req.getSession().getServletContext().getRealPath("/"));
		System.out.println(fuploadPath);
		
		
		// (이미지)파일 이름이 되어버림. filename + jjj 했더니 1.jpgjjj 가 되었음.
		String newfilename = filename;

		// 업로드 수행
		//File file = new File( fuploadPath + "/" + newfilename);

		
		//fuploadPath 안에 파일 생성됨.(img 파일 만들어지고 그 안에 파일)
		//+"/"+ 이거 없으면 상위폴더에 img파일명.jpg 이런식으로 이름이 됨.
		File file = new File( fuploadPath + "/" + newfilename );
		
		
		try {
			// 실제 파일이 업로드 되는 부분
			
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			System.out.println(file);
			// return "{ \"uploaded\" : true, \"url\" : \"http://112.169.197.59:18080/upload/editor/" + newfilename + "\" }";
			return "{ \"uploaded\" : true, \"url\" : \"http://localhost:8282/resources/files/img/"+ newfilename + "\" }";
			
		
			
			
//			return "{ \"uploaded\" : true, \"url\" : \"http://localhost:8282/upload/editor/" +newfilename + "\" }";
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
			return "{ \"uploaded\" : false, \"error\": { \"message\": \"error.......\" } }";
		}
		
		
	}
	
	
	
	
}
