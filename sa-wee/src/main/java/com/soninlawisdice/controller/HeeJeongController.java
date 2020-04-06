package com.soninlawisdice.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soninlawisdice.service.ContentService;
import com.soninlawisdice.service.ContentServiceImpl;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.TradeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HeeJeongController {

	@Autowired
	ContentService contentService;

	private static final Logger logger = LoggerFactory.getLogger(HeeJeongController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	/*============================== 커뮤니티(일반 게시판) ===================================*/
	
	// 게시글 view
	@RequestMapping(value = "/content_view", method = RequestMethod.GET)
	public String content(Model model, HttpServletRequest request, CM_commentVO cm_commentVO, 
							@RequestParam("bw_no") int pageNum) {
		System.out.println("content_view");

		int bw_no = Integer.parseInt(request.getParameter("bw_no"));
		
		System.out.println(bw_no);

		model.addAttribute("content_view", contentService.selectContentOne(bw_no));

		// 게시글 조회수
		contentService.upHitContent(bw_no);

		return "content/content_view";
	}

	// 게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Board_writeVO board_writeVO, Model model) {
		System.out.println("delete");

		contentService.deleteContent(board_writeVO);

		return "redirect:/list_home";
	}

	// 게시글 추천수 증가
	@ResponseBody
	@RequestMapping(value = "/rec", method = RequestMethod.GET)
	public String recommend(String bw_no, Model model) {
		System.out.println("recommend");

		contentService.upRecommendContent(bw_no);

		return contentService.selectRecommendContent(bw_no);
	}

	// 게시글 댓글 목록 view
	 @RequestMapping(value = "/comment_view_bw", method = RequestMethod.GET)
	 public String comment_view_bw(Model model, HttpServletRequest request, CM_commentVO cm_commentVO) {
		System.out.println("comment_view_bw");
		
		String cm_no2 = request.getParameter("cm_no2");
		System.out.println("cm_no2 : "+cm_no2);

		model.addAttribute("comment_list", contentService.selectCommentList(cm_no2));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
		
		// 댓글 갯수 세기
		model.addAttribute("comment_count", contentService.selectCommentCount(cm_no2));
	  
		return "content/comment_view_bw"; 
	 } 

	// 게시글 댓글 쓰기 view
	@RequestMapping(value = "/comment_write_view_bw", method = RequestMethod.GET)
	public String comment_write_view_bw(HttpServletRequest request, Model model, CM_commentVO cm_commentVO) {
		System.out.println("comment_write_view_bw");

		int bw_no = Integer.parseInt(request.getParameter("bw_no"));

		System.out.println(bw_no);

		model.addAttribute("content_view", contentService.selectContentOne(bw_no));
		model.addAttribute("bw_no", bw_no);
		System.out.println(cm_commentVO.getCm_no2());

		contentService.insertCommentBW(cm_commentVO);

		return "content/comment_write_bw";
	}

	// 게시글 댓글 쓰기
	@RequestMapping(value = "/comment_write_bw", method = RequestMethod.GET)
	public String comment_write_bw(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO, 
									Model model, @RequestParam int bw_no, RedirectAttributes re) {
		System.out.println("comment_write_bw");

		System.out.println(cm_commentVO.getCm_no2());

		contentService.insertCommentBW(cm_commentVO);
		
//		int bw_no = Integer.parseInt(rq.getParameter("bw_no"));
		re.addAttribute("bw_no", bw_no);

		return "redirect:/content_view";
	}
	
	// 댓글 수정하기 view
	@RequestMapping(value = "/comment_modify_view", method = RequestMethod.GET)
	public String comment_modify_view(HttpServletRequest request, Model model, CM_commentVO cm_commentVO) {
		System.out.println("comment_modify_view");
		
		String cm_no = request.getParameter("cm_no");
		System.out.println("cm_no : "+cm_no);

		model.addAttribute("comment_modi", contentService.selectCommentOne(cm_no));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
		
		return "content/comment_modify_view";
	}
	
	// 댓글 수정
	@RequestMapping(value = "/comment_modify", method = RequestMethod.GET)
	public String comment_modify(CM_commentVO cm_commentVO, Model model) {
		System.out.println("comment_modify");
		
		contentService.updateCommentOne(cm_commentVO);
		
		return "content/comment_modi_success";
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/comment_delete", method = RequestMethod.GET)
	public String comment_delete(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO, 
									Model model, @RequestParam int bw_no, RedirectAttributes re) {
		System.out.println("comment_delete");
		
		contentService.deleteComment(cm_commentVO);
	
		re.addAttribute("bw_no", bw_no);
			
		return "redirect:/content_view";
	}
	
	// 댓글 추천수 증가
	@ResponseBody
	@RequestMapping(value = "/rec_cm", method = RequestMethod.GET)
	public String recommend_cm(String cm_no, Model model) {
		System.out.println("recommend_cm");

		contentService.upRecommendComment(cm_no);

		return contentService.selectRecommendComment(cm_no);
	}

	// 게시글 신고글 view
	@RequestMapping(value = "/report_view_bw", method = RequestMethod.GET)
	public String report_view_bw(HttpServletRequest request, Model model) {
		System.out.println("report_view_bw");
		
		int bw_no = Integer.parseInt(request.getParameter("bw_no"));

		System.out.println(bw_no);

		model.addAttribute("content_view", contentService.selectContentOne(bw_no));

		return "content/report_view_bw";
	}

	// 게시글 신고글 쓰기
	@RequestMapping(value = "/report_bw", method = RequestMethod.GET)
	public String report_bw(@ModelAttribute("reportVO") ReportVO reportVO, Model model) {
		System.out.println("report_bw");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportBW(reportVO);

		return "content/report_success";
	}

	// 회원 신고글 view
	@RequestMapping(value = "/report_view_m", method = RequestMethod.GET)
	public String report_view_m(HttpServletRequest request, Model model) {
		System.out.println("report_view_m");

		int m_no = Integer.parseInt(request.getParameter("m_no"));

		System.out.println(m_no);

		model.addAttribute("member_view", contentService.selectContentM(m_no));

		return "content/report_view_m";
	}

	// 회원 신고글 쓰기
	@RequestMapping(value = "/report_m", method = RequestMethod.GET)
	public String report_m(@ModelAttribute("reportVO") ReportVO reportVO, Model model) {
		System.out.println("report_m");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportM(reportVO);

		return "redirect:list_home";
	}

	// 댓글 신고글 view
	@RequestMapping(value = "/report_view_cm", method = RequestMethod.GET)
	public String report_view_cm(HttpServletRequest request, Model model) {
		System.out.println("report_view_cm");

		int cm_no = Integer.parseInt(request.getParameter("cm_no"));

		System.out.println(cm_no);

		model.addAttribute("comment_view", contentService.selectContentCM(cm_no));

		return "content/report_view_cm";
	}

	// 댓글 신고글 쓰기
	@RequestMapping(value = "/report_cm", method = RequestMethod.GET)
	public String report_cm(@ModelAttribute("reportVO") ReportVO reportVO, Model model) {
		System.out.println("report_cm");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportCM(reportVO);

		return "content/report_success";
	}

	// 신고글 완료 메세지
	@RequestMapping(value = "/report_success", method = RequestMethod.GET)
	public String report_success(Locale locale, Model model) {
		System.out.println("report_success");

		return "content/report_success";
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String reply(Locale locale, Model model) {
		logger.info("reply");

		return "content/reply";
	}

	@RequestMapping(value = "/game_info", method = RequestMethod.GET)
	public String game_info(Locale locale, Model model) {
		System.out.println("game_info");

		return "game_info/game_info";
	}

	@RequestMapping(value = "/game_detail", method = RequestMethod.GET)
	public String game_detail(Locale locale, Model model) {
		System.out.println("game_detail");

		return "game_detail/game_detail";
	}
	
	/*============================== 보부상 ===================================*/

	// 보부상 컨텐트 뷰랑 삭제.. 뽀려갑니다^^

	
	// 중고거래 게시글 추천수 증가
	@ResponseBody
	@RequestMapping(value = "/rec_t", method = RequestMethod.GET)
	public String recommend_t(String t_no, Model model) {
		System.out.println("recommend_t");

		contentService.upRecommendContentT(t_no);

		return contentService.selectRecommendContentT(t_no);
	}
	
	// 중고거래 신고글 view
	@RequestMapping(value = "/report_view_t", method = RequestMethod.GET)
	public String report_view_t(HttpServletRequest request, Model model) {
		System.out.println("report_view_t");

		int t_no = Integer.parseInt(request.getParameter("t_no"));

		System.out.println(t_no);

		model.addAttribute("content_view_t", contentService.selectContentTOne(t_no));

		return "content/report_view_t";
	}

	// 중고거래 신고글 쓰기
	@RequestMapping(value = "/report_t", method = RequestMethod.GET)
	public String report_t(ReportVO reportVO, Model model) {
		System.out.println("report_t");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportT(reportVO);

		return "content/report_success";
	}
	
	// 중고거래 댓글 목록 view
	@RequestMapping(value = "/comment_view_t", method = RequestMethod.GET)
	public String comment_view_t(Model model, HttpServletRequest request, CM_commentVO cm_commentVO) {
		System.out.println("comment_view_t");
			
		String cm_no2 = request.getParameter("cm_no2");
		System.out.println("cm_no2 : "+cm_no2);

		model.addAttribute("comment_list_t", contentService.selectCommentListT(cm_no2));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
		
		// 중고거래 댓글 갯수 세기
		model.addAttribute("comment_count_t", contentService.selectCommentCountT(cm_no2));
		  
		return "content/comment_view_t"; 
	} 

	// 중고거래 댓글 쓰기 view
	@RequestMapping(value = "/comment_write_view_t", method = RequestMethod.GET)
	public String comment_write_view_t(HttpServletRequest request, Model model, CM_commentVO cm_commentVO) {
		System.out.println("comment_write_view_t");

		int t_no = Integer.parseInt(request.getParameter("t_no"));

		System.out.println(t_no);

		model.addAttribute("content_view_t", contentService.selectContentTOne(t_no));
		model.addAttribute("t_no", t_no);
		System.out.println(cm_commentVO.getCm_no2());
		
		contentService.insertCommentT(cm_commentVO);

		return "content/comment_write_view_t";
	}
	
	// 중고거래 댓글 쓰기
	@RequestMapping(value = "/comment_write_t", method = RequestMethod.GET)
	public String comment_write_t(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO,
										Model model, @RequestParam int t_no, RedirectAttributes re) {
		System.out.println("comment_write_t");

		System.out.println(cm_commentVO.getCm_no2());

		contentService.insertCommentT(cm_commentVO);
			
		re.addAttribute("t_no", t_no);

		return "redirect:/content_view_t";
	}
	
	// 중고거래 댓글 수정하기 view
	@RequestMapping(value = "/comment_modify_view_t", method = RequestMethod.GET)
	public String comment_modify_view_t(HttpServletRequest request, Model model, CM_commentVO cm_commentVO) {
		System.out.println("comment_modify_view_t");
			
		String cm_no = request.getParameter("cm_no");
		System.out.println("cm_no : "+cm_no);
		
		model.addAttribute("comment_modi_t", contentService.selectCommentT(cm_no));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
			
		return "content/comment_modify_view_t";
	}
		
	// 중고거래 댓글 수정
	@RequestMapping(value = "/comment_modify_t", method = RequestMethod.GET)
	public String comment_modify_t(CM_commentVO cm_commentVO, Model model) {
		System.out.println("comment_modify_t");
			
		contentService.updateCommentTOne(cm_commentVO);
			
		return "content/comment_modi_success";
	}
	
	// 중고거래 댓글 삭제
	@RequestMapping(value = "/comment_delete_t", method = RequestMethod.GET)
	public String comment_delete_t(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO, 
										Model model, @RequestParam int t_no, RedirectAttributes re) {
		System.out.println("comment_delete_t");
			
		contentService.deleteCommentT(cm_commentVO);
		
		re.addAttribute("t_no", t_no);
				
		return "redirect:/content_view_t";
	}
	
	// 중고거래 댓글 추천수 증가
	@ResponseBody
	@RequestMapping(value = "/rec_cm_t", method = RequestMethod.GET)
	public String recommend_cm_t(String cm_no, Model model) {
		System.out.println("recommend_cm_t");

		contentService.upRecommendCommentT(cm_no);

		return contentService.selectRecommendCommentT(cm_no);
	}
	
	
	
	/*============================== 카페리뷰 ===================================*/
		
	// 카페리뷰 게시글 view
	@RequestMapping(value = "/content_view_cr", method = RequestMethod.GET)
	public String content_view_cr(Model model, HttpServletRequest request, CM_commentVO cm_commentVO,
									@RequestParam("cr_no") int pageNum) {
		System.out.println("content_view_cr");

		System.out.println(request.getParameter("cr_no"));
			
		int cr_no = Integer.parseInt(request.getParameter("cr_no"));
				
		System.out.println(cr_no);

		model.addAttribute("content_view_cr", contentService.selectContentCROne(cr_no));

		// 게시글 조회수
		contentService.upHitContentCR(cr_no);

		return "content/content_view_cr";
	}
	
	// 카페리뷰 게시글 삭제
	@RequestMapping(value = "/delete_cr", method = RequestMethod.GET)
	public String delete_cr(Cafe_reviewVO cafe_reviewVO, Model model) {
		System.out.println("delete_cr");

		contentService.deleteContentCR(cafe_reviewVO);

		return "redirect:/cafe_map";
	}
	
	// 카페리뷰 게시글 추천수 증가
	@ResponseBody
	@RequestMapping(value = "/rec_cr", method = RequestMethod.GET)
	public String recommend_cr(String cr_no, Model model) {
		System.out.println("recommend_cr");

		contentService.upRecommendContentCR(cr_no);

		return contentService.selectRecommendContentCR(cr_no);
	}
	
	// 카페리뷰 신고글 view
	@RequestMapping(value = "/report_view_cr", method = RequestMethod.GET)
	public String report_view_cr(HttpServletRequest request, Model model) {
		System.out.println("report_view_cr");

		int cr_no = Integer.parseInt(request.getParameter("cr_no"));

		System.out.println(cr_no);

		model.addAttribute("content_view_cr", contentService.selectContentCROne(cr_no));

		return "content/report_view_cr";
	}

	// 카페리뷰 신고글 쓰기
	@RequestMapping(value = "/report_cr", method = RequestMethod.GET)
	public String report_cr(ReportVO reportVO, Model model) {
		System.out.println("report_cr");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportCR(reportVO);
		
		return "content/report_success";
	}

	// 카페리뷰 댓글 목록 view
	@RequestMapping(value = "/comment_view_cr", method = RequestMethod.GET)
	public String comment_view_cr(Model model, HttpServletRequest request, CM_commentVO cm_commentVO) {
		System.out.println("comment_view_cr");
				
		String cm_no2 = request.getParameter("cm_no2");
		System.out.println("cm_no2 : "+cm_no2);

		model.addAttribute("comment_list_cr", contentService.selectCommentListCR(cm_no2));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
		
		// 카페리뷰 댓글 갯수 세기
		model.addAttribute("comment_count_cr", contentService.selectCommentCountCR(cm_no2));
			  
		return "content/comment_view_cr"; 
	} 
	
	// 카페리뷰 댓글 쓰기 view
	@RequestMapping(value = "/comment_write_view_cr", method = RequestMethod.GET)
	public String comment_write_view_cr(HttpServletRequest request, Model model, CM_commentVO cm_commentVO) {
		System.out.println("comment_write_view_cr");

		int cr_no = Integer.parseInt(request.getParameter("cr_no"));

		System.out.println(cr_no);

		model.addAttribute("content_view_cr", contentService.selectContentCROne(cr_no));
		model.addAttribute("cr_no", cr_no);
		System.out.println(cm_commentVO.getCm_no2());

		return "content/comment_write_view_cr";
	}

	// 카페리뷰 댓글 쓰기
	@RequestMapping(value = "/comment_write_cr", method = RequestMethod.GET)
	public String comment_write_cr(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO,
										Model model, @RequestParam int cr_no, RedirectAttributes re) {
		System.out.println("comment_write_cr");

		System.out.println(cm_commentVO.getCm_no2());

		contentService.insertCommentCR(cm_commentVO);
			
		re.addAttribute("cr_no", cr_no);

		return "redirect:/content_view_cr";
	}
	
	// 카페리뷰 댓글 수정하기 view
	@RequestMapping(value = "/comment_modify_view_cr", method = RequestMethod.GET)
	public String comment_modify_view_cr(HttpServletRequest request, Model model, CM_commentVO cm_commentVO) {
		System.out.println("comment_modify_view_cr");
			
		String cm_no = request.getParameter("cm_no");
		System.out.println("cm_no : "+cm_no);
			
		model.addAttribute("comment_modi_cr", contentService.selectCommentCR(cm_no));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
				
		return "content/comment_modify_view_cr";
	}
			
	// 카페리뷰 댓글 수정
	@RequestMapping(value = "/comment_modify_cr", method = RequestMethod.GET)
	public String comment_modify_cr(CM_commentVO cm_commentVO, Model model) {
		System.out.println("comment_modify_cr");
				
		contentService.updateCommentCROne(cm_commentVO);
				
		return "content/comment_modi_success";
	}
	
	// 카페리뷰 댓글 삭제
	@RequestMapping(value = "/comment_delete_cr", method = RequestMethod.GET)
	public String comment_delete_cr(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO, 
											Model model, @RequestParam int cr_no, RedirectAttributes re) {
		System.out.println("comment_delete_t");
				
		contentService.deleteCommentCR(cm_commentVO);
			
		re.addAttribute("cr_no", cr_no);
					
		return "redirect:/content_view_cr";
	}
	
	// 카페리뷰 댓글 추천수 증가
	@ResponseBody
	@RequestMapping(value = "/rec_cm_cr", method = RequestMethod.GET)
	public String recommend_cm_cr(String cm_no, Model model) {
		System.out.println("recommend_cm_cr");

		contentService.upRecommendCommentCR(cm_no);

		return contentService.selectRecommendCommentCR(cm_no);
	}
	
	
}
