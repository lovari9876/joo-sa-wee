// 안써.. 실패!!!

/**
 * search-select option styling
 */
// 해당 페이지 내의 모든 select box에 다 적용..


var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select"); 
// custom-select 클래스 붙여둔 div들 모아둔 배열 생성(div 이하 select까지 포함된 것)
for (i = 0; i < x.length; i++) { // 페이지 내의 모든 select에 같은 작업 반복
  selElmnt = x[i].getElementsByTagName("select")[0]; 
  // i번째 custom-select로부터 0번째 select option 가져와..
  /*for each element, create a new DIV that will act as the selected item: 
   * 선택된 옵션의 innerHTML 가져와서 div 이하에 추가*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.setAttribute("id", "selected-item");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a); // custom-select 붙은 div에 자식으로 a(선택된 div) 붙여라 
  /*for each element, create a new DIV that will contain the option list: 
   * 옵션 전체에 해당하는 리스트 div 따로 생성*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) { // 옵션 수만큼 돌린다.
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0]; //
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected"); 
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}

function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}

/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);




