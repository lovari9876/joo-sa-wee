<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="img/favicon.ico" rel="shortcut icon" />

<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="css/board_hs/bootstrap.min.css" />
<link rel="stylesheet" href="css/board_hs/font-awesome.min.css" />
<link rel="stylesheet" href="css/board_hs/slicknav.min.css" />
<link rel="stylesheet" href="css/board_hs/owl.carousel.min.css" />
<link rel="stylesheet" href="css/board_hs/magnific-popup.css" />
<link rel="stylesheet" href="css/board_hs/animate.css" />
<link rel="stylesheet" href="css/board_hs/linearicons.css" />
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="fonts/fonts_cassie/icomoon/style.css">
<!-- <script src="https://kit.fontawesome.com/4b0668ef4e.js" crossorigin="anonymous"></script> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel = "stylesheet" href = "css/board_hs/tagsinput.css" />

<link rel="stylesheet" href="css/board_hs/writestyle.css" />

<script src = "js/board_hs/ckeditor.js" ></script>

</head>
<body id = "top">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- Header section -->
	
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->
	




	<!-- 작성하는 부분 전체 -->

	<div class="write-section">
		<div class="write-container">


			<div class="write-view">

				<div class="writeName">
					<h3>글 작성하기</h3>
				</div>
				<div class = "square"></div>
				<!-- <div id = "bloodhound">
				<input data-role = "tagsinput" type = "text">
					<input class = "typeahead" type = "text" data-role = "tagsinput">
				</div> -->
				<!-- 게시판, 말머리 선택할 수 있는 곳 -->
				<form action="board_write" method = "post" enctype="multipart/form-data">
					<table class="write-table">
						<!-- 첫번째 select box 선택되어져있게 -->
						<input id = "bt_no" type = "hidden"  value = "${bt_no}"/>
						<!-- 일단 이렇게 안넘기면 회원 포인트 올릴때 board_writeVO 에서 m_no 을 가져오지 못함. -->
						<input name = "m_no" type = "hidden" value = "11"/>
						<tr class = "row">
							
							<td class = "cell">말머리 선택</td>
							<td class = "cell">
								<select id = "board" name = "bt_no" ></select> 
								<select id = "sub" name = "s_no"></select>
							</td>
							
						</tr>
						
						<!-- 입력창 -->
						<tr class="row">
							<td class = "cell">제목</td>
							<td class="cell"><input type="text" name="bw_title" placeholder = "제목을 입력하세요"></td>
						</tr>

						<tr class="row">
							<td class = "cell">내용</td>
							<td class="cell"><textarea id = "editor" name="bw_content" placeholder = "내용을 입력하세요"></textarea></td>
						</tr>
						
						<tr class = "row">
							<td class = "cell">태그</td>
							<td class = "cell" id = "bloodhound">
								<input name = "gameNames" class = "typeahead" type = "text" data-role = "tagsinput">
							</td>
						</tr>
						

					</table>
					<button class = "list" type="button" onclick="toList()">목록</button>
					<button class = "write-btn" type = "submit">작성완료</button>
				</form>




			</div>
		</div>
	</div>

	
	
	<!-- footer 부분 -->
	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->
	




	<!--====== Javascripts & Jquery ======-->
	<script src="js/board_hs/jquery-3.2.1.min.js"></script>
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hs/jquery.slicknav.min.js"></script>
	<script src="js/board_hs/owl.carousel.min.js"></script>
	<script src="js/board_hs/jquery.sticky-sidebar.min.js"></script>
	<script src="js/board_hs/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hs/main.js"></script>
	<script src="js/board_hs/doro.js"></script>
	<script src="js/header/scroll.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/board_hs/category.js"></script>
	<script src="js/board_hs/toList.js"></script>
	<script src="js/footer/footer_hee.js"></script>
	<script src ="js/board_hs/tagsinput.js"></script>
	<script src="js/board_hs/typeahead.js"></script>
	
	

	<script>
		
		var games = new Bloodhound({
			datumTokenizer : Bloodhound.tokenizers.obj.whitespace('name'),
			queryTokenizer : Bloodhound.tokenizers.whitespace,
			/* prefetch : '/gameList' */
			
			prefetch : {
				url : '/gameList',
				filter : function(list){
					return $.map(list, function(game){
						return {name : game};
					});
				}
			} 
		});
		games.initialize();
		console.log("games : " + games);
		console.log("name : " + name);
		
		$('.typeahead').tagsinput({
			
			typeaheadjs : {
				name : 'games',
				displayKey : 'name',
				valueKey : 'name',
				source : games.ttAdapter(),
				
				hint: true,
				highlight: true,
				minLength: 1
			}
		});
	
	
	</script> 
	
	
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			
			var cars = ['Audi', 'BMW', 'Bugatti', 'Ferrari', 'Ford', 'Lamborghini', 'Mercedes Benz', 'Porsche', 'Rolls-Royce', 'Volkswagen'];
			
			var cars = new Bloodhound({
				datumTokenizer : Bloodhound.tokenizers.whitespace,
				queryTokenizer : Bloodhound.tokenizers.whitespace,
				local : cars
			});
			
			
			 // Initializing the typeahead
		    $('.typeahead').typeahead({
		        hint: true,
		        highlight: true, /* Enable substring highlighting */
		        minLength: 1 /* Specify minimum characters required for showing suggestions */
		    },
		    {
		        name: 'cars',
		        source: cars
		    });
		});		
			
	</script> -->
	
	<script type="text/javascript">
			var myEditor;
			ClassicEditor
				.create( document.querySelector( '#editor' ), {
					
					
					
					
					ckfinder: {
				        uploadUrl: '${pageContext.request.contextPath}/fileupload' // 내가 지정한 업로드 url (post로 요청감)
				       
					},
					
					toolbar: [ 'heading', '|',  'bold', 'italic','fontSize','fontColor', 'fontFamily', 'alignment:left', 'alignment:center', 'alignment:right','link', 'bulletedList', 'numberedList', 'blockQuote','insertTable',  'imageUpload', 'imageStyle:alignLeft', 'imageStyle:full', 'imageStyle:alignRight'],

					image : {
						styles : ['full', 'alignLeft', 'alignRight']
					},
					
					uiClor : '#FFFFFF',
					
					removePlugins: [ 'ImageCaption' ],
					
					alignment: {
			            options: [ 'left', 'center', 'right' ]
			        }
				} )
				.then( editor => {
			        console.log( 'Editor was initialized', editor );
			        myEditor = editor;
		    } )
			.catch( error => {
			    console.error( error );
			} );
		</script>
	
	

</body>
</html>