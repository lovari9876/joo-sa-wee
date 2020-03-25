package com.soninlawisdice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soninlawisdice.mapper.ContentMapper;
import com.soninlawisdice.vo.Board_writeVO;

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

}
