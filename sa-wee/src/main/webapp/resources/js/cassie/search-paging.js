// 안써... 실패.


//http://localhost:8282/tlist$%7BpageMaker.makeQuery(1)%7D&searchType=t&keyword=1
/* /////////// 검색 결과 나오게 하는 javascript //////////// */
//$(document).ready(function(){
//    $("#searchBtn").on("click", function(event){
//    	var select_name = $("#selected-item").text();
//
////    	alert(select_name); //=> 여기까진 넘어온다!
////        self.location.href = "tlist"
////          +'${pageMaker.makeQuery(1)}' // 검색 목록의 첫 페이지로 이동
////            +"&searchType="
////            +select_name
////            +"&keyword="
////            +encodeURIComponent($('#keywordInput').val());
//    	
//    	if(select_name=="제목") {
//    	
//    		alert(select_name);
//            location.href = "tlist"
//                +"${pageMaker.makeQuery(1)}"// 검색 목록의 첫 페이지로 이동
//                +"&searchType="
//                +select_name
//                +"&keyword="
//                +encodeURIComponent($('#keywordInput').val());
//    	} else if(select_name=="내용") {
//            self.location = "tlist"
//                +'${pageMaker.makeQuery(1)}' // 검색 목록의 첫 페이지로 이동
//                +"&searchType=c"
//                +"&keyword="
//                +encodeURIComponent($('#keywordInput').val());
//    	} else if(select_name=="제목+내용") {
//            self.location = "tlist"
//                +'${pageMaker.makeQuery(1)}' // 검색 목록의 첫 페이지로 이동
//                +"&searchType=tc"
//                +"&keyword="
//                +encodeURIComponent($('#keywordInput').val());
//    	} else if(select_name=="작성자") {
//            self.location = "tlist"
//                +'${pageMaker.makeQuery(1)}' // 검색 목록의 첫 페이지로 이동
//                +"&searchType=w"
//                +"&keyword="
//                +encodeURIComponent($('#keywordInput').val());
//    	}else {
//    		alert('error');
//    	}
//    	
//    });
//});
