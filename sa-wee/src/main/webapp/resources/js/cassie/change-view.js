/*
 * change-view 
 * 보부상에서 버튼 누르면 masonry view에서 table list view로 바뀌게 하는 js
 * 생활 코딩 참고...
 */

/*
var Body = {
  setColor:function (color){
    //document.querySelector('body').style.color = color;
    $('body').css('color', color);
  },
  setBackgroundColor:function (color){
    // document.querySelector('body').style.backgroundColor = color;
    $('body').css('backgroundColor', color);
  }
}
function nightDayHandler(self){
  var target = document.querySelector('body');
  if(self.value === 'night'){
    Body.setBackgroundColor('black');
    Body.setColor('white');
    self.value = 'day';

  } else {
    Body.setBackgroundColor('white');
    Body.setColor('black');
    self.value = 'night';

  }
}
*/

$(document).ready(function(){
	  $("button.view-btn").click(function(){
		  var list = '<i class="fa fa-bars"></i>';
		  var squre = '<i class="fas fa-th-large"></i>';
		  
		  if($("button.view-btn i").innerHTML==list) {
			  $("button.view-btn i").toggleClass("iconize");
			  
		  }else{
			  $(this).toggleClass("iconize");
		  }
	    
	  });
});

document.getElementById("w8-d-blue").addEventListener("click", function (e) {
    var target = e.target;

    target.classList.toggle("iconize");
    target.classList.toggle("iconize2");
}, false);



