package com.soninlawisdice.vo;

// 파일
public class F_fileVO {
	int f_no; // 파일번호
	String f_name; // 파일이름
	String f_type; // 파일타입
	String f_path; // 경로
	String f_use; // 용도

	public F_fileVO() {
	}

	public F_fileVO(int f_no, String f_name, String f_type, String f_path, String f_use) {
		super();
		this.f_no = f_no;
		this.f_name = f_name;
		this.f_type = f_type;
		this.f_path = f_path;
		this.f_use = f_use;
	}

	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_type() {
		return f_type;
	}

	public void setF_type(String f_type) {
		this.f_type = f_type;
	}

	public String getF_path() {
		return f_path;
	}

	public void setF_path(String f_path) {
		this.f_path = f_path;
	}

	public String getF_use() {
		return f_use;
	}

	public void setF_use(String f_use) {
		this.f_use = f_use;
	}

}
