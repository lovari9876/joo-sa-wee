package com.soninlawisdice.vo;

import java.sql.Timestamp;

// 후원
public class SponsorVO {
	private int sp_no; // 후원번호
	private int m_no; // 회원번호
	private int sp_money; // 후원금액
	private Timestamp sp_date; // 후원일

	public SponsorVO() {
	}

	public SponsorVO(int sp_no, int m_no, int sp_money, Timestamp sp_date) {
		super();
		this.sp_no = sp_no;
		this.m_no = m_no;
		this.sp_money = sp_money;
		this.sp_date = sp_date;
	}

	public int getSp_no() {
		return sp_no;
	}

	public void setSp_no(int sp_no) {
		this.sp_no = sp_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getSp_money() {
		return sp_money;
	}

	public void setSp_money(int sp_money) {
		this.sp_money = sp_money;
	}

	public Timestamp getSp_date() {
		return sp_date;
	}

	public void setSp_date(Timestamp sp_date) {
		this.sp_date = sp_date;
	}

}
