package com.soninlawisdice.vo;

import java.sql.Timestamp;

// 카페 리뷰
public class Cafe_reviewVO {
	private int cr_no; // 게시글번호
	private int bt_no; // 게시판번호
	private int c_no; // 카페번호
	private int m_no; // 회원번호
	private String cr_title; // 글 제목
	private String cr_content; // 글 내용
	private Timestamp cr_written_date; // 작성일
	private Timestamp cr_updated_date; // 수정일
	private int cr_hit; // 조회수
	private int cr_recommend_num; // 추천수
	private int cr_report_num; // 신고수
	private int cr_island; // 무인도여부

	// for resultMap
	private Board_typeVO board_typeVO;
	private MemberVO memberVO;
	private CafeVO cafeVO;

	// constructors
	public Cafe_reviewVO() {
	}

	public Cafe_reviewVO(int cr_no, int bt_no, int c_no, int m_no, String cr_title, String cr_content,
			Timestamp cr_written_date, Timestamp cr_updated_date, int cr_hit, int cr_recommend_num, int cr_report_num,
			int cr_island, Board_typeVO board_typeVO, MemberVO memberVO, CafeVO cafeVO) {
		super();
		this.cr_no = cr_no;
		this.bt_no = bt_no;
		this.c_no = c_no;
		this.m_no = m_no;
		this.cr_title = cr_title;
		this.cr_content = cr_content;
		this.cr_written_date = cr_written_date;
		this.cr_updated_date = cr_updated_date;
		this.cr_hit = cr_hit;
		this.cr_recommend_num = cr_recommend_num;
		this.cr_report_num = cr_report_num;
		this.cr_island = cr_island;
		this.board_typeVO = board_typeVO;
		this.memberVO = memberVO;
		this.cafeVO = cafeVO;
	}

	// getters and setters
	public int getCr_no() {
		return cr_no;
	}

	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}

	public int getBt_no() {
		return bt_no;
	}

	public void setBt_no(int bt_no) {
		this.bt_no = bt_no;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getCr_title() {
		return cr_title;
	}

	public void setCr_title(String cr_title) {
		this.cr_title = cr_title;
	}

	public String getCr_content() {
		return cr_content;
	}

	public void setCr_content(String cr_content) {
		this.cr_content = cr_content;
	}

	public Timestamp getCr_written_date() {
		return cr_written_date;
	}

	public void setCr_written_date(Timestamp cr_written_date) {
		this.cr_written_date = cr_written_date;
	}

	public Timestamp getCr_updated_date() {
		return cr_updated_date;
	}

	public void setCr_updated_date(Timestamp cr_updated_date) {
		this.cr_updated_date = cr_updated_date;
	}

	public int getCr_hit() {
		return cr_hit;
	}

	public void setCr_hit(int cr_hit) {
		this.cr_hit = cr_hit;
	}

	public int getCr_recommend_num() {
		return cr_recommend_num;
	}

	public void setCr_recommend_num(int cr_recommend_num) {
		this.cr_recommend_num = cr_recommend_num;
	}

	public int getCr_report_num() {
		return cr_report_num;
	}

	public void setCr_report_num(int cr_report_num) {
		this.cr_report_num = cr_report_num;
	}

	public int getCr_island() {
		return cr_island;
	}

	public void setCr_island(int cr_island) {
		this.cr_island = cr_island;
	}

	public Board_typeVO getBoard_typeVO() {
		return board_typeVO;
	}

	public void setBoard_typeVO(Board_typeVO board_typeVO) {
		this.board_typeVO = board_typeVO;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public CafeVO getCafeVO() {
		return cafeVO;
	}

	public void setCafeVO(CafeVO cafeVO) {
		this.cafeVO = cafeVO;
	}

}
