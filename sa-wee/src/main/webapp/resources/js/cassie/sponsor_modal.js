
/*
 * main(index-> sponsor)
 * 메인 화면 하단에서 후원하기 js
 */	

// Get the modal
var modal = document.getElementById('sponsor-modal');

var sum = 0;
var product = '';
var products = '';
var count = 0;		
var pno = 0;

function buyModal(buyBtn) {			

	console.log("onclick 진입 성공");
	
	    // 게임, 가격 정보 부르기
	    pno = $(buyBtn).val();	
	    buyAjax(pno);

	
}

// 거래확인 버튼과 같은 라인의 p_no 받아서 controller로 넘긴 뒤
// hashmap list를 받아 foreach 돌린다.
function buyAjax(pno) { 
	
	// alert(pno); 받아옴
	
	$.ajax({ 
		type : "GET",
		url : "/buy_modal_view/"+pno, 
		cache : false,
		dataType : "json",
		success : function(data) { /* 컨트롤러에서 넘긴 값이 여기로 온다 */
			console.log("SUCCESS: ", pno); 
								
			// 결제에서 쓸 변수 초기화 및 대입
			sum = 0; // 초기화
			product = data[0]['TG_NAME']; // 잘 가져옴
			
			var tag = "";
			$.each(data, function(key, ptgItem) {
				
				tag += '<tr class = "table--row">';
				tag += '<td class = "table--cell">'+ptgItem['TG_NAME'];
				tag += '</td>';
				tag += '<td class="table--cell">'+ ptgItem['TG_PRICE']+ '원</td>';
				tag += '</tr>';
				
				console.log("=end=");
				
				sum += ptgItem['TG_PRICE']; 
				count += 1;
				
				
				// 1. 결제 단계
				if(buyBtnName == 1) {
					$("#ajax-sponsor").empty().append(tag);
					
				// 2. 배송 준비 단계	
				}else if(buyBtnName == 2) {
					$("#ajax-buy2").empty().append(tag);
					
				// 3. 수취확인 단계	
				}else if(buyBtnName == 3) {
					$("#ajax-buy3").empty().append(tag);

				// 4. 배송완료=> 상세정보 || 5. 거래완료=> 상세정보
				}else if(buyBtnName == 4 || buyBtnName == 5) {
					$("#ajax-buy4").empty().append(tag);

				// 7. 거래취소=> 상세정보
				}else if(buyBtnName == 7) {
					$("#ajax-buy7").empty().append(tag);
				}							
				
			});
			// 총액 표시해주고 결제버튼 만들기
			
			// 1. 결제 단계
			if(buyBtnName == 1) {
				$("#ajax-sum-sponsor").empty().append(sum+'원');
				
				// input value 할당: 거래취소 위해...
				$(".sponsor-modal-p_no").val(pno);
				
			// 2. 배송 준비 단계	
			}else if(buyBtnName == 2) {
				$("#ajax-sum-buy2").empty().append(sum+'원');
										
			// 3. 수취확인 단계
			}else if(buyBtnName == 3) {
				$("#ajax-sum-buy3").empty().append(sum+'원');
				
				// input value 할당
				$(".buy3-modal-p_no").val(pno);
		
			// 4. 배송완료=> 상세정보 || 5. 거래완료=> 상세정보
			}else if(buyBtnName == 4 || buyBtnName == 5) {
				$("#ajax-sum-buy4").empty().append(sum+'원');
				
				// input value 할당
				$(".buy3-modal-p_no").val(pno);

			// 7. 거래취소=> 상세정보
			}else if(buyBtnName == 7) {
				$("#ajax-sum-buy7").empty().append(sum+'원');
			}										
			
			console.log("합계 나와:"+sum);
			
			// 상품명 만들기// 성공
			if(count > 1) {
				console.log(" if문"); // 성공
				products = product+" 외 "+(count-1)+'개';
				console.log(products); // 성공

			}else {
				products = product;
			}
			count = 0; // count 초기화
			// 상품평 만들기 끝
			
		}, 
		error : function(e) { 
			console.log("ERROR: ", e); 
			display(e); 
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

function payNow() {
	console.log(products); // 성공
	
	var answer = confirm('결제하시겠습니까?');
	
	// 발표 후 만지기
	// var sendData = JSON.stringify({imp_uid: rsp.imp_uid, p_no : pno});
	// console.log(sendData);
	
	if(answer){
		IMP.request_pay({					
			merchant_uid : pno, // 걍 p_no..// 가맹점에서 생성/관리하는 고유 주문번호
			name : products,
			amount : sum,
			buyer_email : '${member.m_email}',
			buyer_name : "${member.m_name}", // 선택
			buyer_tel : '${member.m_phone}', // 필수
		}, function(rsp) {
			if (rsp.success) {
				// alert("성공"); // 여기로 도착함			
				
				console.log(pno);
				
				//************************************************
				// 여기부터는 발표 후에 합시다!!!
				//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				jQuery.ajax({
					
					// cross-domain 에러 발생... 
					url : "/payments/complete?p_no="+pno, //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
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
	                	 
	                    alert("결제 완료되었습니다. 마이페이지에서 확인하실 수 있습니다.");				                   
	                    
	                    // 성공하면 페이지 이동해!
	                    location.reload(); // 새로고침 후
	                    location.href="/mypage#trade"; // 내 거래 고
	                    
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
};	

// When the user clicks on <span> (x), close the modal
function closeSponsorModal() {
	$("#sponsor-modal").css("display", "none");	
}

