package com.soninlawisdice.vo;

import java.sql.Timestamp;

public class FaqVO {
	private int faq_no;
	private int s_no;
	private String faq_title;
	private String faq_content;
	private Timestamp faq_written_date;
	private Timestamp faq_updated_date;
	private int faq_hit;
	
	SubjectVO subjectVO;

	
	public FaqVO() {}
	
	public FaqVO(int faq_no, int s_no, String faq_title, String faq_content, Timestamp faq_written_date,
			Timestamp faq_updated_date, int faq_hit, SubjectVO subjectVO) {
		super();
		this.faq_no = faq_no;
		this.s_no = s_no;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
		this.faq_written_date = faq_written_date;
		this.faq_updated_date = faq_updated_date;
		this.faq_hit = faq_hit;
		this.subjectVO = subjectVO;
	}

	public int getFaq_no() {
		return faq_no;
	}

	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public Timestamp getFaq_written_date() {
		return faq_written_date;
	}

	public void setFaq_written_date(Timestamp faq_written_date) {
		this.faq_written_date = faq_written_date;
	}

	public Timestamp getFaq_updated_date() {
		return faq_updated_date;
	}

	public void setFaq_updated_date(Timestamp faq_updated_date) {
		this.faq_updated_date = faq_updated_date;
	}

	public int getFaq_hit() {
		return faq_hit;
	}

	public void setFaq_hit(int faq_hit) {
		this.faq_hit = faq_hit;
	}

	public SubjectVO getSubjectVO() {
		return subjectVO;
	}

	public void setSubjectVO(SubjectVO subjectVO) {
		this.subjectVO = subjectVO;
	}
	
	
	
	
	
	
}
