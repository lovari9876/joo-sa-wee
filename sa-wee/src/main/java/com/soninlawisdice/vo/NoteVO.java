package com.soninlawisdice.vo;

import java.sql.Timestamp;

public class NoteVO {
	
	private int n_no;
	private int m_no;
	private int m_no2;
	private String n_title;
	private String n_content;
	private Timestamp n_written_date;
	private int n_check;

	MemberVO memberVO;

	
	public NoteVO() {}
	
	
	public NoteVO(int n_no, int m_no, int m_no2, String n_title, String n_content, Timestamp n_written_date, int n_check,
			MemberVO memberVO) {
		super();
		this.n_no = n_no;
		this.m_no = m_no;
		this.m_no2 = m_no2;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_written_date = n_written_date;
		this.n_check = n_check;
		this.memberVO = memberVO;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public int getM_no2() {
		return m_no2;
	}

	public void setM_no2(int m_no2) {
		this.m_no2 = m_no2;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Timestamp getN_written_date() {
		return n_written_date;
	}

	public void setN_written_date(Timestamp n_written_date) {
		this.n_written_date = n_written_date;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public int getN_check() {
		return n_check;
	}

	public void setN_check(int n_check) {
		this.n_check = n_check;
	}

}
