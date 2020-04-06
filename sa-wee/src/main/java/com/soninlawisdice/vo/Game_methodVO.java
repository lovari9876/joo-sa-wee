package com.soninlawisdice.vo;

// 테마
public class Game_methodVO {
	private	int	gm_no; // 번호
	private	String	gm_name; // 이름

	// constructors
	public Game_methodVO() {}

	public Game_methodVO(int gm_no, String gm_name) {
		this.gm_no = gm_no;
		this.gm_name = gm_name;
	}

	public int getGm_no() {
		return gm_no;
	}

	public void setGm_no(int gm_no) {
		this.gm_no = gm_no;
	}

	public String getGm_name() {
		return gm_name;
	}

	public void setGm_name(String gm_name) {
		this.gm_name = gm_name;
	}
	
	
	
	
}
