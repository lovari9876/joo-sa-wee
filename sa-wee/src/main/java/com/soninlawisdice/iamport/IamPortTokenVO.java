package com.soninlawisdice.iamport;

public class IamPortTokenVO {
	
	private String code;
	private String message;
	private TokenVO response;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public TokenVO getResponse() {
		return response;
	}
	public void setResponse(TokenVO response) {
		this.response = response;
	}
	
	@Override
	public String toString() {
		return "IamPortTokenVO [code=" + code + ", message=" + message + ", response=" + response + "]";
	}
	
	
}	
