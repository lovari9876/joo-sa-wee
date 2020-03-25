package com.soninlawisdice.mapper;

import com.soninlawisdice.vo.Board_writeVO;

public interface ContentMapper {
	
	public Board_writeVO selectContentOne(String bw_no); // 게시글 보기(content_view)
	
	public void deleteContent(Board_writeVO board_writeVO); // 게시글 삭제
	
	public void upHitContent(String bw_no); // 게시글 조회수
}
