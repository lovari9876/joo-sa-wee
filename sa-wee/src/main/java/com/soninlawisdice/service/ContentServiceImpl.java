package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.ContentMapper;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.Cafe_reviewVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;
import com.soninlawisdice.vo.TradeVO;

@Service("ContentService")
public class ContentServiceImpl implements ContentService {
	
	@Autowired
	ContentMapper contentMapper;
	
	
	public ContentServiceImpl() {}

	public ContentServiceImpl(ContentMapper contentMapper) {
		this.contentMapper = contentMapper;
	}

	// 게시글 보기(content_view)
	@Override
	public Board_writeVO selectContentOne(String bw_no) {
		
		return contentMapper.selectContentOne(bw_no);
	}

	// 게시글 삭제
	@Override
	public void deleteContent(Board_writeVO board_writeVO) {
		
		contentMapper.deleteContent(board_writeVO);
	}

	// 게시글 조회수
	@Override
	public void upHitContent(String bw_no) {
		
		contentMapper.upHitContent(bw_no);
		
	}

	// 게시글 추천수 증가
	@Override
	public void upRecommendContent(String bw_no) {
		
		contentMapper.upRecommendContent(bw_no);
		
	}

	// 게시글 추천수 증가하는 거 받아옴
	@Override
	public String selectRecommendContent(String bw_no) {
		
		return contentMapper.selectRecommendContent(bw_no);
	}
	
	
	// 게시글 신고글 쓰기
	@Override
	public void insertReportBW(ReportVO reportVO) {
		
		contentMapper.insertReportBW(reportVO);
		
	}
	
	// m_no를 가져오기 위해
	@Override
	public MemberVO selectContentM(String m_no) {
		
		return contentMapper.selectContentM(m_no);
	}

	// 회원 신고글 쓰기
	@Override
	public void insertReportM(ReportVO reportVO) {
		
		contentMapper.insertReportM(reportVO);
		
	}
	
	// cm_no를 가져오기 위해
	@Override
	public CM_commentVO selectContentCM(String cm_no) {
		
		return contentMapper.selectContentCM(cm_no);
	}
	
	// 댓글 신고글 쓰기
	@Override
	public void insertReportCM(ReportVO reportVO) {
		
		contentMapper.insertReportCM(reportVO);
		
	}
	
	// t_no를 가져오기 위해
	@Override
	public TradeVO selectContentT(String t_no) {

		return contentMapper.selectContentT(t_no);
	}
	
	// 중고거래 신고글 쓰기
	@Override
	public void insertReportT(ReportVO reportVO) {
		
		contentMapper.insertReportT(reportVO);
		
	}
	
	// cr_no를 가져오기 위해
	@Override
	public Cafe_reviewVO selectContentCR(String cr_no) {
		
		return contentMapper.selectContentCR(cr_no);
	}
	
	// 카페리뷰 신고글 쓰기
	@Override
	public void insertReportCR(ReportVO reportVO) {
		
		contentMapper.insertReportCR(reportVO);
		
	}
	
	// 게시글 댓글 쓰기
	@Override
	public void insertCommentBW(CM_commentVO cm_commentVO) {
		
		contentMapper.insertCommentBW(cm_commentVO);
		
	}

	// 게시글 댓글 보기
	
	/*
	 * @Override public ArrayList<HashMap<String, Object>> commentList(String cm_no)
	 * {
	 * 
	 * return contentMapper.commentList(cm_no); }
	 */
	 

	
	  @Override public CM_commentVO selectCommentOne(String cm_no) {
	  
	  return contentMapper.selectCommentOne(cm_no); }
	 

	
	
	

}
