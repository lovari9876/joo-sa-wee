package com.soninlawisdice.vo;

import java.sql.Timestamp;

public class CafeVO {
	
	private int c_no;	//게시글 번호(카페 번호)
	private int bt_no;	//게시판 번호
	private String c_title;	//글제목(카페이름)
	private String c_add;	//카페 주소
	private String c_phone;	//카페 전화번호
	private int c_people;	//수용인원
	private int c_table;	//테이블 개수
	private int c_chair;	//의자 개수
	private String c_open;	//오픈 시간
	private String c_close;	//마감 시간
	private String c_rest;	//휴일
	private Timestamp c_written_date;	//작성일
	private Timestamp c_updated_date;	//수정일
	private int c_hit;		//조회수
	
	
	public CafeVO() {
		
	}
	
	
	
	public CafeVO(int c_no, int bt_no, String c_title, String c_add, String c_phone, int c_people, int c_table,
			int c_chair, String c_open, String c_close, String c_rest, Timestamp c_written_date,
			Timestamp c_updated_date, int c_hit) {
		super();
		this.c_no = c_no;
		this.bt_no = bt_no;
		this.c_title = c_title;
		this.c_add = c_add;
		this.c_phone = c_phone;
		this.c_people = c_people;
		this.c_table = c_table;
		this.c_chair = c_chair;
		this.c_open = c_open;
		this.c_close = c_close;
		this.c_rest = c_rest;
		this.c_written_date = c_written_date;
		this.c_updated_date = c_updated_date;
		this.c_hit = c_hit;
	}



	public int getC_no() {
		return c_no;
	}



	public void setC_no(int c_no) {
		this.c_no = c_no;
	}



	public int getBt_no() {
		return bt_no;
	}



	public void setBt_no(int bt_no) {
		this.bt_no = bt_no;
	}



	public String getC_title() {
		return c_title;
	}



	public void setC_title(String c_title) {
		this.c_title = c_title;
	}



	public String getC_add() {
		return c_add;
	}



	public void setC_add(String c_add) {
		this.c_add = c_add;
	}



	public String getC_phone() {
		return c_phone;
	}



	public void setC_phone(String c_phone) {
		this.c_phone = c_phone;
	}



	public int getC_people() {
		return c_people;
	}



	public void setC_people(int c_people) {
		this.c_people = c_people;
	}



	public int getC_table() {
		return c_table;
	}



	public void setC_table(int c_table) {
		this.c_table = c_table;
	}



	public int getC_chair() {
		return c_chair;
	}



	public void setC_chair(int c_chair) {
		this.c_chair = c_chair;
	}



	public String getC_open() {
		return c_open;
	}



	public void setC_open(String c_open) {
		this.c_open = c_open;
	}



	public String getC_close() {
		return c_close;
	}



	public void setC_close(String c_close) {
		this.c_close = c_close;
	}



	public String getC_rest() {
		return c_rest;
	}



	public void setC_rest(String c_rest) {
		this.c_rest = c_rest;
	}



	public Timestamp getC_written_date() {
		return c_written_date;
	}



	public void setC_written_date(Timestamp c_written_date) {
		this.c_written_date = c_written_date;
	}



	public Timestamp getC_updated_date() {
		return c_updated_date;
	}



	public void setC_updated_date(Timestamp c_updated_date) {
		this.c_updated_date = c_updated_date;
	}



	public int getC_hit() {
		return c_hit;
	}



	public void setC_hit(int c_hit) {
		this.c_hit = c_hit;
	}
	
	
	
	
	
	
}
