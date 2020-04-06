package com.soninlawisdice.vo;

// 게임유형
public class Game_classVO {
	private	int	g_no; // 게임번호
	private	String gc_type;	// 유형타입
	private	int	gc_num;	// 유형번호
	
	// constructors
	public Game_classVO() {}

	public Game_classVO(int g_no, String gc_type, int gc_num) {
		this.g_no = g_no;
		this.gc_type = gc_type;
		this.gc_num = gc_num;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public String getGc_type() {
		return gc_type;
	}

	public void setGc_type(String gc_type) {
		this.gc_type = gc_type;
	}

	public int getGc_num() {
		return gc_num;
	}

	public void setGc_num(int gc_num) {
		this.gc_num = gc_num;
	}
	
	
	
	

}
