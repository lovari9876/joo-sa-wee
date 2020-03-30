package com.soninlawisdice.vo;

// 말머리
public class SubjectVO {

	private int s_no; // 말머리번호
	private int bt_no; // 게시판번호
	private String s_content; // 말머리내용

	public SubjectVO() {
	}

	public SubjectVO(int s_no, int bt_no, String s_content) {
		this.s_no = s_no;
		this.bt_no = bt_no;
		this.s_content = s_content;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public int getBt_no() {
		return bt_no;
	}

	public void setBt_no(int bt_no) {
		this.bt_no = bt_no;
	}

	public String getS_content() {
		return s_content;
	}

	public void setS_content(String s_content) {
		this.s_content = s_content;
	}

}
