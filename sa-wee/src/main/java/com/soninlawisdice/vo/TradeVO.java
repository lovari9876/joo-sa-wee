package com.soninlawisdice.vo;

import java.sql.Timestamp;

// 보부상(중고거래 게시판)
public class TradeVO {
	private int t_no; // 게시글번호
	private int bt_no; // 게시판번호
	private int s_no; // 말머리번호
	private int m_no; // 회원 번호
	private String t_title; // 글 제목
	private String t_content; // 글 내용
	private Timestamp t_written_date; // 작성일
	private Timestamp t_updated_date; // 수정일
	private int t_hit; // 조회수
	private int t_recommend_num; // 추천수
	private int t_report_num; // 신고수
	private int t_island; // 무인도 여부
	private int t_price; // 가격

	// for resultMap
	private Board_typeVO board_typeVO;
	private MemberVO memberVO;
	private SubjectVO subjectVO;

	// 무인도 게시판을 위해 작성일 가져오는 메서드
	public Timestamp getWrittenDate() {
		return t_written_date;
	}

	// constructors
	public TradeVO() {
	}

	public TradeVO(int t_no, int bt_no, int s_no, int m_no, String t_title, String t_content, Timestamp t_written_date,
			Timestamp t_updated_date, int t_hit, int t_recommend_num, int t_report_num, int t_island, int t_price,
			Board_typeVO board_typeVO, MemberVO memberVO, SubjectVO subjectVO) {
		super();
		this.t_no = t_no;
		this.bt_no = bt_no;
		this.s_no = s_no;
		this.m_no = m_no;
		this.t_title = t_title;
		this.t_content = t_content;
		this.t_written_date = t_written_date;
		this.t_updated_date = t_updated_date;
		this.t_hit = t_hit;
		this.t_recommend_num = t_recommend_num;
		this.t_report_num = t_report_num;
		this.t_island = t_island;
		this.t_price = t_price;
		this.board_typeVO = board_typeVO;
		this.memberVO = memberVO;
		this.subjectVO = subjectVO;
	}

	// getters and setters
	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public int getBt_no() {
		return bt_no;
	}

	public void setBt_no(int bt_no) {
		this.bt_no = bt_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getT_title() {
		return t_title;
	}

	public void setT_title(String t_title) {
		this.t_title = t_title;
	}

	public String getT_content() {
		return t_content;
	}

	public void setT_content(String t_content) {
		this.t_content = t_content;
	}

	public Timestamp getT_written_date() {
		return t_written_date;
	}

	public void setT_written_date(Timestamp t_written_date) {
		this.t_written_date = t_written_date;
	}

	public Timestamp getT_updated_date() {
		return t_updated_date;
	}

	public void setT_updated_date(Timestamp t_updated_date) {
		this.t_updated_date = t_updated_date;
	}

	public int getT_hit() {
		return t_hit;
	}

	public void setT_hit(int t_hit) {
		this.t_hit = t_hit;
	}

	public int getT_recommend_num() {
		return t_recommend_num;
	}

	public void setT_recommend_num(int t_recommend_num) {
		this.t_recommend_num = t_recommend_num;
	}

	public int getT_report_num() {
		return t_report_num;
	}

	public void setT_report_num(int t_report_num) {
		this.t_report_num = t_report_num;
	}

	public int getT_island() {
		return t_island;
	}

	public void setT_island(int t_island) {
		this.t_island = t_island;
	}

	public int getT_price() {
		return t_price;
	}

	public void setT_price(int t_price) {
		this.t_price = t_price;
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

	public SubjectVO getSubjectVO() {
		return subjectVO;
	}

	public void setSubjectVO(SubjectVO subjectVO) {
		this.subjectVO = subjectVO;
	}

}