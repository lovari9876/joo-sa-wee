package com.soninlawisdice.iamport;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;


@Service
public class IamPort {
	
	private static final String HOST = "https://api.iamport.kr"; //요청할 주소 이 뒤에다가 붙여야함
    private static final String RESTAPI = "1982424697374934";
    private static final String RESTAPI_SECRET = "YCuKDDXOzO431tJ0h1JGX69rmAN7kbFiO93rN0gnPkrQOaR5cBL9IVB5vocPAR8o1bQOc7c1rDSgNJmZ";
    private IamPortTokenVO iamPortTokenVO;
    private PaymentInfoVO paymentInfoVO;
    private IamPortCancelVO iamPortCancelVO;
    
    public String getAccessToken() throws RestClientException, URISyntaxException {
    	System.out.println("-----------------------------"); 
    	System.out.println("getAccessToken 시작");
    	System.out.println("-----------------------------");
    	
    	RestTemplate restTemplate = new RestTemplate();
    	HttpHeaders headers = new HttpHeaders();
    	
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
    	
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("imp_key", RESTAPI);
        params.add("imp_secret", RESTAPI_SECRET);
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        //헤더와 바디를 합친다.

        restTemplate.setErrorHandler(new RestTemplateErrorHandler());
        iamPortTokenVO = restTemplate.postForObject(new URI(HOST + "/users/getToken"), body, IamPortTokenVO.class);
        System.out.println(iamPortTokenVO);
       
        
        return iamPortTokenVO.getResponse().getAccess_token();
    }
    
    //결제정보 조회
    public String getPaymentInfo(String imp_uid) throws RestClientException, URISyntaxException {
 
    	System.out.println("-----------------------------"); 
    	System.out.println("getPaymentInfo 시작");
    	System.out.println("imp_uid : " + imp_uid);
    	System.out.println("-----------------------------");

    	RestTemplate restTemplate = new RestTemplate();
    	String token = getAccessToken();
        // 서버로 요청할 Header(결제준비) admin_key나 access_token넣어야하는데 access_token넣을때는 앞에가 Bearer
        // Host: kapi.kakao.com
        // Authorization: KakaoAK {admin_key}
        // Content-type: application/x-www-form-urlencoded;charset=utf-8
        HttpHeaders headers = new HttpHeaders();         
       
        headers.add("Authorization",token);
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);
       
         
        restTemplate.setErrorHandler(new RestTemplateErrorHandler()); //400페이지 에러 안뜨게 할수있음 
        //coronaVO = restTemplate.getForObject(HOST +"/storesByAddr/json?address="+address,CoronaVO.class);         
        paymentInfoVO = restTemplate.getForObject(HOST + "/payments/" + imp_uid + "?_token=" + token , PaymentInfoVO.class); 
		
            
		System.out.println(paymentInfoVO);
		
		if(paymentInfoVO == null) {
			return "fail";
		}
		String status = paymentInfoVO.getResponse().getStatus();
		
		return status;
	
    }
    //결제 취소 조회..
    public String cancel(String imp_uid) throws RestClientException, URISyntaxException {
    	
    	System.out.println("-----------------------------"); 
    	System.out.println("cancel 시작");
    	System.out.println("imp_uid : " + imp_uid);
    	System.out.println("-----------------------------");

    	RestTemplate restTemplate = new RestTemplate();
    	String token = getAccessToken();
        
        HttpHeaders headers = new HttpHeaders();         
       
        headers.add("Authorization",token);
        headers.add("Accept", MediaType.APPLICATION_JSON_VALUE);

        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("imp_uid", imp_uid); //가맹점 코드 테스트라 TC0ONETIME
 
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        //헤더와 바디를 합친다.
        
       
        restTemplate.setErrorHandler(new RestTemplateErrorHandler()); //400페이지 에러 안뜨게 할수있음 
        //coronaVO = restTemplate.getForObject(HOST +"/storesByAddr/json?address="+address,CoronaVO.class);         
        iamPortCancelVO = restTemplate.postForObject(HOST + "/payments/cancel" , body, IamPortCancelVO.class); 
       
        System.out.println(iamPortCancelVO);
		
        if(iamPortCancelVO.getResponse().getStatus() == null) {
			return null;
		}
		
		
		return iamPortCancelVO.getResponse().getStatus();
    }
  
}

