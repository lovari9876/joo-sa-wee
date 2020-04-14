package com.soninlawisdice.vo;


// 결제랑 TG_NO 다치 처리 위한 ptg 테이블
public class Payment_trade_gameVO {
	int PTG_NO; // 
	int P_NO; // 결제번호
	int TG_NO; // 결제할 게임, 가격 부르기
	
	// constructors
	public Payment_trade_gameVO() {
	}

	public Payment_trade_gameVO(int pTG_NO, int p_NO, int tG_NO) {
		super();
		PTG_NO = pTG_NO;
		P_NO = p_NO;
		TG_NO = tG_NO;
	}

	// getters and setters
	public int getPTG_NO() {
		return PTG_NO;
	}

	public void setPTG_NO(int pTG_NO) {
		PTG_NO = pTG_NO;
	}

	public int getP_NO() {
		return P_NO;
	}

	public void setP_NO(int p_NO) {
		P_NO = p_NO;
	}

	public int getTG_NO() {
		return TG_NO;
	}

	public void setTG_NO(int tG_NO) {
		TG_NO = tG_NO;
	}



}
