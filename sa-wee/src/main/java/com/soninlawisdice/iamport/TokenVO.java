package com.soninlawisdice.iamport;

import java.sql.Date;

public class TokenVO {
	/*
	 * 응답 데이터의 access_token속성의 값이 액세스 토큰(access token)입니다. 
	 * expired_at속성은 토큰의 만료기한을 의미하며 unix timestamp로 표현됩니다(KST 기준). 
	 * 발행된 액세스 토큰은 만료기한이 지난 경우 새로운 토큰을 발급받아 사용해야 합니다. 
	 * now속성의 값은 아임포트 REST API 서버의 현재 시각을 나타내며, 
	 * 해당 값으로 가맹점 서버와의 시간 오차를 파악할 수 있습니다.
	 */
	
	private String access_token;
    private Date now;	//현재시간
    private Date expired_at; //토큰 만료기간
	
    public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public Date getNow() {
		return now;
	}
	public void setNow(Date now) {
		this.now = now;
	}
	public Date getExpired_at() {
		return expired_at;
	}
	public void setExpired_at(Date expired_at) {
		this.expired_at = expired_at;
	}
	
	@Override
	public String toString() {
		return "TokenVO [access_token=" + access_token + ", now=" + now + ", expired_at=" + expired_at + "]";
	}
    
    
}
