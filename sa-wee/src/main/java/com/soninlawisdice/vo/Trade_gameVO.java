package com.soninlawisdice.vo;

// 중고거래_게임정보: 중고거래 글 작성 시 대상게임들이 mutivalue이기에 연결 테이블 생성
public class Trade_gameVO {
	private int tg_no; // id
	private int t_no; // 중고거래 글 번호
	private int g_no; // 게임 번호
	private String tg_name; // 게임 이름
	private int tg_price; // 게임 가격

	// constructors
	public Trade_gameVO() {
	}

	public Trade_gameVO(int tg_no, int t_no, int g_no, String tg_name, int tg_price) {
		super();
		this.tg_no = tg_no;
		this.t_no = t_no;
		this.g_no = g_no;
		this.tg_name = tg_name;
		this.tg_price = tg_price;
	}

	// getters and setters
	public int getTg_no() {
		return tg_no;
	}

	public void setTg_no(int tg_no) {
		this.tg_no = tg_no;
	}

	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public String getTg_name() {
		return tg_name;
	}

	public void setTg_name(String tg_name) {
		this.tg_name = tg_name;
	}

	public int getTg_price() {
		return tg_price;
	}

	public void setTg_price(int tg_price) {
		this.tg_price = tg_price;
	}

}