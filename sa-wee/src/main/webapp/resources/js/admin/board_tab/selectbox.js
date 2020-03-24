function categoryChange(e) {
  var category_a = ["전체보기", "잡담", "노하우", "토론"];
  var category_b = ["전체보기","개봉기", "一 리뷰", "多리뷰"];
  var category_c = ["전체보기","모집", "모임후기"];
  var category_d = ["전체보기","이벤트", "대회", "신작소식", "세일","기타"];
  var category_e = ["전체보기","룰", "추천", "기타"];
  var category_f = ["전체보기","계획", "디자인", "완성", "공유","테스트플레이"];
  var target = document.getElementById("category");
  
 
  if(e.value == "category_1") var d = category_a;
  else if(e.value == "category_2") var d = category_b;
  else if(e.value == "category_3") var d = category_c;
  else if(e.value == "category_4") var d = category_d;
  else if(e.value == "category_5") var d = category_e;
  else if(e.value == "category_6") var d = category_f;
 
  target.options.length = 0;
 
  for (x in d) {
    var opt = document.createElement("option");
    opt.value = d[x];
    opt.innerHTML = d[x];
    target.appendChild(opt);
  } 
}