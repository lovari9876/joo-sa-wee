$(document).ready(function(){

	
	//다큐먼트 레디

	$(function(){

		//Jackson 이용 List<VO> or List<Map<String,String>> 형태 JSON

		var ARR = [
					{"sub":"말머리","board":"카테고리"},
					{"sub":"전체보기","board":"보드이야기"},
					{"sub":"잡담","board":"보드이야기"},
					{"sub":"노하우","board":"보드이야기"},
					{"sub":"토론","board":"보드이야기"},
					{"sub":"전체보기","board":"개봉기 및 리뷰"},
					{"sub":"개봉기","board":"개봉기 및 리뷰"},
					{"sub":"일 리뷰","board":"개봉기 및 리뷰"},
					{"sub":"다 리뷰","board":"개봉기 및 리뷰"},
					{"sub":"전체보기","board":"보드게임 모임"},
					{"sub":"모집","board":"보드게임 모임"},
					{"sub":"모임 후기","board":"보드게임 모임"},
					{"sub":"전체보기","board":"보드 뉴스"},
					{"sub":"이벤트","board":"보드 뉴스"},
					{"sub":"대회","board":"보드 뉴스"},
					{"sub":"신작 소식","board":"보드 뉴스"},
					{"sub":"세일","board":"보드 뉴스"},
					{"sub":"기타","board":"보드 뉴스"},
					{"sub":"전체보기","board":"질문과 답변"},
					{"sub":"룰","board":"질문과 답변"},
					{"sub":"추천","board":"질문과 답변"},
					{"sub":"기타","board":"질문과 답변"},
					{"sub":"전체보기","board":"창작 보드게임"},
					{"sub":"계획","board":"창작 보드게임"},
					{"sub":"디자인","board":"창작 보드게임"},
					{"sub":"완성","board":"창작 보드게임"},
					{"sub":"공유","board":"창작 보드게임"},
					{"sub":"테스트플레이","board":"창작 보드게임"},
					
				];



		setFirstSelect(ARR); //board_type 

		setSecondSelect(ARR,$("#board option:selected").text()); // subject 
		
		
		//전에 선택한 select 값
		var bt_no = $("#board").attr("data-bt");
		var s_content = $("#sub").attr("data-s"); 
		
		console.log('bt_no : '+bt_no);
		console.log('s_content : '+s_content);
		
		
		//전에 선택한 selectboxr 값 가져와서 첫번째, 두번째 select box 선택되어지게 하는거.
	
		for(i = 0; i<ARR.length; i++){
			if(bt_no == i){
				$("#board").val(i).attr("selected", "selected");
				var selected = $("#board option:selected").text();
				setSecondSelect(ARR,selected);
				console.log('arr board: '+ARR[i].board);
				console.log('arr sub: '+ARR[i].sub);
			}
			
			if(s_content == ARR[i].sub){
				$("#sub").val(ARR[i].sub).attr("selected", "selected");
			}
		}
		
		//console.log($("#board option:selected").text());	//보드이야기, 개봉기 및 리뷰 나옴.
		//console.log($("#board").val());	//1 출력됨.

		//첫번째 selectbox 에 따라 두번째 selectbox 바뀌게 하는 부분.
		$("#board").change(function(e){

			var selected = $("#board option:selected").text();
			
			setSecondSelect(ARR,selected);
		});
	});


	
	
	function setFirstSelect(ARR){

		//첫번째 셀렉트 값을 중복제거 후 입력

		var ARR_TEMP = new Array();

		for(var i=0;i<ARR.length;i++){

			var isTF = true;		
			
			for(var j=i+1;j<ARR.length;j++){ 

				if(ARR[i].board==ARR[j].board){

					isTF = false;				
				}			
			}
			
			if(isTF){

				ARR_TEMP.push(ARR[i].board);
			}
		}

		var appendBoardType="";

	 /* ARR_TEMP.sort();*/

		for(var i=0;i<ARR_TEMP.length;i++){

			appendBoardType+="<option value='"+(i)+"'>"+ARR_TEMP[i]+"</option>";
		}
		
		$("#board").empty().append(appendBoardType);
	}
	
	//여기까지 첫번째 함수.
	
	
	
	
	
	



	function setSecondSelect(ARR,value){

		//첫번째 셀렉트 값에 따라 두번째 셀렉트 값 입력

	  var ARR_TEMP = new Array();

	  for(var i=0;i<ARR.length;i++){ 		

			if(ARR[i].board==value){

				ARR_TEMP.push(ARR[i].sub);
			}	
		}

	  var appendSubject="";
	  var firstSelect = $("#board").val();
	  console.log(firstSelect);

	 /* ARR_TEMP.sort();*/

		for(var i=0;i<ARR_TEMP .length;i++){ 		
			if(firstSelect == 1){
				appendSubject+="<option value='"+ARR_TEMP[i]+"'>"+ARR_TEMP[i]+"</option>";
			}else if(firstSelect == 2){
				appendSubject+="<option value='"+ARR_TEMP[i]+"'>"+ARR_TEMP[i]+"</option>";
			}else if(firstSelect == 3){
				appendSubject+="<option value='"+ARR_TEMP[i]+"'>"+ARR_TEMP[i]+"</option>";
			}else if(firstSelect == 4){
				appendSubject+="<option value='"+ARR_TEMP[i]+"'>"+ARR_TEMP[i]+"</option>";
			}else if(firstSelect == 5){
				appendSubject+="<option value='"+ARR_TEMP[i]+"'>"+ARR_TEMP[i]+"</option>";
			}else if(firstSelect == 6){
				appendSubject+="<option value='"+ARR_TEMP[i]+"'>"+ARR_TEMP[i]+"</option>";
			}else if(firstSelect == 0){
				appendSubject = "<option value='"+ARR_TEMP[i]+"'>"+ARR_TEMP[i]+"</option>";
				
			}
						
		}

				  
		$("#sub").empty().append(appendSubject);

		

		/*	$(document).ready(function() {
				$('#board').val("1").prop("selected", true);
				 var s_content = $('#searchBtn').val();
				console.log(s_content);
				$('#category').val("s_content").prop("selected", true);
				
				
			});*/
		
	}



	

});