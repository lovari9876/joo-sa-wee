/*
 * mytrade_sell_modal
 * 마이페이지- 내 거래- 내 판매에서 주문확인 모달 띄우게 하는 js
 */


// Get the modal
var modal = document.getElementById('sell-modal');

// button의 name="${payment['P_STATUS']}" 값
var sellBtnName = 0;

// 버튼 누를 때 해당 p_no 받아오기
var pno = 0;

var p_courier = "";
var p_tracking = "";

function sellModal(sellBtn) {
	
	console.log("onclick 진입 성공");
		
	//버튼의 name=p_status 얻어오기
	sellBtnName = $(sellBtn).attr("name"); // p_status	
    console.log("sellBtnName: " + sellBtnName);
	
    // 택배사, 운송장 가져와
    p_courier = $(sellBtn).data('courier');
    p_tracking = $(sellBtn).data('tracking');    
    
    // 다중 모달일 때 버튼으로 클릭한 모달만 보이게 하기
	// 1. 거래요청 단계
	if(sellBtnName == 1) {
		$("#sell-modal").css("display", "block");	    
	    $("#sell-modal").css('z-index', 200);
	   
	    // 게임, 가격 정보 부르기
	    pno = $(sellBtn).val();
		// alert(pno);// 성공			
		sellAjax(pno);
		
	// 2. 운송장 입력 단계	
	}else if(sellBtnName == 2) {
		$("#sell2-modal").css("display", "block");	    
	    $("#sell2-modal").css('z-index', 200);
	    
	    // 게임, 가격 정보 또 부르기
	    pno = $(sellBtn).val();
		// alert(pno);// 성공			
		sellAjax(pno);
		
	// 3. 배송중: 운송장 수정 가능	
	}else if(sellBtnName == 3) {
		$("#sell3-modal").css("display", "block");	    
	    $("#sell3-modal").css('z-index', 200);	  

	    // 게임, 가격 정보 또 부르기
	    pno = $(sellBtn).val();
		// alert(pno);// 성공			
		sellAjax(pno);
	
	// 4. 배송완료=> 상세정보+운송장 || 5. 거래완료=> 상세정보	
	}else if(sellBtnName == 4 || sellBtnName == 5) {
		$("#sell4-modal").css("display", "block");	    
	    $("#sell4-modal").css('z-index', 200);	  

	    // 게임, 가격 정보 또 부르기
	    pno = $(sellBtn).val();
		// alert(pno);// 성공			
		sellAjax(pno);
		
	    // 택배사, 운송장 가져와			    
	 	$(".sell4-courier").empty().text(p_courier);
	 	$(".sell4-tracking").empty().text(p_tracking);
	 	
	 	// modal--info에다 값 넣기..
	 	if(sellBtnName == 4) {
	 		$(".sell4_5_info_up").empty().html("구매자로부터 수취 확인되었습니다.<br/>상세정보는 아래에서 확인하실 수 있습니다.");
	 		$(".sell4_5_info_down").empty().html("수취 확인된 운송장입니다.");
	 	}else if(sellBtnName == 5) {
	 		$(".sell4_5_info_up").empty().html("관리자로부터 입금이 완료되었습니다.<br/>상세정보는 아래에서 확인하실 수 있습니다.");
	 		$(".sell4_5_info_down").empty().html("운송장 정보입니다.");
		}
		
	// 7. 거래취소=> 상세정보
	}else if(sellBtnName == 7) {
		$("#sell7-modal").css("display", "block");	    
	    $("#sell7-modal").css('z-index', 200);	  

	    // 게임, 가격 정보 또 부르기
	    pno = $(sellBtn).val();
		// alert(pno);// 성공			
		sellAjax(pno);
	}

};

// 1. 판매자가 거래 요청 들어오는 거 확인하는 함수
// 거래확인 버튼과 같은 라인의 p_no 받아서 controller로 넘긴 뒤
// hashmap list를 받아 foreach 돌린다.
function sellAjax(pno) { 
	
	// alert(pno); 받아옴
	
	$.ajax({ 
		type : "GET", 
		url : "/sell_modal_view/"+pno, 
		cache : false,
		dataType : "json",
		success : function(data) { /* 컨트롤러에서 넘긴 값이 여기로 온다 */
			console.log("SUCCESS: ", pno); 
			
			var tag = "";
			var sum = 0;
			
			// 게임, 가격 정보 표시
			$.each(data, function(key, ptgItem) {
				
				tag += '<tr class = "table--row">';
				tag += '<td class = "table--cell">'+ptgItem['TG_NAME'];
				tag += '</td>';
				tag += '<td class="table--cell">'+ ptgItem['TG_PRICE']+ '원</td>';
				tag += '</tr>';
				
				console.log("=end=");
				
				sum += ptgItem['TG_PRICE']; 
				
				// 1. 거래요청 단계
				if(sellBtnName == 1) {
					$("#ajax-sell").empty().append(tag);
					
				// 2. 운송장 입력 단계	
				}else if(sellBtnName == 2) {
					$("#ajax-sell2").empty().append(tag);
					
				// 3. 배송중: 운송장 수정 가능	
				}else if(sellBtnName == 3) {
					$("#ajax-sell3").empty().append(tag);
				
				// 4. 배송완료=> 상세정보+운송장 || 5. 거래완료=> 상세정보	
				}else if(sellBtnName == 4 || sellBtnName == 5) {
					$("#ajax-sell4").empty().append(tag);
					
				// 7. 거래취소=> 상세정보
				}else if(sellBtnName == 7) {
					$("#ajax-sell7").empty().append(tag);
				}
				
			});
			
			// 총액 표시
			
			// 1. 거래요청 단계
			if(sellBtnName == 1) {
				$("#ajax-sum-sell").empty().append(sum+'원');
				
			// 2. 운송장 입력 단계	
			}else if(sellBtnName == 2) {
				$("#ajax-sum-sell2").empty().append(sum+'원');
				
				// input value 할당
				$(".sell2-modal-p_no").val(pno);
				
			// 3. 배송중: 운송장 수정 가능	
			}else if(sellBtnName == 3) {
				$("#ajax-sum-sell3").empty().append(sum+'원');
				
				// input value 할당
				$(".sell3-modal-p_no").val(pno);
				$(".sell3-modal-p_courier").val(p_courier);
				$(".sell3-modal-p_tracking").val(p_tracking);
			
			// 4. 배송완료=> 상세정보+운송장 || 5. 거래완료=> 상세정보	
			}else if(sellBtnName == 4 || sellBtnName == 5) {
				$("#ajax-sum-sell4").empty().append(sum+'원');
				
				// input value 할당
				$(".sell4-modal-p_no").val(pno);
				
			// 7. 거래취소=> 상세정보
			}else if(sellBtnName == 7) {
				$("#ajax-sum-sell7").empty().append(sum+'원');
			}
			
			console.log("합계 나와:"+sum);
			
			//$("#ajax-sum-sell").empty().append(sum+'원');
			//$("#ajax-sum-sell2").empty().append(sum+'원');
			
			console.log("p_no: " + pno);
			
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


// When the user clicks on <span> (x), close the modal
function closeSellModal() {
	$("#sell-modal").css("display", "none"); // sell 모달	
	$("#sell2-modal").css("display", "none"); // sell2 모달
	$("#sell3-modal").css("display", "none"); // sell2 모달
	$("#sell4-modal").css("display", "none"); // sell4 모달
	$("#sell7-modal").css("display", "none"); // sell7 모달
	
};




