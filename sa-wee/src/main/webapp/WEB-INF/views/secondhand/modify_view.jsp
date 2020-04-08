<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 403 에러 / csrf 토큰 문제 -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

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
<!-- Main Stylesheets -->

<link rel="stylesheet" href="css/board_hs/writestyle.css" />

<script src = "js/board_hs/ckeditor.js" ></script>

</head>
<body id = "top">

	<!-- Header section -->
	
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->
	

	<!-- 작성하는 부분 전체 -->
	<div class="write-section">
		<div class="write-container">


			<div class="write-view">

				<div class="writeName">
					<h3>글 수정하기</h3>
				</div>
				<div class = "square"></div>
				
				
				<!-- 게시판, 말머리 선택할 수 있는 곳 -->
				<form action="trade_modify" method="post" enctype="multipart/form-data">
					<input type = "hidden" id = "bt_no" value = "9"/>
					<input type = "hidden" id = "t_no" value = ${tradeVO['T_NO']}/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<!-- 로그인 된 상태일 때 글쓰기 가능하도록.. -->
					<!-- <input type = "hidden" id = "m_no" value = ""/> -->									
					
					<table class="write-table">
						<tr class = "row">
							<td class = "cell">말머리 </td>
							<td class = "cell"> 
								<select name="s_no" >
									<option value="32" <c:out value="${tradeVO['S_NO'] == 32 ? 'selected' : ''}"/>>판매중</option>
									<option value="33" <c:out value="${tradeVO['S_NO'] == 33 ? 'selected' : ''}"/>>구매중</option>
									<option value="34" <c:out value="${tradeVO['S_NO'] == 34 ? 'selected' : ''}"/>>거래완료</option>
								</select> 								
							</td>							
						</tr>					
						
						<!-- 입력창 -->
						<tr class="row">
							<td class="cell">제목</td>
							<td class="cell">
								<input type="text" name="t_title" value="${tradeVO['T_TITLE']}" placeholder="제목을 입력하세요">
							</td>
						</tr>
						
						<!-- select 로 보드게임 번호 찍어줘야함... -->
						<!-- 없으면 직접 입력 가능: 향후 방향성 모호하므로 일단 이름 하나만 입력하도록. -->
						<tr class="row">
							<td class="cell">보드게임</td>
							<td class="cell">
								<input type="text" name="gameNames" value="${gameNames}"
									placeholder="보드게임의 이름을 쉼표(,)로 구분하여 입력하세요">
							</td>
						</tr>
						
						<tr class="row">
							<td class="cell">가격</td>
							<td class="cell">
								<input type="text" name="prices" value="${prices}"
										placeholder="보드게임의 희망 가격을 쉼표(,)로 구분하여 숫자로 입력하세요">
							</td>
						</tr>

						<!-- 판매 원하거나 구매 원할 때 사진 여기에 첨부 -->
						<tr class="row">
							<td class="cell">내용</td>
							<td class="cell">
								<textarea id = "editor" name="t_content" placeholder="판매 혹은 구매하려는 보드게임의 사진과 함께 설명을 입력하세요">
									${tradeVO['T_CONTENT']}
								</textarea>
							</td>
						</tr>
						
					</table>
					<button class="list" type="button" onclick="self.location='tlist'">목록</button>
					<button class="modify-btn" type="submit">수정 완료</button>
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
	
	
	<!-- ckEditor 관련 -->
	
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