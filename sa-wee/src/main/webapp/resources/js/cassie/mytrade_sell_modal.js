/*
 * mytrade_sell_modal
 * 마이페이지- 내 거래- 내 판매에서 주문확인 모달 띄우게 하는 js
 */


// Get the modal
var modal = document.getElementById('sell-modal');

// Get the button that opens the modal
// var btns = document.getElementsByClassName("price-btn");
// var btn = btns['${ex}']	

// Get the <span> element that closes the modal
//var span = document.getElementById("modal--close");                                          

// When the user clicks on the button, open the modal 
//btn.onclick = function() {

function sell_modal(pno) {
	
	// alert(pno);// 성공			
	sellAjax(pno);
	
	$("#sell-modal").css("display", "block");	    
    $("#sell-modal").css('z-index', 200);
}

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
			});
			// 총액 표시
			
			$("#ajax-sum-sell").empty().append(sum+'원');
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
};

// When the user clicks on <span> (x), close the modal
function closeSellModal() {
	$("#sell-modal").css("display", "none");	
}




