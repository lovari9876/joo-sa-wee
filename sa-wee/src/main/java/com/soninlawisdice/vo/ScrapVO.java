package com.soninlawisdice.vo;

import java.sql.Timestamp;

public class ScrapVO {
	private int m_no;
	private String sc_boardtype;
	private int sc_no;
	private Timestamp sc_date;
	
	public ScrapVO() {}

	
	
	
	public ScrapVO(int m_no, String sc_boardtype, int sc_no, Timestamp sc_date) {
		super();
		this.m_no = m_no;
		this.sc_boardtype = sc_boardtype;
		this.sc_no = sc_no;
		this.sc_date = sc_date;
	}




	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getSc_boardtype() {
		return sc_boardtype;
	}

	public void setSc_boardtype(String sc_boardtype) {
		this.sc_boardtype = sc_boardtype;
	}

	public int getSc_no() {
		return sc_no;
	}

	public void setSc_no(int sc_no) {
		this.sc_no = sc_no;
	}

	public Timestamp getSc_date() {
		return sc_date;
	}

	public void setSc_date(Timestamp sc_date) {
		this.sc_date = sc_date;
	}
	
	
	

}
