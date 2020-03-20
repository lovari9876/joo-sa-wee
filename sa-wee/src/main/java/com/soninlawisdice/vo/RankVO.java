package com.soninlawisdice.vo;

// 회원등급
public class RankVO {
	int r_no; // 등급 번호
	String r_name; // 등급 이름

	public RankVO() {
	}

	public RankVO(int r_no, String r_name) {
		super();
		this.r_no = r_no;
		this.r_name = r_name;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}	

}
