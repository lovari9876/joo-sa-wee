package com.soninlawisdice.vo;

// 추천인원
public class Game_personVO {
	private	int	g_no; // 게임번호
	private	int	gp_person; // 추천인원
	private	int	gp_num;	// 추천수
	
	// constructors
	public Game_personVO() {}

	public Game_personVO(int g_no, int gp_person, int gp_num) {
		this.g_no = g_no;
		this.gp_person = gp_person;
		this.gp_num = gp_num;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public int getGp_person() {
		return gp_person;
	}

	public void setGp_person(int gp_person) {
		this.gp_person = gp_person;
	}

	public int getGp_num() {
		return gp_num;
	}

	public void setGp_num(int gp_num) {
		this.gp_num = gp_num;
	}
	
	
	
	
}
