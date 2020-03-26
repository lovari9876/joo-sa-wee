package com.soninlawisdice.vo;

public class WD_recordVO {
	int m_no;
	int w_no;
	String wr_reason;
	
	MemberVO memberVO;
	WithdrawalVO withdrawalVO;
	
	//탈퇴 객관적 사유 통계
	int w_no_count;
	
	
	public int getW_no_count() {
		return w_no_count;
	}



	public void setW_no_count(int w_no_count) {
		this.w_no_count = w_no_count;
	}



	public WD_recordVO() {}
	
	

	


	public WD_recordVO(int m_no, int w_no, String wr_reason, MemberVO memberVO, WithdrawalVO withdrawalVO,
			int w_no_count) {
		super();
		this.m_no = m_no;
		this.w_no = w_no;
		this.wr_reason = wr_reason;
		this.memberVO = memberVO;
		this.withdrawalVO = withdrawalVO;
		this.w_no_count = w_no_count;
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
