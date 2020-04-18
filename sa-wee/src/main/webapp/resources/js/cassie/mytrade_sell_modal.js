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



function sellModal(sellBtn) {
	
	console.log("onclick 진입 성공");
		
	getName(sellBtn);
	
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
	}

};

//버튼의 name 얻어오기
function getName(sellBtn) {
	console.log("sellBtn name 전: " + sellBtnName);
	sellBtnName = $(sellBtn).attr("name"); // p_status
    console.log("sellBtn name 후: " + sellBtnName);
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
			
			$.each(data, function(key, ptgItem) {
				
				tag += '<tr class = "table--row">';
				tag += '<td class = "table--cell">'+ptgItem['TG_NAME'];
				tag += '</td>';
				tag += '<td class="table--cell">'+ ptgItem['TG_PRICE']+ '원</td>';
				tag += '</tr>';
				
				console.log("=end=");
				
				sum += ptgItem['TG_PRICE']; 
				
				$("#ajax-sell").empty().append(tag);
				$("#ajax-sell2").empty().append(tag);
				
			});
			// 총액 표시
			
			$("#ajax-sum-sell").empty().append(sum+'원');
			$("#ajax-sum-sell2").empty().append(sum+'원');
			console.log("합계 나와:"+sum);
			
			// input value 할당
			$(".sell2-modal-p_no").val(pno);
			console.log("sell2-modal-p_no: " + pno);
			
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
};




