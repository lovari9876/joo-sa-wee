package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.TradeVO;

public interface ContentService {
	
	/*============================== 커뮤니티(일반 게시판) ===================================*/
	public HashMap<String, Object> selectContentOne(int bw_no); // 게시글 보기(content_view)
	
	public void deleteContent(Board_writeVO board_writeVO); // 게시글 삭제
	
	public void upHitContent(int bw_no); // 게시글 조회수
	
	public void upRecommendContent(String bw_no); // 게시글 추천수 증가
	
	public String selectRecommendContent(String bw_no); // 게시글 추천수 증가하는 거 받아옴
	
	public void insertReportBW(ReportVO reportVO); //  게시글 신고글 쓰기
	
	public void updateReportBW(Board_writeVO board_writeVO); // 게시글 신고수 증가
	
	public void updateIslandBW(Board_writeVO board_writeVO); // 게시글 아일랜드 1로 변경
	
	public HashMap<String, Object> selectContentM(int m_no); // m_no를 가져오기 위해
	
	public void insertReportM(ReportVO reportVO); // 회원 신고글 쓰기
	
	public void updateReportM(MemberVO memberVO); // 회원 신고수 증가
	
	public void updateIslandM(MemberVO memberVO); // 회원 등급 4로 변경
	
	public HashMap<String, Object> selectContentCM(int cm_no); // cm_no를 가져오기 위해
	
	public void insertReportCM(ReportVO reportVO); // 댓글 신고글 쓰기
	
	public void updateReportCM(CM_commentVO cm_commentVO); // 댓글 신고수 증가
	
	public void insertCommentBW(CM_commentVO cm_commentVO); // 게시글 댓글 쓰기
	
	public HashMap<String, Object> selectCommentOne(String cm_no); // 게시글 댓글 수정하기 view에서 사용
	
	public void updateCommentOne(CM_commentVO cm_commentVO); // 댓글 수정
	
	public ArrayList<HashMap<String, Object>> selectCommentList(String cm_no); // 댓글 목록
	
	public void deleteComment(CM_commentVO cm_commentVO); // 댓글 삭제
	
	public void upRecommendComment(String cm_no); // 댓글 추천수 증가
	
	public String selectRecommendComment(String cm_no); // 댓글 추천수 증가하는 거 받아옴
	
	public HashMap<String, Object> selectCommentCount(String cm_no2); // 댓글 갯수 세기
	

	/*============================== 보부상 ===================================*/
	// 밑에 3개 뽀려가욘 ^^ 
	public HashMap<String, Object> selectContentTOne(int t_no); // 중고거래 게시글 보기(content_view)
	
	public void deleteContentT(TradeVO tradeVO); // 중고거래 게시글 삭제
	
	public void upHitContentT(int t_no); // 중고거래 게시글 조회수
	
	public void upRecommendContentT(String t_no); // 중고거래 게시글 추천수 증가
	
	public String selectRecommendContentT(String t_no); // 중고거래 게시글 추천수 증가하는 거 받아옴
	
	public void insertReportT(ReportVO reportVO); // 중고거래 신고글 쓰기
	
	public void updateReportT(TradeVO tradeVO); // 중고거래 신고수 증가
	
	public ArrayList<HashMap<String, Object>> selectCommentListT(String cm_no); // 중고거래 댓글 목록
	
	public void insertCommentT(CM_commentVO cm_commentVO); // 중고거래 댓글 쓰기
	
	public HashMap<String, Object> selectCommentT(String cm_no); // 중고거래 댓글 수정하기 view에서 사용
	
	public void updateCommentTOne(CM_commentVO cm_commentVO); // 중고거래 댓글 수정
	
	public void deleteCommentT(CM_commentVO cm_commentVO); // 중고거래 댓글 삭제
	
	public void upRecommendCommentT(String cm_no); // 중고거래 댓글 추천수 증가
	
	public String selectRecommendCommentT(String cm_no); // 중고거래 댓글 추천수 증가하는 거 받아옴
	
	public HashMap<String, Object> selectCommentCountT(String cm_no2); // 중고거래 댓글 갯수 세기
	
	
	/*============================== 카페리뷰 ===================================*/
	public HashMap<String, Object> selectContentCROne(int cr_no); // 카페리뷰 게시글 보기(content_view)
	
	public void deleteContentCR(Cafe_reviewVO cafe_reviewVO); // 카페리뷰 게시글 삭제
	
	public void upHitContentCR(int cr_no); // 카페리뷰 게시글 조회수
	
	public void upRecommendContentCR(String cr_no); // 카페리뷰 게시글 추천수 증가
	
	public String selectRecommendContentCR(String cr_no); // 카페리뷰 게시글 추천수 증가하는 거 받아옴
	
	public void insertReportCR(ReportVO reportVO); // 카페리뷰 신고글 쓰기
	
	public void updateReportCR(Cafe_reviewVO cafe_reviewVO); // 카페리뷰 신고수 증가
	
	public ArrayList<HashMap<String, Object>> selectCommentListCR(String cm_no); // 카페리뷰 댓글 목록
	
	public void insertCommentCR(CM_commentVO cm_commentVO); // 카페리뷰 댓글 쓰기
	
	public HashMap<String, Object> selectCommentCR(String cm_no); // 카페리뷰 댓글 수정하기 view에서 사용
	
	public void updateCommentCROne(CM_commentVO cm_commentVO); // 카페리뷰 댓글 수정
	
	public void deleteCommentCR(CM_commentVO cm_commentVO); // 카페리뷰 댓글 삭제
	
	public void upRecommendCommentCR(String cm_no); // 카페리뷰 댓글 추천수 증가
	
	public String selectRecommendCommentCR(String cm_no); // 카페리뷰 댓글 추천수 증가하는 거 받아옴
	
	public HashMap<String, Object> selectCommentCountCR(String cm_no2); // 카페리뷰 댓글 갯수 세기
}
