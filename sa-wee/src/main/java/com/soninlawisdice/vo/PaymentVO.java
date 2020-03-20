package com.soninlawisdice.vo;

import java.sql.Timestamp;

// 결제
public class PaymentVO {
	int p_no; // 결제번호
	int t_no; // 게시글번호
	int m_sno; // 판매자회원번호
	int m_bno; // 구매자회원번호
	int p_price; // 거래금액
	String p_status; // 상태
	Timestamp p_order_date; // 주문일시
	Timestamp p_payment_date; // 결제일시

	public PaymentVO() {
	}

	public PaymentVO(int p_no, int t_no, int m_sno, int m_bno, int p_price, String p_status, Timestamp p_order_date,
			Timestamp p_payment_date) {
		super();
		this.p_no = p_no;
		this.t_no = t_no;
		this.m_sno = m_sno;
		this.m_bno = m_bno;
		this.p_price = p_price;
		this.p_status = p_status;
		this.p_order_date = p_order_date;
		this.p_payment_date = p_payment_date;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public int getT_no() {
		return t_no;
	}

	public void setT_no(int t_no) {
		this.t_no = t_no;
	}

	public int getM_sno() {
		return m_sno;
	}

	public void setM_sno(int m_sno) {
		this.m_sno = m_sno;
	}

	public int getM_bno() {
		return m_bno;
	}

	public void setM_bno(int m_bno) {
		this.m_bno = m_bno;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public String getP_status() {
		return p_status;
	}

	public void setP_status(String p_status) {
		this.p_status = p_status;
	}

	public Timestamp getP_order_date() {
		return p_order_date;
	}

	public void setP_order_date(Timestamp p_order_date) {
		this.p_order_date = p_order_date;
	}

	public Timestamp getP_payment_date() {
		return p_payment_date;
	}

	public void setP_payment_date(Timestamp p_payment_date) {
		this.p_payment_date = p_payment_date;
	}

}
