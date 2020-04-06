package com.soninlawisdice.vo;

// 테마
public class Game_themeVO {
	private	int	gt_no; // 번호
	private	String gt_name; // 이름
	
	// constructors
	public Game_themeVO() {}

	public Game_themeVO(int gt_no, String gt_name) {
		this.gt_no = gt_no;
		this.gt_name = gt_name;
	}

	public int getGt_no() {
		return gt_no;
	}

	public void setGt_no(int gt_no) {
		this.gt_no = gt_no;
	}

	public String getGt_name() {
		return gt_name;
	}

	public void setGt_name(String gt_name) {
		this.gt_name = gt_name;
	}
	
	
	
	
	
}
