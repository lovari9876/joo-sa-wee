package com.soninlawisdice.iamport;

import java.io.IOException;

import org.springframework.http.client.ClientHttpResponse;
import org.springframework.web.client.ResponseErrorHandler;

public class RestTemplateErrorHandler implements ResponseErrorHandler {
	//resttemplate 사용시 에러하면 400에러페이지 뜨는데 그거 안뜨게하려고 만듦
	
	@Override
	public boolean hasError(ClientHttpResponse response) throws IOException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void handleError(ClientHttpResponse response) throws IOException {
		// TODO Auto-generated method stub

	}

}
