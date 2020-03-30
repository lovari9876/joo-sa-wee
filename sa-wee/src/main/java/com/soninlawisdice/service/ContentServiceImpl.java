package com.soninlawisdice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.ContentMapper;
import com.soninlawisdice.vo.Board_writeVO;
import com.soninlawisdice.vo.CM_commentVO;
import com.soninlawisdice.vo.MemberVO;
import com.soninlawisdice.vo.ReportVO;

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

	
	
	

}
