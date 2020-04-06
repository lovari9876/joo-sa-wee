<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Main Stylesheets -->

<link rel="stylesheet" href="css/board_hs/liststyle.css" />


</head>
<body id="top">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Header section -->

	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp"%>
	<!-- header include end -->



	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">

				<div class="listName">
					<h3>창작보드게임</h3>
					<p>창작보드게임 올리세요</p>
				</div>


				<!-- Search Bar  -->
				<form action="">

					<div class="search">

						<select>
							<option value="0" selected>전체</option>
							<option value="1">제목</option>
							<option value="2">내용</option>
							<option value="3">닉네임</option>
						</select> 
						
						<input id="searchBar" type="text">

						<!-- 여기 미쳐버렸음. 일단 버튼으로 만들어 놓고 다음에 해야함 타입이 submit 인줄도 모르겠음-->
						<button type="submit" class="fa fa-fw fa-search"></button>


						<!-- <i class="fa fa-fw fa-search"></i> -->
					</div>
				</form>




				<!-- 리스트 -->
				<div class=tab-table>
					<!-- 탭부분 -->
					<ul class="tab">
						<li class="current" data-tab="tab1"><button type = "button" >전체보기</button></li>
						<li data-tab="tab2"><button type = "button" value = "17" class = "select">계획</button></li>
						<li data-tab="tab3"><button type = "button" value = "18" class= "select">디자인</button></li>
						<li data-tab="tab4"><button type = "button" value = "19" class = "select">완성</button></li>
						<li data-tab="tab5"><button type = "button" value = "20" class = "select">공유</button></li>
						<li data-tab="tab6"><button type = "button" value = "21" class = "select">테스트 플레이</button></li>
					</ul>


					<!-- 테이블  -->
					<div id="tab1" class="tabcontent current">
						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">말머리</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

						<tbody class = "tbody">
							<c:forEach items="${list}" var="dto">
							<tr class="row">
								<td class = "cell">${dto['BW_NO']}</td>
								<td class = "cell">${dto['S_CONTENT']}</td>
								<td class = "cell"><a href="content_view?bw_no=${dto['BW_NO']}">${dto['BW_TITLE']}</a>  [${dto['CM']}]</td>
								<td class = "cell">${dto['M_NICK']}</td>
								<td class = "cell">
									<jsp:useBean id="today" class="java.util.Date" />
									<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
									<fmt:formatDate value="${dto['BW_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
										<c:choose>
											<c:when test="${now ne date}">${date}</c:when> 
											<c:otherwise>
												<fmt:formatDate value="${dto['BW_WRITTEN_DATE']}" pattern="HH:mm"/>
											</c:otherwise>
										</c:choose>
								</td>
								<td class = "cell">${dto['BW_HIT']}</td>
								<td class = "cell">${dto['BW_RECOMMEND_NUM']}</td>
							</tr>
							</c:forEach>
						</tbody>

						</table>

					</div>

					
					<!-- 여기서부터는 말머리 선택 부분이라  -->
					<div id="tab2" class="tabcontent">
						<table class="table">

							
							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>
							
							<tbody class = "tbody test">
							
						</tbody>
							
							

						</table>

					</div>

					<div id="tab3" class="tabcontent">
						
						<div class="orderby">
							<button class ="orderbutton">최신순</button>
							<button class ="orderbutton">조회순</button>
							<button class ="orderbutton">추천순</button>
						</div>
						
						
						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

							<tbody class = "tbody test">
							
						</tbody>
							
						</table>

					</div>

					<div id="tab4" class="tabcontent">
						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

						
							<tbody class = "tbody test">
							
						</tbody>
							
							
						</table>
					</div>
					
					<div id="tab5" class="tabcontent">
						
						<div class="orderby">
							<button class ="orderbutton">최신순</button>
							<button class ="orderbutton">조회순</button>
							<button class ="orderbutton">추천순</button>
						</div>
						
						
						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

						
							<tbody class = "tbody test">
							
						</tbody>
							
							
						</table>
					</div>
					
					<div id="tab6" class="tabcontent">
						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">글 제목</td>
								<td class="cell">작성자</td>
								<td class="cell">작성일</td>
								<td class="cell">조회수</td>
								<td class="cell">추천수</td>
							</tr>

						
							<tbody class = "tbody test">
							
						</tbody>
							
							
						</table>
					</div>

				</div>

				<!-- 버튼에 링크 걸기 -->
				<button class="write-view-btn" type="button"
					onclick="location.href='board_write_view?bt_no=6'">글쓰기</button>


			</div>
		</div>
	</div>



	<!-- footer 부분 -->
	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp"%>
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
	<script src="js/board_hs/tab.js"></script>
	<script src="js/board_hs/button.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/board_hs/tabdata.js" type="text/javascript"></script>
	<script src="js/footer/footer_hee.js"></script>

</body>
</html>