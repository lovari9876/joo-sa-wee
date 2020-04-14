package com.soninlawisdice.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soninlawisdice.service.BoardService;
import com.soninlawisdice.service.ContentService;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.GameVO;
import com.soninlawisdice.vo.Game_personVO;
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
	
	@Autowired
	private BoardService boardService;

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

		
		// 보련이가 로그인한 회원 m_no 받는거 해주면 받아오기
		int m_no = 9;
		model.addAttribute("m_no", m_no);
		

		//게임번호, 게임이름 불러오기
		model.addAttribute("gameName", boardService.selectGameNameCom(bw_no));
		System.out.println(boardService.selectGameNameCom(bw_no));

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

	// 게시글 댓글 쓰기 view 안써
	/*
	 * @RequestMapping(value = "/comment_write_view_bw", method = RequestMethod.GET)
	 * public String comment_write_view_bw(HttpServletRequest request, Model
	 * model, @ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO) {
	 * System.out.println("comment_write_view_bw");
	 * 
	 * int bw_no = Integer.parseInt(request.getParameter("bw_no"));
	 * 
	 * System.out.println(bw_no);
	 * 
	 * model.addAttribute("content_view", contentService.selectContentOne(bw_no));
	 * model.addAttribute("bw_no", bw_no);
	 * System.out.println(cm_commentVO.getCm_no2());
	 * 
	 * String cm_no = request.getParameter("cm_no");
	 * System.out.println("cm_no : "+cm_no);
	 * 
	 * 
	 * 
	 * return "content/comment_write_bw";
	
	}  */

	// 게시글 댓글 쓰기
	@RequestMapping(value = "/comment_write_bw", method = RequestMethod.POST)
	public String comment_write_bw(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO, 
									Model model, @RequestParam int bw_no, @RequestParam("m_no") int m_no, RedirectAttributes re) {
		System.out.println("comment_write_bw");
		
		System.out.println(cm_commentVO.getCm_no2());
		System.out.println(cm_commentVO.getM_no());
		
		// content_view에서 가져온 m_no을 cm_commentVO에 저장
		System.out.println("m_no = " + m_no);
		cm_commentVO.setM_no(m_no);
		
		contentService.insertCommentBW(cm_commentVO);
		contentService.updatePoint(cm_commentVO);
		
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
	public String report_bw(@ModelAttribute("reportVO") ReportVO reportVO, Model model, Board_writeVO board_writeVO,
							HttpServletRequest request) {
		System.out.println("report_bw");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportBW(reportVO);
		
		// 게시글 신고수 증가
		contentService.updateReportBW(board_writeVO);
		
		// 게시글 아일랜드 1로 변경
		int bw_report_num = Integer.parseInt(request.getParameter("bw_report_num"));
		
		model.addAttribute("content_view", contentService.selectContentOne(bw_report_num));
		
		if(bw_report_num == 6) {
			contentService.updateIslandBW(board_writeVO);
		}

		return "content/report_success";
	}

	// 회원 신고글 view
	@RequestMapping(value = "/report_view_m", method = RequestMethod.GET)
	public String report_view_m(HttpServletRequest request, Model model) {
		System.out.println("report_view_m");

		int m_no = Integer.parseInt(request.getParameter("m_no"));

		System.out.println(m_no);

		model.addAttribute("member_view", contentService.selectContentM(m_no));
		
		// content_view로 redirect를 위해서
		int bw_no = Integer.parseInt(request.getParameter("bw_no"));
		
		model.addAttribute("content_view", contentService.selectContentOne(bw_no));

		return "content/report_view_m";
	}

	// 회원 신고글 쓰기
	@RequestMapping(value = "/report_m", method = RequestMethod.GET)
	public String report_m(@ModelAttribute("reportVO") ReportVO reportVO, Model model, MemberVO memberVO,
							HttpServletRequest request, @RequestParam int bw_no, RedirectAttributes re) {
		System.out.println("report_m");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportM(reportVO);
		
		// 회원 신고수 증가
		contentService.updateReportM(memberVO);
		
		// content_view로 redirect를 위해서
		re.addAttribute("bw_no", bw_no);
		
		// 회원 등급 4로 변경
		int m_report_num = Integer.parseInt(request.getParameter("m_report_num"));
		
		model.addAttribute("member_view", contentService.selectContentM(m_report_num));
		
		if(m_report_num == 6) {
			contentService.updateIslandM(memberVO);
		}

		return "redirect:content_view";
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
	public String report_cm(@ModelAttribute("reportVO") ReportVO reportVO, Model model, CM_commentVO cm_commentVO,
							HttpServletRequest request) {
		System.out.println("report_cm");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportCM(reportVO);
		
		// 댓글 신고수 증가
		contentService.updateReportCM(cm_commentVO);
		
		int cm_report_num = Integer.parseInt(request.getParameter("cm_report_num"));
		
		model.addAttribute("comment_view", contentService.selectContentCM(cm_report_num));
		
		if (cm_report_num == 6) {
			contentService.deleteComment(cm_commentVO);
		}

		return "content/report_success";
	}

	// 신고글 완료 메세지
	@RequestMapping(value = "/report_success", method = RequestMethod.GET)
	public String report_success(Locale locale, Model model) {
		System.out.println("report_success");

		return "content/report_success";
	}
	
	// 대댓글 view
	@RequestMapping(value = "/reply_view", method = RequestMethod.GET)
	public String reply_view(HttpServletRequest request, Model model, @ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO) {
		System.out.println("reply_view");
		
		String cm_no = request.getParameter("cm_no");
		System.out.println("cm_no : "+cm_no);

		model.addAttribute("comment_view", contentService.selectCommentOne(cm_no));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
		
		// 보련이가 로그인한 회원 m_no 받는거 해주면 받아오기
		int m_no = 9;
		model.addAttribute("m_no", m_no);

		return "content/reply_view";
	}
	
	// 대댓글 쓰기(update + insert)
	@RequestMapping(value = "/reply", method = RequestMethod.GET)
	public String reply(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO, Model model, @RequestParam("m_no") int m_no) {
		System.out.println("reply");
		
		System.out.println("m_no = " + m_no);
		cm_commentVO.setM_no(m_no);
		
		contentService.writeReply(cm_commentVO);
		contentService.updatePoint(cm_commentVO);
		
		return "content/reply_success";
	}

	@RequestMapping(value = "/game_info", method = RequestMethod.GET)
	public String game_info(Locale locale, Model model) {
		System.out.println("game_info");

		return "game_info/game_info";
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
	public String report_t(ReportVO reportVO, Model model, TradeVO tradeVO, HttpServletRequest request) {
		System.out.println("report_t");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportT(reportVO);
		
		// 중고거래 신고수 증가
		contentService.updateReportT(tradeVO);
		
		// 중고거래 아일랜드 1로 변경
		int t_report_num = Integer.parseInt(request.getParameter("t_report_num"));
		
		model.addAttribute("content_view_ t", contentService.selectContentTOne(t_report_num));
		
		if (t_report_num == 6) {
			contentService.updateIslandT(tradeVO);
		}

		return "content/report_success";
	}
	
	// 중고거래 회원 신고글 view
	@RequestMapping(value = "/report_view_m_t", method = RequestMethod.GET)
	public String report_view_m_t(HttpServletRequest request, Model model) {
		System.out.println("report_view_m_t");

		int m_no = Integer.parseInt(request.getParameter("m_no"));

		System.out.println(m_no);

		model.addAttribute("member_view", contentService.selectContentM(m_no));
			
		// content_view_t로 redirect를 위해서
		int t_no = Integer.parseInt(request.getParameter("t_no"));
			
		model.addAttribute("content_view_t", contentService.selectContentTOne(t_no));

		return "content/report_view_m_t";
	}

	// 중고거래 회원 신고글 쓰기
	@RequestMapping(value = "/report_m_t", method = RequestMethod.GET)
	public String report_m_t(@ModelAttribute("reportVO") ReportVO reportVO, Model model, MemberVO memberVO,
								HttpServletRequest request, @RequestParam int t_no, RedirectAttributes re) {
		System.out.println("report_m_t");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportM(reportVO);
			
		// 회원 신고수 증가
		contentService.updateReportM(memberVO);
			
		// content_view로 redirect를 위해서
		re.addAttribute("t_no", t_no);
			
		// 회원 등급 4로 변경
		int m_report_num = Integer.parseInt(request.getParameter("m_report_num"));
			
		model.addAttribute("member_view", contentService.selectContentM(m_report_num));
			
		if(m_report_num == 6) {
			contentService.updateIslandM(memberVO);
		}

		return "redirect:content_view_t";
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
	/*
	 * @RequestMapping(value = "/comment_write_view_t", method = RequestMethod.GET)
	 * public String comment_write_view_t(HttpServletRequest request, Model model,
	 * CM_commentVO cm_commentVO) { System.out.println("comment_write_view_t");
	 * 
	 * int t_no = Integer.parseInt(request.getParameter("t_no"));
	 * 
	 * System.out.println(t_no);
	 * 
	 * model.addAttribute("content_view_t", contentService.selectContentTOne(t_no));
	 * model.addAttribute("t_no", t_no);
	 * System.out.println(cm_commentVO.getCm_no2());
	 * 
	 * contentService.insertCommentT(cm_commentVO);
	 * 
	 * return "content/comment_write_t"; }
	 */
	
	// 중고거래 댓글 쓰기
	@RequestMapping(value = "/comment_write_t", method = RequestMethod.POST)
	public String comment_write_t(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO,
										Model model, @RequestParam int t_no, @RequestParam("m_no") int m_no, RedirectAttributes re) {
		System.out.println("comment_write_t");

		System.out.println(cm_commentVO.getCm_no2());
		
		System.out.println("m_no = " + m_no);
		cm_commentVO.setM_no(m_no);

		contentService.insertCommentT(cm_commentVO);
		contentService.updatePoint(cm_commentVO);
			
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
	
	// 중고거래 대댓글 view
	@RequestMapping(value = "/reply_view_t", method = RequestMethod.GET)
	public String reply_view_t(HttpServletRequest request, Model model, @ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO) {
		System.out.println("reply_view_t");
		
		String cm_no = request.getParameter("cm_no");
		System.out.println("cm_no : "+cm_no);

		model.addAttribute("comment_view", contentService.selectCommentT(cm_no));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
		
		// 보련이가 로그인한 회원 m_no 받는거 해주면 받아오기
		int m_no = 9;
		model.addAttribute("m_no", m_no);

		return "content/reply_view_t";
	}
	
	// 중고거래 대댓글 쓰기(update + insert)
	@RequestMapping(value = "/reply_t", method = RequestMethod.GET)
	public String reply_t(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO, Model model, @RequestParam("m_no") int m_no) {
		System.out.println("reply_t");
		
		System.out.println("m_no = " + m_no);
		cm_commentVO.setM_no(m_no);
		
		contentService.writeReplyT(cm_commentVO);
		contentService.updatePoint(cm_commentVO);
		
		return "content/reply_success";
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

		
		// 보련이가 로그인한 회원 m_no 받는거 해주면 받아오기
		int m_no = 9;
		model.addAttribute("m_no", m_no);

		//게임이름, 번호 불러오기.
		model.addAttribute("gameName", boardService.selectGameNameCR(cr_no));


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
	public String report_cr(ReportVO reportVO, Model model, Cafe_reviewVO cafe_reviewVO, HttpServletRequest request) {
		System.out.println("report_cr");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportCR(reportVO);
		
		// 카페리뷰 신고수 증가
		contentService.updateReportCR(cafe_reviewVO);
		
		int cr_report_num = Integer.parseInt(request.getParameter("cr_report_num"));
		
		model.addAttribute("content_view_cr", contentService.selectContentCROne(cr_report_num));
		
		if (cr_report_num == 6) {
			contentService.updateIslandCR(cafe_reviewVO);
		}
		
		return "content/report_success";
	}
	
	// 카페리뷰 회원 신고글 view
	@RequestMapping(value = "/report_view_m_cr", method = RequestMethod.GET)
	public String report_view_m_cr(HttpServletRequest request, Model model) {
		System.out.println("report_view_m_cr");

		int m_no = Integer.parseInt(request.getParameter("m_no"));

		System.out.println(m_no);

		model.addAttribute("member_view", contentService.selectContentM(m_no));
				
		// content_view_cr로 redirect를 위해서
		int cr_no = Integer.parseInt(request.getParameter("cr_no"));
				
		model.addAttribute("content_view_cr", contentService.selectContentCROne(cr_no));

		return "content/report_view_m_cr";
	}

	// 카페리뷰 회원 신고글 쓰기
	@RequestMapping(value = "/report_m_cr", method = RequestMethod.GET)
	public String report_m_cr(@ModelAttribute("reportVO") ReportVO reportVO, Model model, MemberVO memberVO,
									HttpServletRequest request, @RequestParam int cr_no, RedirectAttributes re) {
		System.out.println("report_m_cr");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportM(reportVO);
				
		// 회원 신고수 증가
		contentService.updateReportM(memberVO);
				
		// content_view로 redirect를 위해서
		re.addAttribute("cr_no", cr_no);
				
		// 회원 등급 4로 변경
		int m_report_num = Integer.parseInt(request.getParameter("m_report_num"));
				
		model.addAttribute("member_view", contentService.selectContentM(m_report_num));
				
		if(m_report_num == 6) {
			contentService.updateIslandM(memberVO);
		}

		return "redirect:content_view_cr";
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
	/*
	 * @RequestMapping(value = "/comment_write_view_cr", method = RequestMethod.GET)
	 * public String comment_write_view_cr(HttpServletRequest request, Model model,
	 * CM_commentVO cm_commentVO) { System.out.println("comment_write_view_cr");
	 * 
	 * int cr_no = Integer.parseInt(request.getParameter("cr_no"));
	 * 
	 * System.out.println(cr_no);
	 * 
	 * model.addAttribute("content_view_cr",
	 * contentService.selectContentCROne(cr_no)); model.addAttribute("cr_no",
	 * cr_no); System.out.println(cm_commentVO.getCm_no2());
	 * 
	 * contentService.insertCommentCR(cm_commentVO);
	 * 
	 * return "content/comment_write_cr"; }
	 */

	// 카페리뷰 댓글 쓰기
	@RequestMapping(value = "/comment_write_cr", method = RequestMethod.POST)
	public String comment_write_cr(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO,
										Model model, @RequestParam int cr_no, @RequestParam("m_no") int m_no, RedirectAttributes re) {
		System.out.println("comment_write_cr");

		System.out.println(cm_commentVO.getCm_no2());
		
		System.out.println("m_no = " + m_no);
		cm_commentVO.setM_no(m_no);

		contentService.insertCommentCR(cm_commentVO);
		contentService.updatePoint(cm_commentVO);
			
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
		System.out.println("comment_delete_cr");
				
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
	
	// 카페리뷰 대댓글 view
	@RequestMapping(value = "/reply_view_cr", method = RequestMethod.GET)
	public String reply_view_cr(HttpServletRequest request, Model model, @ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO) {
		System.out.println("reply_view_cr");
		
		String cm_no = request.getParameter("cm_no");
		System.out.println("cm_no : "+cm_no);

		model.addAttribute("comment_view", contentService.selectCommentCR(cm_no));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
		
		// 보련이가 로그인한 회원 m_no 받는거 해주면 받아오기
		int m_no = 9;
		model.addAttribute("m_no", m_no);

		return "content/reply_view_cr";
	}
	
	// 카페리뷰 대댓글 쓰기(update + insert)
	@RequestMapping(value = "/reply_cr", method = RequestMethod.GET)
	public String reply_cr(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO, @RequestParam("m_no") int m_no, Model model) {
		System.out.println("reply_cr");
		
		System.out.println("m_no = " + m_no);
		cm_commentVO.setM_no(m_no);
		
		contentService.writeReplyCR(cm_commentVO);
		contentService.updatePoint(cm_commentVO);
		
		return "content/reply_success";
	}
	
	
	/*============================== 한줄평 ===================================*/
	
	// 한줄평 댓글 목록 view
	@RequestMapping(value = "/comment_view_or", method = RequestMethod.GET)
	public String comment_view_or(Model model, HttpServletRequest request, CM_commentVO cm_commentVO) {
		System.out.println("comment_view_or");
					
		String cm_no2 = request.getParameter("cm_no2");
		System.out.println("cm_no2 : "+cm_no2);

		model.addAttribute("comment_list_or", contentService.selectCommentListOR(cm_no2));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
		
		// 보련이가 로그인한 회원 m_no 받는거 해주면 받아오기
		int m_no = 9;
		model.addAttribute("m_no", m_no);
			
		// 카페리뷰 댓글 갯수 세기
		model.addAttribute("comment_count_or", contentService.selectCommentCountOR(cm_no2));
				  
		return "content/comment_view_or"; 
	}
	
	// 한줄평 댓글 쓰기 view
	@RequestMapping(value = "/comment_write_view_or", method = RequestMethod.POST)
	public String comment_write_view_or(HttpServletRequest request, Model model, CM_commentVO cm_commentVO) {
		System.out.println("comment_write_view_or");

		int c_no = Integer.parseInt(request.getParameter("c_no"));

		System.out.println("c_no: "+c_no);

		model.addAttribute("cafe_info", boardService.selectCafeInfo(c_no));
		model.addAttribute("c_no", c_no);
		System.out.println(cm_commentVO.getCm_no2());
		
		contentService.insertCommentOR(cm_commentVO);

		return "content/comment_write_or";
	}

	// 한줄평 댓글 쓰기
	@RequestMapping(value = "/comment_write_or", method = RequestMethod.GET)
	public String comment_write_or(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO,
											Model model, @RequestParam int c_no, @RequestParam("m_no") int m_no, RedirectAttributes re) {
		System.out.println("comment_write_or");

		System.out.println(cm_commentVO.getCm_no2());
		
		System.out.println("m_no = " + m_no);
		cm_commentVO.setM_no(m_no);

		contentService.insertCommentOR(cm_commentVO);
		contentService.updatePoint(cm_commentVO);
				
		re.addAttribute("c_no", c_no);

		return "redirect:/cafe_info";
	}
	
	// 한줄평 댓글 수정하기 view
	@RequestMapping(value = "/comment_modify_view_or", method = RequestMethod.GET)
	public String comment_modify_view_or(HttpServletRequest request, Model model, CM_commentVO cm_commentVO) {
		System.out.println("comment_modify_view_or");
			
		String cm_no = request.getParameter("cm_no");
		System.out.println("cm_no : "+cm_no);
			
		model.addAttribute("comment_modi_or", contentService.selectCommentOR(cm_no));
		model.addAttribute("memberVO",cm_commentVO.getMemberVO());
				
		return "content/comment_modify_view_or";
	}
			
	// 한줄평 댓글 수정
	@RequestMapping(value = "/comment_modify_or", method = RequestMethod.GET)
	public String comment_modify_or(CM_commentVO cm_commentVO, Model model) {
		System.out.println("comment_modify_or");
				
		contentService.updateCommentOROne(cm_commentVO);
				
		return "content/comment_modi_success";
	}
	
	// 한줄평 댓글 삭제
	@RequestMapping(value = "/comment_delete_or", method = RequestMethod.GET)
	public String comment_delete_or(@ModelAttribute("cm_commentVO") CM_commentVO cm_commentVO, 
											Model model, @RequestParam int c_no, RedirectAttributes re) {
		System.out.println("comment_delete_or");
				
		contentService.deleteCommentCR(cm_commentVO);
			
		re.addAttribute("c_no", c_no);
					
		return "redirect:/cafe_info";
	}
	
	// 한줄평 댓글 추천수 증가
	@ResponseBody
	@RequestMapping(value = "/rec_cm_or", method = RequestMethod.GET)
	public String recommend_cm_or(String cm_no, Model model) {
		System.out.println("recommend_cm_or");

		contentService.upRecommendCommentOR(cm_no);

		return contentService.selectRecommendCommentOR(cm_no);
	}
	
	// 한줄평 회원 신고글 view
	@RequestMapping(value = "/report_view_m_or", method = RequestMethod.GET)
	public String report_view_m_or(HttpServletRequest request, Model model) {
		System.out.println("report_view_m_or");

		int m_no = Integer.parseInt(request.getParameter("m_no"));

		System.out.println(m_no);

		model.addAttribute("member_view", contentService.selectContentM(m_no));
				
		// content_view_cr로 redirect를 위해서
		int c_no = Integer.parseInt(request.getParameter("c_no"));
				
		model.addAttribute("cafe_info", boardService.selectCafeInfo(c_no));

		return "content/report_view_m_or";
	}

	// 한줄평 회원 신고글 쓰기
	@RequestMapping(value = "/report_m_or", method = RequestMethod.GET)
	public String report_m_or(@ModelAttribute("reportVO") ReportVO reportVO, Model model, MemberVO memberVO,
									HttpServletRequest request, @RequestParam int c_no, RedirectAttributes re) {
		System.out.println("report_m_or");

		System.out.println(reportVO.getR_type_no());

		contentService.insertReportM(reportVO);
				
		// 회원 신고수 증가
		contentService.updateReportM(memberVO);
				
		// content_view로 redirect를 위해서
		re.addAttribute("c_no", c_no);
				
		// 회원 등급 4로 변경
		int m_report_num = Integer.parseInt(request.getParameter("m_report_num"));
				
		model.addAttribute("member_view", contentService.selectContentM(m_report_num));
				
		if(m_report_num == 6) {
			contentService.updateIslandM(memberVO);
		}

		return "redirect:cafe_info";
	}
	
	
	/*================================= 게임 상세정보 =================================*/
	
	// 게임 상세정보 view
	@RequestMapping(value = "/game_detail", method = RequestMethod.GET)
	public String game_detail(Model model, HttpServletRequest request, @ModelAttribute("gameVO") GameVO gameVO,
							@RequestParam("g_no") int pageNumG) {
		System.out.println("game_detail");

		int g_no = Integer.parseInt(request.getParameter("g_no"));
		
		// game_info에서 g_no 받아 오기(내가 임의로 1 집어넣음)
		g_no = 2;
		model.addAttribute("g_no", g_no);
				
		System.out.println("g_no: "+g_no);
		gameVO.setG_no(g_no);

		// 게임 상세보기 view 
		model.addAttribute("game_detail_view", contentService.selectGameDetailOne(g_no));
		model.addAttribute("game_person_list", contentService.selectGamePersonDetail(g_no));
		
		// 게임 상세정보 투표 결과 view
		model.addAttribute("game_detail_avg_view", contentService.selectGameDetailAvg(g_no)); 
		
		// 게시글 조회수
		/* contentService.upHitContent(bw_no); */

		return "game_detail/game_detail";
	}
	
	// 게임 상세정보 투표
	@RequestMapping(value = "/game_vote", method = RequestMethod.GET)
	public String game_vote(@ModelAttribute("gameVO") GameVO gameVO, @ModelAttribute("game_personVO") Game_personVO game_personVO,
							@RequestParam int g_no, RedirectAttributes re, Model model) {
		System.out.println("game_vote");
		
		// game 테이블 투표
		contentService.updateGame(gameVO);
		
		int g_num = gameVO.getG_num();

		System.out.println("g_num: "+g_num);
		
		// 추천인원 투표 시 insert 
		if(g_num == 0) {
			contentService.insertGamePerson(game_personVO); // 처음 한 번만 실행해야 함.
			contentService.updateGamePerson(game_personVO); // game_person 테이블 투표
		} else {
			contentService.updateGamePerson(game_personVO); // game_person 테이블 투표
		}
		
		re.addAttribute("g_no", g_no);
					
		return "redirect:/game_detail";
	}
}
