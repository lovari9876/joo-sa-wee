package com.soninlawisdice.vo;

import java.sql.Timestamp;

// 게시글
public class Board_writeVO {
	private int bw_no; // 게시글번호
	private int bt_no; // 게시판번호
	private int s_no; // 말머리번호
	private int m_no; // 회원번호
	private String bw_title; // 글 제목
	private String bw_content; // 글 내용
	private Timestamp bw_written_date; // 작성일
	private Timestamp bw_updated_date; // 수정일
	private int bw_hit; // 조회수
	private int bw_recommend_num; // 추천수
	private int bw_report_num; // 신고수
	private String bw_island; // 무인도여부
	private String bw_secret; // 비밀글여부

	// 무인도 게시판을 위해 작성일 가져오는 메서드
	public Timestamp getWrittenDate() {
		return bw_written_date;
	}
	
	// 생성자
	public Board_writeVO() {
	}

	public Board_writeVO(int bw_no, int bt_no, int s_no, int m_no, String bw_title, String bw_content,
			Timestamp bw_written_date, Timestamp bw_updated_date, int bw_hit, int bw_recommend_num, int bw_report_num,
			String bw_island, String bw_secret) {
		super();
		this.bw_no = bw_no;
		this.bt_no = bt_no;
		this.s_no = s_no;
		this.m_no = m_no;
		this.bw_title = bw_title;
		this.bw_content = bw_content;
		this.bw_written_date = bw_written_date;
		this.bw_updated_date = bw_updated_date;
		this.bw_hit = bw_hit;
		this.bw_recommend_num = bw_recommend_num;
		this.bw_report_num = bw_report_num;
		this.bw_island = bw_island;
		this.bw_secret = bw_secret;
	}

	public int getBw_no() {
		return bw_no;
	}

	public void setBw_no(int bw_no) {
		this.bw_no = bw_no;
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

	public String getBw_title() {
		return bw_title;
	}

	public void setBw_title(String bw_title) {
		this.bw_title = bw_title;
	}

	public String getBw_content() {
		return bw_content;
	}

	public void setBw_content(String bw_content) {
		this.bw_content = bw_content;
	}

	public Timestamp getBw_written_date() {
		return bw_written_date;
	}

	public void setBw_written_date(Timestamp bw_written_date) {
		this.bw_written_date = bw_written_date;
	}

	public Timestamp getBw_updated_date() {
		return bw_updated_date;
	}

	public void setBw_updated_date(Timestamp bw_updated_date) {
		this.bw_updated_date = bw_updated_date;
	}

	public int getBw_hit() {
		return bw_hit;
	}

	public void setBw_hit(int bw_hit) {
		this.bw_hit = bw_hit;
	}

	public int getBw_recommend_num() {
		return bw_recommend_num;
	}

	public void setBw_recommend_num(int bw_recommend_num) {
		this.bw_recommend_num = bw_recommend_num;
	}

	public int getBw_report_num() {
		return bw_report_num;
	}

	public void setBw_report_num(int bw_report_num) {
		this.bw_report_num = bw_report_num;
	}

	public String getBw_island() {
		return bw_island;
	}

	public void setBw_island(String bw_island) {
		this.bw_island = bw_island;
	}

	public String getBw_secret() {
		return bw_secret;
	}

	public void setBw_secret(String bw_secret) {
		this.bw_secret = bw_secret;
	}

}
