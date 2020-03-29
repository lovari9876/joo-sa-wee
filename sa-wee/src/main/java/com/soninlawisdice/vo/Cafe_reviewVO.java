package com.soninlawisdice.vo;

import java.sql.Timestamp;

public class Cafe_reviewVO {
	int cr_no;	//게시글 번호
	int bt_no;	//게시판 번호
	int c_no;	//카페 게시글 번호(카페 번호)
	int m_no;	//회원번호
	String cr_title;	//글 제목
	String cr_content;	//글 내용
	Timestamp cr_written_date;	//작성일
	Timestamp cr_updated_date;	//수정일
	int cr_hit;		//조회수
	int cr_recommend_num;	//추천수
	int cr_report_num;		//신고수
	String bw_island;	//무인도 여부
	
	
	public Cafe_reviewVO() {
		
	}


	public Cafe_reviewVO(int cr_no, int bt_no, int c_no, int m_no, String cr_title, String cr_content,
			Timestamp cr_written_date, Timestamp cr_updated_date, int cr_hit, int cr_recommend_num, int cr_report_num,
			String bw_island) {
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
		this.bw_island = bw_island;
	}


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


	public String getBw_island() {
		return bw_island;
	}


	public void setBw_island(String bw_island) {
		this.bw_island = bw_island;
	}
	
	
	
	
	
}
