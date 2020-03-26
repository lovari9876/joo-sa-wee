package com.soninlawisdice.vo;

import java.sql.Timestamp;

public class CM_commentVO {
	
	private int cm_no; // 댓글 번호
	private int m_no; // 회원 번호
	private String cm_content; // 댓글 내용
	private Timestamp cm_written_date; // 작성일
	private Timestamp cm_updated_date; // 수정일
	private String cm_type; // 게시글 타입, 조건문으로 찾음(자유게시판 'free' 이런식으로)
	private int cm_no2; // 게시글 번호, 조건문으로 찾음(게시글 번호 '1' 이런식으로)
	private int cm_recommend_num; // 추천수
	private int cm_report_num; // 신고수
	private int cm_rating; // 평점, 카페리뷰에 필요한 거
	private int cm_group; // group
	private int cm_step; // step
	private int cm_indent; // indent
	
	public CM_commentVO() {}

	public CM_commentVO(int cm_no, int m_no, String cm_content, Timestamp cm_written_date, Timestamp cm_updated_date,
			String cm_type, int cm_no2, int cm_recommend_num, int cm_report_num, int cm_rating, int cm_group,
			int cm_step, int cm_indent) {
		this.cm_no = cm_no;
		this.m_no = m_no;
		this.cm_content = cm_content;
		this.cm_written_date = cm_written_date;
		this.cm_updated_date = cm_updated_date;
		this.cm_type = cm_type;
		this.cm_no2 = cm_no2;
		this.cm_recommend_num = cm_recommend_num;
		this.cm_report_num = cm_report_num;
		this.cm_rating = cm_rating;
		this.cm_group = cm_group;
		this.cm_step = cm_step;
		this.cm_indent = cm_indent;
	}

	public int getCm_no() {
		return cm_no;
	}

	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getCm_content() {
		return cm_content;
	}

	public void setCm_content(String cm_content) {
		this.cm_content = cm_content;
	}

	public Timestamp getCm_written_date() {
		return cm_written_date;
	}

	public void setCm_written_date(Timestamp cm_written_date) {
		this.cm_written_date = cm_written_date;
	}

	public Timestamp getCm_updated_date() {
		return cm_updated_date;
	}

	public void setCm_updated_date(Timestamp cm_updated_date) {
		this.cm_updated_date = cm_updated_date;
	}

	public String getCm_type() {
		return cm_type;
	}

	public void setCm_type(String cm_type) {
		this.cm_type = cm_type;
	}

	public int getCm_no2() {
		return cm_no2;
	}

	public void setCm_no2(int cm_no2) {
		this.cm_no2 = cm_no2;
	}

	public int getCm_recommend_num() {
		return cm_recommend_num;
	}

	public void setCm_recommend_num(int cm_recommend_num) {
		this.cm_recommend_num = cm_recommend_num;
	}

	public int getCm_report_num() {
		return cm_report_num;
	}

	public void setCm_report_num(int cm_report_num) {
		this.cm_report_num = cm_report_num;
	}

	public int getCm_rating() {
		return cm_rating;
	}

	public void setCm_rating(int cm_rating) {
		this.cm_rating = cm_rating;
	}

	public int getCm_group() {
		return cm_group;
	}

	public void setCm_group(int cm_group) {
		this.cm_group = cm_group;
	}

	public int getCm_step() {
		return cm_step;
	}

	public void setCm_step(int cm_step) {
		this.cm_step = cm_step;
	}

	public int getCm_indent() {
		return cm_indent;
	}

	public void setCm_indent(int cm_indent) {
		this.cm_indent = cm_indent;
	}
	
}
