package com.soninlawisdice.vo;

import java.sql.Timestamp;

// 무인도 게시판: 3개의 vo를 합쳐서 하나의 LIST로 출력하도록 한다.
public class IslandVO implements Comparable<IslandVO> {
	private int i_no; // 게시글번호
	private int bt_no; // 게시판번호
	private int s_no; // 말머리번호
	private int m_no; // 회원번호
	private String i_title; // 글 제목
	private String i_content; // 글 내용
	private Timestamp i_written_date; // 작성일
	private Timestamp i_updated_date; // 수정일
	private int i_hit; // 조회수
	private int i_recommend_num; // 추천수
	private int i_report_num; // 신고수
	private int i_island; // 무인도여부

	// for join
	private Board_typeVO board_typeVO;
	private SubjectVO subjectVO;
	private MemberVO memberVO;

	// 작성일 기준 최신순 정렬을 위한 메서드 (내림차순)
	@Override
	public int compareTo(IslandVO iListVO) {
		return this.i_written_date.compareTo(iListVO.i_written_date) * -1;
	}

	// constructors
	public IslandVO() {
	}	

	public IslandVO(int i_no, int bt_no, int s_no, int m_no, String i_title, String i_content, Timestamp i_written_date,
			Timestamp i_updated_date, int i_hit, int i_recommend_num, int i_report_num, int i_island,
			Board_typeVO board_typeVO, SubjectVO subjectVO, MemberVO memberVO) {
		super();
		this.i_no = i_no;
		this.bt_no = bt_no;
		this.s_no = s_no;
		this.m_no = m_no;
		this.i_title = i_title;
		this.i_content = i_content;
		this.i_written_date = i_written_date;
		this.i_updated_date = i_updated_date;
		this.i_hit = i_hit;
		this.i_recommend_num = i_recommend_num;
		this.i_report_num = i_report_num;
		this.i_island = i_island;
		this.board_typeVO = board_typeVO;
		this.subjectVO = subjectVO;
		this.memberVO = memberVO;
	}

	// getters and setters
	public int getI_no() {
		return i_no;
	}

	public void setI_no(int i_no) {
		this.i_no = i_no;
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

	public String getI_title() {
		return i_title;
	}

	public void setI_title(String i_title) {
		this.i_title = i_title;
	}

	public String getI_content() {
		return i_content;
	}

	public void setI_content(String i_content) {
		this.i_content = i_content;
	}

	public Timestamp getI_written_date() {
		return i_written_date;
	}

	public void setI_written_date(Timestamp i_written_date) {
		this.i_written_date = i_written_date;
	}

	public Timestamp getI_updated_date() {
		return i_updated_date;
	}

	public void setI_updated_date(Timestamp i_updated_date) {
		this.i_updated_date = i_updated_date;
	}

	public int getI_hit() {
		return i_hit;
	}

	public void setI_hit(int i_hit) {
		this.i_hit = i_hit;
	}

	public int getI_recommend_num() {
		return i_recommend_num;
	}

	public void setI_recommend_num(int i_recommend_num) {
		this.i_recommend_num = i_recommend_num;
	}

	public int getI_report_num() {
		return i_report_num;
	}

	public void setI_report_num(int i_report_num) {
		this.i_report_num = i_report_num;
	}

	public int getI_island() {
		return i_island;
	}

	public void setI_island(int i_island) {
		this.i_island = i_island;
	}

	public Board_typeVO getBoard_typeVO() {
		return board_typeVO;
	}

	public void setBoard_typeVO(Board_typeVO board_typeVO) {
		this.board_typeVO = board_typeVO;
	}

	public SubjectVO getSubjectVO() {
		return subjectVO;
	}

	public void setSubjectVO(SubjectVO subjectVO) {
		this.subjectVO = subjectVO;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}


}

//  번호	분류	제목	작성일	 조회	추천