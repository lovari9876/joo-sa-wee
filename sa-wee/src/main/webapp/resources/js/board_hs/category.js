function categoryChange(e) {
  var cat_a = ["이야기1", "이야기2", "이야기3", "이야기4"];
  var cat_b = ["리뷰1", "리뷰2", "리뷰3"];
  var cat_c = ["모임1", "모임2", "모임3"];
  var cat_d = ["뉴스1", "뉴스2", "뉴스3", "뉴스4"];
  var cat_e = ["질문", "답변"];
  var cat_f = ["창작1", "창작2", "창작3"];
  
  var target = document.getElementById("cate");

  
  
  if(e.value == "1") var d = cat_a;
  else if(e.value == "2") var d = cat_b;
  else if(e.value == "3") var d = cat_c;
  else if(e.value == "4") var d = cat_d;
  else if(e.value == "5") var d = cat_e;
  else if(e.value == "6") var d = cat_f;
 
  target.options.length = 0;
 
  for (x in d) {
    var opt = document.createElement("option");
    opt.value = d[x];
    opt.innerHTML = d[x];
    target.appendChild(opt);
  } 
}


