package edu.bit.board.vo;

import java.util.List;

public class DeptEmpVO {
	int deptno;//
	String dname;//          
	String loc;//
	
	List<EmpVO> empList;

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

	public List<EmpVO> getEmpList() {
		return empList;
	}

	public void setEmpList(List<EmpVO> empList) {
		this.empList = empList;
	}
	
	
}
