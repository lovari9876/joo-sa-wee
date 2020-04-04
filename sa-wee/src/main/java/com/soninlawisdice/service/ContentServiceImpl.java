package com.soninlawisdice.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

	public ContentServiceImpl() {
	}

	public ContentServiceImpl(ContentMapper contentMapper) {
		this.contentMapper = contentMapper;
	}

	/* ============================== 커뮤니티(일반 게시판) =================================== */

	// 게시글 보기(content_view)
	@Override
	public HashMap<String, Object> selectContentOne(int bw_no) {

		return contentMapper.selectContentOne(bw_no);
	}

	// 게시글 삭제
	@Override
	public void deleteContent(Board_writeVO board_writeVO) {

		contentMapper.deleteContent(board_writeVO);
	}

	// 게시글 조회수
	@Override
	public void upHitContent(int bw_no) {

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
	public HashMap<String, Object> selectContentM(int m_no) {

		return contentMapper.selectContentM(m_no);
	}

	// 회원 신고글 쓰기
	@Override
	public void insertReportM(ReportVO reportVO) {

		contentMapper.insertReportM(reportVO);

	}

	// cm_no를 가져오기 위해
	@Override
	public HashMap<String, Object> selectContentCM(int cm_no) {

		return contentMapper.selectContentCM(cm_no);
	}

	// 댓글 신고글 쓰기
	@Override
	public void insertReportCM(ReportVO reportVO) {

		contentMapper.insertReportCM(reportVO);

	}

	// 게시글 댓글 쓰기
	@Override
	public void insertCommentBW(CM_commentVO cm_commentVO) {

		contentMapper.insertCommentBW(cm_commentVO);

	}

	// 게시글 댓글 수정하기 view에서 사용
	@Override
	public HashMap<String, Object> selectCommentOne(String cm_no) {

		return contentMapper.selectCommentOne(cm_no);

	}

	// 댓글 수정
	@Override
	public void updateCommentOne(CM_commentVO cm_commentVO) {

		contentMapper.updateCommentOne(cm_commentVO);

	}

	// 댓글 목록
	@Override
	public ArrayList<HashMap<String, Object>> selectCommentList(String cm_no) {

		return contentMapper.selectCommentList(cm_no);
	}

	// 댓글 삭제
	@Override
	public void deleteComment(CM_commentVO cm_commentVO) {

		contentMapper.deleteComment(cm_commentVO);

	}

	// 댓글 추천수 증가
	@Override
	public void upRecommendComment(String cm_no) {

		contentMapper.upRecommendComment(cm_no);

	}

	// 댓글 추천수 증가하는 거 받아옴
	@Override
	public String selectRecommendComment(String cm_no) {

		return contentMapper.selectRecommendComment(cm_no);
	}

	/* ============================== 보부상 =================================== */

	// // 중고거래 게시글 보기(content_view)
	@Override
	public HashMap<String, Object> selectContentTOne(int bw_no) {
		
		return contentMapper.selectContentTOne(bw_no);
	}
	
	
	// t_no를 가져오기 위해
	@Override
	public HashMap<String, Object> selectContentT(int t_no) {

		return contentMapper.selectContentT(t_no);
	}

	// 중고거래 신고글 쓰기
	@Override
	public void insertReportT(ReportVO reportVO) {

		contentMapper.insertReportT(reportVO);

	}

	// 중고거래 댓글 쓰기
	@Override
	public void insertCommentT(CM_commentVO cm_commentVO) {

		contentMapper.insertCommentT(cm_commentVO);

	}

	// 중고거래 댓글 보기
	@Override
	public HashMap<String, Object> selectCommentT(String cm_no) {

		return contentMapper.selectCommentT(cm_no);
	}

	/* ============================== 카페리뷰 =================================== */

	// cr_no를 가져오기 위해
	@Override
	public HashMap<String, Object> selectContentCR(int cr_no) {

		return contentMapper.selectContentCR(cr_no);
	}

	// 카페리뷰 신고글 쓰기
	@Override
	public void insertReportCR(ReportVO reportVO) {

		contentMapper.insertReportCR(reportVO);

	}

	// 카페리뷰 댓글 쓰기
	@Override
	public void insertCommentCR(CM_commentVO cm_commentVO) {

		contentMapper.insertCommentCR(cm_commentVO);

	}

	// 카페리뷰 댓글 보기
	@Override
	public HashMap<String, Object> selectCommentCR(String cm_no) {

		return contentMapper.selectCommentCR(cm_no);
	}

	

}
