package com.soninlawisdice.vo;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReportVO {
	private int r_no;
	private int m_no;
	private String r_type;
	private int r_type_no;
	private String r_content;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Timestamp r_report_date;
	
	
	public ReportVO() {}
	
	
	public ReportVO(int r_no, int m_no, String r_type, int r_type_no, String r_content, Timestamp r_report_date) {
		super();
		this.r_no = r_no;
		this.m_no = m_no;
		this.r_type = r_type;
		this.r_type_no = r_type_no;
		this.r_content = r_content;
		this.r_report_date = r_report_date;
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
	
	
	
	
	
}
