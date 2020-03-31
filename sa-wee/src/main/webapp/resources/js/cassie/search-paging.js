
//http://localhost:8282/tlist$%7BpageMaker.makeQuery(1)%7D&searchType=t&keyword=1
/* /////////// 검색 결과 나오게 하는 javascript //////////// */
$(document).ready(function(){
    $("#searchBtn").on("click", function(event){
        self.location = "tlist"
            +'${pageMaker.makeQuery(1)}'    // 검색 목록에 첫 페이지로 이동
            +"&searchType="
            +$(".select-selected").text()
            +"&keyword="
            +encodeURIComponent($('#keywordInput').val());
    });
});
 