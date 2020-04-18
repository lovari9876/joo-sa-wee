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

/*// 2. 판매자가 운송장 입력하는 함수
function sell2Ajax(pno) { 
	
	// alert(pno); 받아옴
	
	$.ajax({ 
		type : "get", 
		url : "/sell_modal_view/"+pno, 
		cache : false,
		dataType : "text",
		data : {
			p_no : pno,
			p_courier : ,
			p_tracking : 
		},
		success : function(data) {  컨트롤러에서 넘긴 값이 여기로 온다 
			console.log("SUCCESS: ", pno); 
			
			var tag = "";
			var sum = 0;
			$.each(data, function(key, ptgItem) {
				
				tag += '<tr class = "table--row">';
				tag += '<td class = "table--cell">'+ptgItem['TG_NAME'];
				tag += '</td>';
				tag += '<td class="table--cell">'+ ptgItem['TG_PRICE']+ '원</td>';
				tag += '</tr>';
				
				console.log("=end=");
				
				sum += ptgItem['TG_PRICE']; 
				
				$("#ajax-sell2").empty().append(tag);
				
			});
			// 총액 표시
			
			$("#ajax-sum-sell2").empty().append(sum+'원');
			console.log("합계 나와:"+sum);
			
		}, 
		error : function(e) { 
			console.log("ERROR: ", e); 
			display(e); 
		}, 
		done : function(e) { 
			console.log("DONE"); 
		} 
	}); 
};*/


// When the user clicks on <span> (x), close the modal
function closeSellModal() {
	$("#sell-modal").css("display", "none"); // sell 모달	
	$("#sell2-modal").css("display", "none"); // sell2 모달
	$("#sell3-modal").css("display", "none"); // sell2 모달
};




