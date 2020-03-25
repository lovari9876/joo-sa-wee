package com.soninlawisdice.vo;

public class WD_recordVO {
	int m_no;
	int w_no;
	String wr_reason;
	
	MemberVO memberVO;
	WithdrawalVO withdrawalVO;
	
	
	public WD_recordVO() {}
	
	

	public WD_recordVO(int m_no, int w_no, String wr_reason, MemberVO memberVO, WithdrawalVO withdrawalVO) {
		super();
		this.m_no = m_no;
		this.w_no = w_no;
		this.wr_reason = wr_reason;
		this.memberVO = memberVO;
		this.withdrawalVO = withdrawalVO;
	}


	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getW_no() {
		return w_no;
	}
	public void setW_no(int w_no) {
		this.w_no = w_no;
	}
	public String getWr_reason() {
		return wr_reason;
	}
	public void setWr_reason(String wr_reason) {
		this.wr_reason = wr_reason;
	}
	
	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public WithdrawalVO getWithdrawalVO() {
		return withdrawalVO;
	}

	public void setWithdrawalVO(WithdrawalVO withdrawalVO) {
		this.withdrawalVO = withdrawalVO;
	}

	
	
	
	

}
