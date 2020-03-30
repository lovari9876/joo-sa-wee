package com.soninlawisdice.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReportVO {
	int r_no;
	int m_no;
	String r_type;
	int r_type_no;
	String r_content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd", timezone = "Asia/Seoul")	
	Timestamp r_report_date;
	
	MemberVO memberVO;
	Board_writeVO board_writeVO;
	CM_commentVO cm_commentVO;
	
	public ReportVO() {}
	
	
	public ReportVO(int r_no, int m_no, String r_type, int r_type_no, String r_content, Timestamp r_report_date,
			MemberVO memberVO, Board_writeVO board_writeVO, CM_commentVO cm_commentVO) {
		super();
		this.r_no = r_no;
		this.m_no = m_no;
		this.r_type = r_type;
		this.r_type_no = r_type_no;
		this.r_content = r_content;
		this.r_report_date = r_report_date;
		this.memberVO = memberVO;
		this.board_writeVO = board_writeVO;
		this.cm_commentVO = cm_commentVO;
	}




	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getR_type() {
		return r_type;
	}
	public void setR_type(String r_type) {
		this.r_type = r_type;
	}
	public int getR_type_no() {
		return r_type_no;
	}
	public void setR_type_no(int r_type_no) {
		this.r_type_no = r_type_no;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Timestamp getR_report_date() {
		return r_report_date;
	}
	public void setR_report_date(Timestamp r_report_date) {
		this.r_report_date = r_report_date;
	}


	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public Board_writeVO getBoard_writeVO() {
		return board_writeVO;
	}


	public void setBoard_writeVO(Board_writeVO board_writeVO) {
		this.board_writeVO = board_writeVO;
	}


	public CM_commentVO getCm_commentVO() {
		return cm_commentVO;
	}

	public void setCm_commentVO(CM_commentVO cm_commentVO) {
		this.cm_commentVO = cm_commentVO;
	}
	
	
	
	
	
}
