package com.soninlawisdice.service;

import com.soninlawisdice.vo.Board_writeVO;

public interface ContentService {
	
	public Board_writeVO selectContentOne(String bw_no); // 게시글 보기(content_view)
	
	public void deleteContent(Board_writeVO board_writeVO); // 게시글 삭제
	
	public void upHitContent(String bw_no); // 게시글 조회수
	
	public void upRecommendContent(String bw_no); // 게시글 추천수 증가
	
	public String selectRecommendContent(String bw_no); // 게시글 추천수 증가하는 거 받아옴
}
