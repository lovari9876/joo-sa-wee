<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="img/favicon.ico" rel="shortcut icon" />

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
<!-- <script src="https://kit.fontawesome.com/4b0668ef4e.js" crossorigin="anonymous"></script> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Main Stylesheets -->

<link rel="stylesheet" href="css/board_hs/writestyle.css" />


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
	


	<div class="write-section">
		<div class="write-container">


			<div class="write-view">

				<div class="writeName">
					<h3>글 수정하기</h3>
				</div>
				<div class = "square"></div>
				
				<!-- -->
				<!-- 수정하는 부분의 각각 value 를 ex) ${detail.TITLE} 이런식으로 받아와야함-->
				<!--  -->
				
				<form action="" enctype="multipart/form-data">
					<table class="write-table">
						<tr class = "row">
							<td class = "cell">게시판 선택</td>
							<td class = "cell">
								<select>
										<option value="0" selected>보드이야기</option>
										<option value="1">개봉기 및 리뷰</option>
										<option value="2">보드게임 모임</option>
										<option value="3">보드뉴스</option>
										<option value="4">질문 & 답변</option>
										<option value="5">창작 보드게임</option>
								</select> 
								<select>
										<option value="0" selected>이부분</option>
										<option value="1">처리방법</option>
										<option value="2">모르겠음</option>
								</select>
							</td>
						</tr>

						<tr class="row">
							<td class="cell">제목</td>
							<td class="cell"><input type="text" name="bwTitle" value = ""  placeholder = "제목을 입력하세요"></td>
							
						</tr>

						<tr class="row">
							<td class="cell">내용</td>
							<td class="cell"><textarea name="bwTitle" placeholder = "내용을 입력하세요">이건 여기에 ${detail.CONTENTS } 이런식으로</textarea></td>
						</tr>

						<tr class="row">
							<td class="cell">첨부파일</td>
							<td class="cell">
								<input multiple="multiple" type="file" name="file" />
							</td>
							
						</tr>
					</table>
					<button class = "list" type="button" onclick="location.href='list'">목록</button>
					<button class = "modify-btn" type = "submit">수정 완료</button>
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
	<script src="js/js_header/scroll.js"></script>
	<!-- <script src ="js/file.js"></script> -->
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/js_footer/footer_hee.js"></script>

</body>
</html>