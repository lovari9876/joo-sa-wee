<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

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
					<h3>카페 리스트</h3>
					<p>카페 리스트임</p>
				</div>
				
				
				
				
				
				<div class = "toMap">
					<button class ="cafe_btn" onclick="location.href='cafe_map'">지도 보기</button>
				</div>

				<!-- Search Bar  -->
				<!-- Search Bar  -->
				<form>
					<div class="search">
						<div class="dropdown pull-right">
								<select name="searchType" class="span2">
									<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
									<option value = "t" class="btn" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>카페이름</option>
									<option value = "c" class="btn" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>지역...</option>
									<%-- <option value = "w" class="btn" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option> --%>
									<option value = "tc" class="btn" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>카페이름+지역..</option>
								</select>
						</div> 
						<div class="input-append pull-right"> 
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="검색을 해라">
							<button type="submit" class="btn" id="searchBtn">
								<i class="icon-search"></i>
							</button>
						</div>
					</div>
				</form>




				<!-- 리스트 -->
				<div class=tab-table>
					
					<!-- 테이블  -->
					<div id="tab1" class="tabcontent current">
						<div class = "location">
							
						 
							<select onchange ="location.href='cafe_list_loc?c_add='+this.value">
								<option value="">지역선택</option>
								<option value="전체">전체보기</option>
								<option value="서울">서울특별시</option>
								<option value="인천">인천광역시</option>
								<option value="대전">대전광역시</option>
								<option value="광주">광주광역시</option>
								<option value="대구">대구광역시</option>
								<option value="울산">울산광역시</option>
								<option value="부산">부산광역시</option>
								<option value="세종">세종특별자치시</option>
								<option value="경기">경기도</option>
								<option value="강원">강원도</option>
								<option value="충청북">충청북도</option>
								<option value="충청남">충청남도</option>
								<option value="전라북">전라북도</option>
								<option value="전라남">전라남도</option>
								<option value="경상북">경상북도</option>
								<option value="경상남">경상남도</option>
								<option value="제주">제주특별자치도</option>
							</select>
						
						</div>
						
						
						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell">지역</td>
								<td class="cell">카페 이름</td>
								<td class="cell">조회수</td>
								
							</tr>

						<tbody class = "tbody">
							<c:forEach items="${list}" var="list">
							<tr class="row">
								<td class = "cell">${list['RNUM']}</td>
								<td class = "cell">${list['C_ADD']}</td>
								<td class = "cell"><a href="cafe_info?c_no=${list['C_NO']}">${list['C_TITLE']}</a></td>
								<td class = "cell">${list['C_HIT']}</td>
								
							</tr>
							</c:forEach>
						</tbody>

						</table>
					</div>
					<div class="Page navigation example">
							<ul class = "pagination">
								<c:if test="${pageMaker.prev}">
									<li class = "page-item"><a class = "page-link"
										href="cafe_list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
											class="icon-double-angle-left"></i></a></li>
								</c:if>
	
								<c:forEach begin="${pageMaker.startPage}" 
									end="${pageMaker.endPage}" var="idx">
									<li class = "page-item"><a class = "page-link" href="cafe_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
								</c:forEach>
	
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class = "page-item"><a class ="page-link"
										href="cafe_list${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
											class="icon-double-angle-right"></i></a></li>
								</c:if>
							</ul>
						</div>

				</div>

				
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