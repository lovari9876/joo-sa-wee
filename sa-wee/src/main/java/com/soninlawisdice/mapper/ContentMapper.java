package com.soninlawisdice.mapper;

import com.soninlawisdice.vo.Board_writeVO;

public interface ContentMapper {
	
	public Board_writeVO selectContentOne(String bw_no); // 게시글 보기 content_view
}
