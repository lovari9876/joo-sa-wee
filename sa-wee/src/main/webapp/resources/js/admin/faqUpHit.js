$(document).ready(function() {
	
	$(".upHit").click(function() {
		
		var no = $(this).val();
		console.log(no);
		
		var className = $(this).attr('class');
		var str = className.search('cd-faq__item-visible');
		// 트리거가 눌려서 visible 상태일때 클릭시에는 조회수 오르지 않음
		
		//console.log(str);
		
		if(str == -1){
			$.ajax({
				url: "/upHitFaq",
				/*type: "get",*/
				cache: false,
				//파라미터 넘기는 방법(key-value 형택)
				data: { faq_no: no },
				dataType : "json",
				
				success : function(data) {
					console.log('faq_uphit');
				},
				
				error : function(request, status, error) {
					console.log(request.responseText);
					console.log(error);
				}
			});
		}
		
		
		
		
	});
});