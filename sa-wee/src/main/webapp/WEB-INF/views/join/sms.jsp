<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SON-IN-LAW IS DICE</title>
</head>
<body>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" ></script>
	<script>
	var IMP = window.IMP; // 생략가능
	IMP.init('imp16992200'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

	/* 중략 */
	IMP.certification({
	    merchant_uid : 'merchant_' + new Date().getTime() //본인인증과 연관된 가맹점 내부 주문번호가 있다면 넘겨주세요
	}, function(rsp) {
	    if ( rsp.success ) {
	         // 인증성공
	        console.log(rsp.imp_uid);
	        console.log(rsp.merchant_uid);
	        
	        $.ajax({
	                type : 'POST',
	                url : '/certifications/confirm',
	                dataType : 'json',
	                data : {
	                    imp_uid : rsp.imp_uid
	                }
	         }).done(function(){
	           takeResponseAndHandle(rsp)
	         });
	            
	    } else {
	         // 인증취소 또는 인증실패
	        var msg = '인증에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	});

	function takeResponseAndHandle(rsp) {
	    if ( rsp.success ) {
	        // 인증성공
	        console.log(rsp.imp_uid);
	        console.log(rsp.merchant_uid);
	    } else {
	         // 인증취소 또는 인증실패
	        var msg = '인증에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;

	        alert(msg);
	    }
	}
	</script>
</body>
</html>