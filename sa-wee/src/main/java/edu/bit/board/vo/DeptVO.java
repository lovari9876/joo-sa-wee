package edu.bit.board.vo;

public class DeptVO {
	int deptno;// NOT NULL NUMBER(2) 
	String dname;//           VARCHAR2(14) 
	String loc;//             VARCHAR2(13) 
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}

	
	
}
