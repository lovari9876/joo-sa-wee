package com.soninlawisdice.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class StatisticsVO {
	private int st_no;
	//json에서 타임스탬프값을 숫자로 받아와서 형식지정해주는것..
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Timestamp st_date;
	private int st_visitor_num;
	private int st_post_num;
	private int st_trade_num;
	private int st_comment_num;
	
	public StatisticsVO() {}

	public StatisticsVO(int st_no, Timestamp st_date, int st_visitor_num, int st_post_num, int st_trade_num,
			int st_comment_num) {
		super();
		this.st_no = st_no;
		this.st_date = st_date;
		this.st_visitor_num = st_visitor_num;
		this.st_post_num = st_post_num;
		this.st_trade_num = st_trade_num;
		this.st_comment_num = st_comment_num;
	}

	public int getSt_no() {
		return st_no;
	}

	public void setSt_no(int st_no) {
		this.st_no = st_no;
	}

	public Timestamp getSt_date() {
		return st_date;
	}

	public void setSt_date(Timestamp st_date) {
		this.st_date = st_date;
	}

	public int getSt_visitor_num() {
		return st_visitor_num;
	}

	public void setSt_visitor_num(int st_visitor_num) {
		this.st_visitor_num = st_visitor_num;
	}

	public int getSt_post_num() {
		return st_post_num;
	}

	public void setSt_post_num(int st_post_num) {
		this.st_post_num = st_post_num;
	}

	public int getSt_trade_num() {
		return st_trade_num;
	}

	public void setSt_trade_num(int st_trade_num) {
		this.st_trade_num = st_trade_num;
	}

	public int getSt_comment_num() {
		return st_comment_num;
	}

	public void setSt_comment_num(int st_comment_num) {
		this.st_comment_num = st_comment_num;
	}
	
	
	
	
	
	
	

}
