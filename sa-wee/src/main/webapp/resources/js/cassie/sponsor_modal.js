
/*
 * main(index-> sponsor)
 * 메인 화면 하단에서 후원하기 js
 */	

var amount = 0;
var sp_no = 0;
var m_name = "";
var m_phone = "";

// 메인에서 모달 띄우는 함수
function sponsorModal(btn) {	
	
	$("#sponsor-modal").css("display", "block");	    
    $("#sponsor-modal").css('z-index', 200);
	
    m_name = $(btn).data('name');
    m_phone = $(btn).data('phone');
}


// 후원금 선택 후 결제하는 함수
function isRadioChecked(sponsorBtn) {
	
	console.log("onclick 진입 성공");
		
	// 선택된 값이 없으면 돌아가기
	if ( ! $('input[name="spAmount"]:checked').val() ) {
	    alert('결제하실 금액을 선택해주세요.');
	    jQuery('input[name="spAmount"]').focus(); // 왜지..
	    
	    return false;
	    
	} else {		
		// 선택된 radio 버튼 값 가져오기
		amount = $('input[name="spAmount"]:checked').val();		

		var msg = amount/1000 + ",000원을 결제합니다.";
		alert(msg);	
		
		// sponsor table insert하고 돌아오기
		sponsorAjax(amount);
		
		// 결제 함수 실행
		paySponsor(amount, sp_no);
		
		return false;
	}				
}


function sponsorAjax(amount) { 
	
	$.ajax({ 
		type : "POST",
		url : "/sponsor_modal_view?amount="+amount, 
		cache : false,
		dataType : "json",
		success : function(data) { /* 컨트롤러에서 넘긴 값이 여기로 온다 */
			console.log("SUCCESS: ", amount); 
			
			sp_no = data['SP_NO'];
			
			console.log(data);
			
		}, 
		error : function(e) { 
			console.log("ERROR: ", e); 
		}, 
		done : function(e) { 
			console.log("DONE"); 
		} 
	}); 
};


/* 	 PG사 테스트 계정은 실제 계정과 동일하게 결제승인이 이루어지지만 
 * 결제 후 일정 시간 간격으로 또는 매일 자정직전에 일괄 취소됩니다.
 */

// 결제용 변수 만들기
var IMP = window.IMP;
IMP.init('imp42437735'); // 가맹점 식별코드

function paySponsor(amount) {
	console.log('결제금액: '+amount ); 
	
	IMP.request_pay({					
		merchant_uid : sp_no, // 전역변수 sp_no..// 가맹점에서 생성/관리하는 고유 주문번호
		name : '내 사위는 주사위 후원금',
		amount : amount,
		buyer_name : m_name, // 선택
		buyer_tel : m_phone, // 필수
	}, function(rsp) {
		if (rsp.success) {
			// alert("성공"); // 여기로 도착함			
			
			console.log(sp_no);
			
			//************************************************
			// 여기부터는 발표 후에 합시다!!!
			//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			jQuery.ajax({
				
				// cross-domain 에러 발생... 
				url : "/payments/complete/sponsor?sp_no="+sp_no, //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
				method : 'POST',
				dataType : 'text',
				/* headers: { "Content-Type": "application/json" }, */
				data : {
					imp_uid : rsp.imp_uid,
					price : rsp.paid_amount //최종적으로 결제한 가격
												
				//기타 필요한 데이터가 있으면 추가 전달							
				},
				success : function(data){
	                   
                	//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                 	console.log("서버에서 REST API로 결제정보확인 및 서비스루틴이 정상");
                    console.log(data);
                    
                	 // 결제 모달 닫기
					$("#sponsor-modal").css("display", "none");
                	 
                    alert("후원이 완료되었습니다. 마이페이지에서 확인하실 수 있습니다.");				                   
                    
                    // 성공하면 페이지 이동해!
                    location.reload(); // 새로고침
                    
				},
            	error : function(request, status, error) {           
	             	console.log(request);
	             	console.log(status);
	             	console.log(error);
				}							
	/* 		}).done(function(data) {
				//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
				if (everythings_fine) {
					var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					msg += '\결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;

					alert(msg);
					
					
				} else {
					
					console.log("결제는 성공했는데 정보는 못받아옴");
					//[3] 아직 제대로 결제가 되지 않았습니다.
					//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
				} */
			});
			
			
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;

			alert(msg);
			
			// 결제 모달 닫기
			$("#sponsor-modal").css("display", "none");
		}	
		
	});				
};			


// When the user clicks on <span> (x), close the modal
function closeSponsorModal() {
	$("#sponsor-modal").css("display", "none");	
}

