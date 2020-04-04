package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.TradeVO;

public interface ContentMapper {
	
	/*============================== 커뮤니티(일반 게시판) ===================================*/
	public HashMap<String, Object> selectContentOne(int bw_no); // 게시글 보기(content_view)
	
	public void deleteContent(Board_writeVO board_writeVO); // 게시글 삭제
	
	public void upHitContent(int bw_no); // 게시글 조회수
	
	public void upRecommendContent(String bw_no); // 게시글 추천수 증가
	
	public String selectRecommendContent(String bw_no); // 게시글 추천수 증가하는 거 받아옴
	
	public void insertReportBW(ReportVO reportVO); //  게시글 신고글 쓰기
	
	public HashMap<String, Object> selectContentM(int m_no); // m_no를 가져오기 위해
	
	public void insertReportM(ReportVO reportVO); // 회원 신고글 쓰기
	
	public HashMap<String, Object> selectContentCM(int cm_no); // cm_no를 가져오기 위해
	
	public void insertReportCM(ReportVO reportVO); // 댓글 신고글 쓰기
	
	public void insertCommentBW(CM_commentVO cm_commentVO); // 게시글 댓글 쓰기
	
	public HashMap<String, Object> selectCommentOne(String cm_no); // 게시글 댓글 수정하기 view에서 사용
	
	public void updateCommentOne(CM_commentVO cm_commentVO); // 댓글 수정
	
	public ArrayList<HashMap<String, Object>> selectCommentList(String cm_no); // 댓글 목록
	
	public void deleteComment(CM_commentVO cm_commentVO); // 댓글 삭제
	
	public void upRecommendComment(String cm_no); // 댓글 추천수 증가
	
	public String selectRecommendComment(String cm_no); // 댓글 추천수 증가하는 거 받아옴
	

	/*============================== 보부상 ===================================*/
	public HashMap<String, Object> selectContentTOne(int bw_no); // 중고거래 게시글 보기(content_view)
	
	public HashMap<String, Object> selectContentT(int t_no); // t_no를 가져오기 위해
	
	public void insertReportT(ReportVO reportVO); // 중고거래 신고글 쓰기
	
	public void insertCommentT(CM_commentVO cm_commentVO); // 중고거래 댓글 쓰기
	
	public HashMap<String, Object> selectCommentT(String cm_no); // 중고거래 댓글 보기
	
	
	/*============================== 카페리뷰 ===================================*/
	public HashMap<String, Object> selectContentCR(int cr_no); // cr_no를 가져오기 위해
	
	public void insertReportCR(ReportVO reportVO); // 카페리뷰 신고글 쓰기
	
	public void insertCommentCR(CM_commentVO cm_commentVO); // 카페리뷰 댓글 쓰기
	
	public HashMap<String, Object> selectCommentCR(String cm_no); // 카페리뷰 댓글 보기
	
}
