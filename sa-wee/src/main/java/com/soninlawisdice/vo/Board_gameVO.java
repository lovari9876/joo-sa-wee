package com.soninlawisdice.vo;

// 게시판 게임
public class Board_gameVO {
	private	int	bt_no; // 게시판번호
	private	int	g_no; // 글번호
	private	int	bg_wno;	// 게시판_파일글번호
	
	// constructors
	public Board_gameVO() {}

	public Board_gameVO(int bt_no, int g_no, int bg_wno) {
		this.bt_no = bt_no;
		this.g_no = g_no;
		this.bg_wno = bg_wno;
	}

	public int getBt_no() {
		return bt_no;
	}

	public void setBt_no(int bt_no) {
		this.bt_no = bt_no;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public int getBg_wno() {
		return bg_wno;
	}

	public void setBg_wno(int bg_wno) {
		this.bg_wno = bg_wno;
	}
	
	
	
	
	
	
}
