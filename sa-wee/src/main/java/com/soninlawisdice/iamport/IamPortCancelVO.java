package com.soninlawisdice.iamport;

public class IamPortCancelVO {
	private String code;
	private String message;
	private IamportPaymentVO response;
	
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
	public IamportPaymentVO getResponse() {
		return response;
	}
	public void setResponse(IamportPaymentVO response) {
		this.response = response;
	}
	
	@Override
	public String toString() {
		return "IamPortCancelVO [code=" + code + ", message=" + message + ", response=" + response + "]";
	}
	
	
}
