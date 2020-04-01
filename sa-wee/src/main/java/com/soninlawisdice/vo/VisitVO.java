package com.soninlawisdice.vo;

import java.sql.Timestamp;

public class VisitVO {
	private Timestamp v_date;
	
	public VisitVO() {}
	

	public VisitVO(Timestamp v_date) {
		super();
		this.v_date = v_date;
	}
	

	public Timestamp getV_date() {
		return v_date;
	}

	public void setV_date(Timestamp v_date) {
		this.v_date = v_date;
	}

	
	
	
	
	
}
