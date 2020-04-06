package com.soninlawisdice.vo;

// 분류
public class Game_sortVO {
	private	int	gs_no; // 번호
	private	String gs_name;	// 이름
	
	// constructors
	public Game_sortVO() {}

	public Game_sortVO(int gs_no, String gs_name) {
		this.gs_no = gs_no;
		this.gs_name = gs_name;
	}

	public int getGs_no() {
		return gs_no;
	}

	public void setGs_no(int gs_no) {
		this.gs_no = gs_no;
	}

	public String getGs_name() {
		return gs_name;
	}

	public void setGs_name(String gs_name) {
		this.gs_name = gs_name;
	}
	
	
	
	
}
