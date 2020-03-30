package com.soninlawisdice.mapper;

import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.TradeVO;

public interface ContentMapper {
	
	public Board_writeVO selectContentOne(String bw_no); // 게시글 보기(content_view)
	
	public void deleteContent(Board_writeVO board_writeVO); // 게시글 삭제
	
	public void upHitContent(String bw_no); // 게시글 조회수
	
	public void upRecommendContent(String bw_no); // 게시글 추천수 증가
	
	public String selectRecommendContent(String bw_no); // 게시글 추천수 증가하는 거 받아옴
	
	public void insertReportBW(ReportVO reportVO); // 게시글 신고글 쓰기
	
	public MemberVO selectContentM(String m_no); // m_no를 가져오기 위해
	
	public void insertReportM(ReportVO reportVO); // 회원 신고글 쓰기
	
	public CM_commentVO selectContentCM(String cm_no); // cm_no를 가져오기 위해
	
	public void insertReportCM(ReportVO reportVO); // 댓글 신고글 쓰기
	
	public TradeVO selectContentT(String t_no); // t_no를 가져오기 위해
	
	public void insertReportT(ReportVO reportVO); // 중고거래 신고글 쓰기
	
}
