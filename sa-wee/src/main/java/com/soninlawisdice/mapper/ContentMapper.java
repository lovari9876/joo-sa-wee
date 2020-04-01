package com.soninlawisdice.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.TradeVO;

public interface ContentMapper {
	
	public HashMap<String, Object> selectContentOne(int bw_no); // 게시글 보기(content_view)
	
	public void deleteContent(Board_writeVO board_writeVO); // 게시글 삭제
	
	public void upHitContent(int bw_no); // 게시글 조회수
	
	public void upRecommendContent(String bw_no); // 게시글 추천수 증가
	
	public String selectRecommendContent(String bw_no); // 게시글 추천수 증가하는 거 받아옴
	
	public void insertReportBW(ReportVO reportVO); // 게시글 신고글 쓰기
	
	public MemberVO selectContentM(int m_no); // m_no를 가져오기 위해
	
	public void insertReportM(ReportVO reportVO); // 회원 신고글 쓰기
	
	public CM_commentVO selectContentCM(String cm_no); // cm_no를 가져오기 위해
	
	public void insertReportCM(ReportVO reportVO); // 댓글 신고글 쓰기
	
	public TradeVO selectContentT(String t_no); // t_no를 가져오기 위해
	
	public void insertReportT(ReportVO reportVO); // 중고거래 신고글 쓰기
	
	public Cafe_reviewVO selectContentCR(String cr_no); // cr_no를 가져오기 위해
	
	public void insertReportCR(ReportVO reportVO); // 카페리뷰 신고글 쓰기
	
	public void insertCommentBW(CM_commentVO cm_commentVO); // 게시글 댓글 쓰기
	
	/* public ArrayList<HashMap<String, Object>> commentList(String cm_no); */ // 게시글 댓글 보기
	
	public HashMap<String, Object> selectCommentOne(String cm_no); 
	
}
