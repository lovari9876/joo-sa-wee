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
	
	// 게시글 신고수 증가
	@Override
	public void updateReportBW(Board_writeVO board_writeVO) {
		
		contentMapper.updateReportBW(board_writeVO);
		
	}
	
	// 게시글 아일랜드 1로 변경
	@Override
	public void updateIslandBW(Board_writeVO board_writeVO) {
		
		contentMapper.updateIslandBW(board_writeVO);
		
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
	
	// 회원 신고수 증가
	@Override
	public void updateReportM(MemberVO memberVO) {
		
		contentMapper.updateReportM(memberVO);
		
	}
	
	// 회원 등급 4로 변경
	@Override
	public void updateIslandM(MemberVO memberVO) {
		
		contentMapper.updateIslandM(memberVO);
		
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
	
	// 댓글 신고수 증가
	@Override
	public void updateReportCM(CM_commentVO cm_commentVO) {
		
		contentMapper.updateReportCM(cm_commentVO);
		
	}

	// 게시글 댓글 쓰기
	@Override
	public void insertCommentBW(CM_commentVO cm_commentVO) {

		contentMapper.insertCommentBW(cm_commentVO);

	}
	
	// 댓글쓰면 +5 point
	@Override
	public void updatePoint(CM_commentVO cm_commentVO) {
		
		contentMapper.updatePoint(cm_commentVO);
		
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
	
	// 댓글 갯수 세기
	@Override
	public HashMap<String, Object> selectCommentCount(String cm_no2) {
		
		return contentMapper.selectCommentCount(cm_no2);
	}
	
	// 대댓글 쓰기(update + insert)
	@Override
	public void writeReply(CM_commentVO cm_commentVO) {
		
		contentMapper.updateReply(cm_commentVO); // step +1
		contentMapper.insertReply(cm_commentVO); // 대댓글 쓰기
		
	}
	
	/* ============================== 보부상 =================================== */

	// 게시글 보기, 삭제, 조회수 뽀려가욘^^ 
	// 중고거래 게시글 보기(content_view)
	@Override
	public HashMap<String, Object> selectContentTOne(int t_no) {
		
		return contentMapper.selectContentTOne(t_no);
	}
	
	// 중고거래 게시글 삭제
	@Override
	public void deleteContentT(TradeVO tradeVO) {
		
		contentMapper.deleteContentT(tradeVO);
	}

	// 중고거래 게시글 조회수
	@Override
	public void upHitContentT(int t_no) {
		
		contentMapper.upHitContentT(t_no);	
	}
	/////// 여기까지 뽀려가욘
	
	// 중고거래 게시글 추천수 증가
	@Override
	public void upRecommendContentT(String t_no) {
		
		contentMapper.upRecommendContentT(t_no);
	}

	// 중고거래 게시글 추천수 증가하는 거 받아옴
	@Override
	public String selectRecommendContentT(String t_no) {

		return contentMapper.selectRecommendContentT(t_no);
	}

	// 중고거래 신고글 쓰기
	@Override
	public void insertReportT(ReportVO reportVO) {

		contentMapper.insertReportT(reportVO);

	}
	
	// 중고거래 신고수 증가
	@Override
	public void updateReportT(TradeVO tradeVO) {
		
		contentMapper.updateReportT(tradeVO);
		
	}
	
	// 중고거래 아일랜드 1로 변경
	@Override
	public void updateIslandT(TradeVO tradeVO) {
	
		contentMapper.updateIslandT(tradeVO);
		
	}
	
	// 중고거래 댓글 목록
	@Override
	public ArrayList<HashMap<String, Object>> selectCommentListT(String cm_no) {
		
		return contentMapper.selectCommentListT(cm_no);
	}

	// 중고거래 댓글 쓰기
	@Override
	public void insertCommentT(CM_commentVO cm_commentVO) {

		contentMapper.insertCommentT(cm_commentVO);

	}

	// 중고거래 댓글 수정하기 view에서 사용
	@Override
	public HashMap<String, Object> selectCommentT(String cm_no) {

		return contentMapper.selectCommentT(cm_no);
	}
	
	// 중고거래 댓글 수정
	@Override
	public void updateCommentTOne(CM_commentVO cm_commentVO) {
		
		contentMapper.updateCommentTOne(cm_commentVO);
		
	}
	
	// 중고거래 댓글 삭제
	@Override
	public void deleteCommentT(CM_commentVO cm_commentVO) {
		
		contentMapper.deleteCommentT(cm_commentVO);
		
	}
	
	// 중고거래 댓글 추천수 증가
	@Override
	public void upRecommendCommentT(String cm_no) {
		
		contentMapper.upRecommendCommentT(cm_no);
		
	}

	// 중고거래 댓글 추천수 증가하는 거 받아옴
	@Override
	public String selectRecommendCommentT(String cm_no) {
		
		return contentMapper.selectRecommendCommentT(cm_no);
	}
	
	// 중고거래 댓글 갯수 세기
	@Override
	public HashMap<String, Object> selectCommentCountT(String cm_no2) {
		
		return contentMapper.selectCommentCountT(cm_no2);
	}
	
	// 중고거래 대댓글 쓰기(update+insert)
	@Override
	public void writeReplyT(CM_commentVO cm_commentVO) {
		
		contentMapper.updateReplyT(cm_commentVO);
		contentMapper.insertReplyT(cm_commentVO);
		
	}


	/* ============================== 카페리뷰 =================================== */

	// 카페리뷰 게시글 보기(content_view)
	@Override
	public HashMap<String, Object> selectContentCROne(int cr_no) {
		
		return contentMapper.selectContentCROne(cr_no);
	}
	
	// 카페리뷰 게시글 삭제
	@Override
	public void deleteContentCR(Cafe_reviewVO cafe_reviewVO) {
		
		contentMapper.deleteContentCR(cafe_reviewVO);
		
	}
	
	// 카레리뷰 게시글 조회수
	@Override
	public void upHitContentCR(int cr_no) {
		
		contentMapper.upHitContentCR(cr_no);
		
	}
	
	// 카페리뷰 게시글 추천수 증가
	@Override
	public void upRecommendContentCR(String cr_no) {
		
		contentMapper.upRecommendContentCR(cr_no);
		
	}

	// 카페리뷰 게시글 추천수 증가하는 거 받아옴
	@Override
	public String selectRecommendContentCR(String cr_no) {
		
		return contentMapper.selectRecommendContentCR(cr_no);
	}

	// 카페리뷰 신고글 쓰기
	@Override
	public void insertReportCR(ReportVO reportVO) {

		contentMapper.insertReportCR(reportVO);

	}
	
	// 카페리뷰 신고수 증가
	@Override
	public void updateReportCR(Cafe_reviewVO cafe_reviewVO) {
		
		contentMapper.updateReportCR(cafe_reviewVO);
		
	}
	
	// 카페리뷰 아일랜드 1로 변경
	@Override
	public void updateIslandCR(Cafe_reviewVO cafe_reviewVO) {
		
		contentMapper.updateIslandCR(cafe_reviewVO);
		
	}

	
	// 카페리뷰 댓글 목록
	@Override
	public ArrayList<HashMap<String, Object>> selectCommentListCR(String cm_no) {
		
		return contentMapper.selectCommentListCR(cm_no);
	}

	// 카페리뷰 댓글 쓰기
	@Override
	public void insertCommentCR(CM_commentVO cm_commentVO) {

		contentMapper.insertCommentCR(cm_commentVO);

	}

	// 카페리뷰 댓글 수정하기 view에서 사용
	@Override
	public HashMap<String, Object> selectCommentCR(String cm_no) {

		return contentMapper.selectCommentCR(cm_no);
	}

	// 카페리뷰 댓글 수정
	@Override
	public void updateCommentCROne(CM_commentVO cm_commentVO) {
		
		contentMapper.updateCommentCROne(cm_commentVO);
		
	}

	// 카페리뷰 댓글 삭제
	@Override
	public void deleteCommentCR(CM_commentVO cm_commentVO) {
		
		contentMapper.deleteCommentCR(cm_commentVO);
		
	}

	// 카페리뷰 댓글 추천수 증가
	@Override
	public void upRecommendCommentCR(String cm_no) {
		
		contentMapper.upRecommendCommentCR(cm_no);
		
	}

	// 카페리뷰 댓글 추천수 증가
	@Override
	public String selectRecommendCommentCR(String cm_no) {
		
		return contentMapper.selectRecommendCommentCR(cm_no);
	}

	// 카페리뷰 댓글 갯수 세기
	@Override
	public HashMap<String, Object> selectCommentCountCR(String cm_no2) {
		
		return contentMapper.selectCommentCountCR(cm_no2);
	}
	
	// 카페리뷰 대댓글 쓰기(update+insert)
	@Override
	public void writeReplyCR(CM_commentVO cm_commentVO) {
		
		contentMapper.updateReplyCR(cm_commentVO);
		contentMapper.insertReplyCR(cm_commentVO);
		
	}

	
	/*================================= 한줄평 =================================*/
	
	// c_no을 가져오기 위해
	@Override
	public HashMap<String, Object> selectContentCOne(int c_no) {
		
		return contentMapper.selectContentCOne(c_no);
	}
	
	// 한줄평 댓글 목록
	@Override
	public ArrayList<HashMap<String, Object>> selectCommentListOR(String cm_no) {
		
		return contentMapper.selectCommentListOR(cm_no);
	}

	// 한줄평 댓글 쓰기
	@Override
	public void insertCommentOR(CM_commentVO cm_commentVO) {
		
		contentMapper.insertCommentOR(cm_commentVO);
		
	}

	// 한줄평 댓글 수정하기 view에서 사용
	@Override
	public HashMap<String, Object> selectCommentOR(String cm_no) {
		
		return contentMapper.selectCommentOR(cm_no);
	}

	// 한줄평 댓글 수정
	@Override
	public void updateCommentOROne(CM_commentVO cm_commentVO) {
		
		contentMapper.updateCommentOROne(cm_commentVO);
		
	}

	// 한줄평 댓글 삭제
	@Override
	public void deleteCommentOR(CM_commentVO cm_commentVO) {
		
		contentMapper.deleteCommentOR(cm_commentVO);
		
	}

	// 한줄평 댓글 추천수 증가
	@Override
	public void upRecommendCommentOR(String cm_no) {
		
		contentMapper.upRecommendCommentOR(cm_no);
		
	}
	
	// 한줄평 댓글 추천수 증가하는 거 받아옴
	@Override
	public String selectRecommendCommentOR(String cm_no) {
		
		return contentMapper.selectRecommendCommentOR(cm_no);
	}

	// 한줄평 댓글 갯수 세기
	@Override
	public HashMap<String, Object> selectCommentCountOR(String cm_no2) {
		
		return contentMapper.selectCommentCountOR(cm_no2);
	}


}
