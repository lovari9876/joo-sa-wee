package com.soninlawisdice.vo;

// 게시판 (분류)
public class Board_typeVO {
	int bt_no; // 게시판번호
	String bt_name; // 게시판이름
	String bt_info; // 설명
	String bt_extra; // 비고

	public Board_typeVO() {
	}

	public Board_typeVO(int bt_no, String bt_name, String bt_info, String bt_extra) {
		super();
		this.bt_no = bt_no;
		this.bt_name = bt_name;
		this.bt_info = bt_info;
		this.bt_extra = bt_extra;
	}

	public int getBt_no() {
		return bt_no;
	}

	public void setBt_no(int bt_no) {
		this.bt_no = bt_no;
	}

	public String getBt_name() {
		return bt_name;
	}

	public void setBt_name(String bt_name) {
		this.bt_name = bt_name;
	}

	public String getBt_info() {
		return bt_info;
	}

	public void setBt_info(String bt_info) {
		this.bt_info = bt_info;
	}

	public String getBt_extra() {
		return bt_extra;
	}

	public void setBt_extra(String bt_extra) {
		this.bt_extra = bt_extra;
	}

}
