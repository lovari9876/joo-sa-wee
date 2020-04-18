package com.soninlawisdice.vo;

import java.sql.Timestamp;

// 결제
public class PaymentVO {
	private int p_no; // 결제번호
	private int t_no; // 게시글번호
	private int m_sno; // 판매자회원번호
	private int m_bno; // 구매자회원번호
	private int p_price; // 결제금액의 합
	private int p_status; // 상태
	private Timestamp p_order_date; // 주문일시
	private Timestamp p_payment_date; // 결제일시
	private String p_courier; // 택배사
	private String p_tracking; // 운송장번호

	// constructors
	public PaymentVO() {
	}

	public PaymentVO(int p_no, int t_no, int m_sno, int m_bno, int p_price, int p_status, Timestamp p_order_date,
			Timestamp p_payment_date, String p_courier, String p_tracking) {
		super();
		this.p_no = p_no;
		this.t_no = t_no;
		this.m_sno = m_sno;
		this.m_bno = m_bno;
		this.p_price = p_price;
		this.p_status = p_status;
		this.p_order_date = p_order_date;
		this.p_payment_date = p_payment_date;
		this.p_courier = p_courier;
		this.p_tracking = p_tracking;
	}

	// getters and setters
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

	public int getP_status() {
		return p_status;
	}

	public void setP_status(int p_status) {
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

	public String getP_courier() {
		return p_courier;
	}

	public void setP_courier(String p_courier) {
		this.p_courier = p_courier;
	}

	public String getP_tracking() {
		return p_tracking;
	}

	public void setP_tracking(String p_tracking) {
		this.p_tracking = p_tracking;
	}

}
