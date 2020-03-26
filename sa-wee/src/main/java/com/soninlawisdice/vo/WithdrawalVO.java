package com.soninlawisdice.vo;

public class WithdrawalVO {
	int w_no;
	String w_reason;
	
	public WithdrawalVO() {}
	
	public WithdrawalVO(int w_no, String w_reason) {
		super();
		this.w_no = w_no;
		this.w_reason = w_reason;
	}
	
	public int getW_no() {
		return w_no;
	}
	public void setW_no(int w_no) {
		this.w_no = w_no;
	}
	public String getW_reason() {
		return w_reason;
	}
	public void setW_reason(String w_reason) {
		this.w_reason = w_reason;
	}
	
	

}
