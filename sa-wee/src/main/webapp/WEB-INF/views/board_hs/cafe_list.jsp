<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 사위는 주사위</title>
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

<script src="js/board_hs/jquery-3.2.1.min.js"></script>
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
					<a href = "cafe_list"><h3 style="color:black;">카페 리스트</h3></a>
					<p>카페 리스트임</p>
				</div>
				
				
				
				
				
				<div class = "toMap">
					<button class ="cafe_btn" onclick="location.href='cafe_map'">지도 보기</button>
				</div>

				<!-- Search Bar  -->
				<!-- Search Bar  -->
				<form>
					<div class="n-search">
						<div class="dropdown pull-right">
								<select id="searchType" name="searchType" class="span2">
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
				
				<script>
				      $(function(){
								  $('#searchBtn').click(function() {
								  	event.preventDefault(); // event canceled 막기!
								    	self.location = "cafe_list" 
								    				+ '${pageMaker.makeQuery(1)}' 
								    				+ "&add=" 
								    				+ $("#c_add option:selected").val() 
								    				+ "&searchType=" 
								    				+ $("#searchType option:selected").val() 
								    				+ "&keyword="
								    				+ encodeURIComponent($('#keywordInput').val());
								  });
								}); 
				   </script>

				<!-- 리스트 -->
				<div class=tab-table>
					
					<!-- 테이블  -->
					<div id="tab1" class="tabcontent current cafeL">
						<div class = "location">
							
						 
							<select onchange ="location.href='cafe_list?add='+this.value" id="c_add">
								<option value="">지역선택</option>
								<option value="전체" <c:out value="${add eq '전체' ? 'selected' : ''}"/>>전체보기</option>
								<option value="서울" <c:out value="${add eq '서울' ? 'selected' : ''}"/>>서울특별시</option>
								<option value="인천" <c:out value="${add eq '인천' ? 'selected' : ''}"/>>인천광역시</option>
								<option value="대전" <c:out value="${add eq '대전' ? 'selected' : ''}"/>>대전광역시</option>
								<option value="광주" <c:out value="${add eq '광주' ? 'selected' : ''}"/>>광주광역시</option>
								<option value="대구" <c:out value="${add eq '대구' ? 'selected' : ''}"/>>대구광역시</option>
								<option value="울산" <c:out value="${add eq '울산' ? 'selected' : ''}"/>>울산광역시</option>
								<option value="부산" <c:out value="${add eq '부산' ? 'selected' : ''}"/>>부산광역시</option>
								<option value="세종" <c:out value="${add eq '세종' ? 'selected' : ''}"/>>세종특별자치시</option>
								<option value="경기" <c:out value="${add eq '경기' ? 'selected' : ''}"/>>경기도</option>
								<option value="강원" <c:out value="${add eq '강원' ? 'selected' : ''}"/>>강원도</option>
								<option value="충청북" <c:out value="${add eq '충청북' ? 'selected' : ''}"/>>충청북도</option>
								<option value="충청남" <c:out value="${add eq '충청남' ? 'selected' : ''}"/>>충청남도</option>
								<option value="전라북" <c:out value="${add eq '전라북' ? 'selected' : ''}"/>>전라북도</option>
								<option value="전라남" <c:out value="${add eq '전라남' ? 'selected' : ''}"/>>전라남도</option>
								<option value="경상북" <c:out value="${add eq '경상북' ? 'selected' : ''}"/>>경상북도</option>
								<option value="경상남" <c:out value="${add eq '경상남' ? 'selected' : ''}"/>>경상남도</option>
								<option value="제주" <c:out value="${add eq '제주' ? 'selected' : ''}"/>>제주특별자치도</option>
							</select>
						
						</div>
						
						
						<table class="table">


							<tr class="row header">
								<td class="cell">글 번호</td>
								<td class="cell loc">지역</td>
								<td class="cell cn">카페 이름</td>
								<td class="cell" style="width:200px;">카페 번호</td>
								
							</tr>

						<tbody class = "tbody">
							<c:forEach items="${list}" var="list">
							<tr class="row">
								<td class = "cell">${list['RNUM']}</td>
								<td class = "cell loc">${list['C_ADD']}</td>
								<td class = "cell cn"><a href="cafe_info?c_no=${list['C_NO']}">${list['C_TITLE']}</a></td>
								<td class = "cell">${list['C_PHONE']}</td>
								
							</tr>
							</c:forEach>
						</tbody>

						</table>
					</div>
					<div class="Page navigation example">
							<ul class = "pagination">
								<c:if test="${pageMaker.prev}">
									<li class = "page-item"><a class = "page-link"
										href="cafe_list${pageMaker.makeSearch(pageMaker.startPage - 1)}&add=${add}"><i
											class="icon-double-angle-left"></i></a></li>
								</c:if>
	
								<c:forEach begin="${pageMaker.startPage}" 
									end="${pageMaker.endPage}" var="idx">
									<li class = "page-item"><a class = "page-link" href="cafe_list${pageMaker.makeSearch(idx)}&add=${add}">${idx}</a></li>
								</c:forEach>
	
								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li class = "page-item"><a class ="page-link"
										href="cafe_list${pageMaker.makeSearch(pageMaker.endPage + 1)}&add=${add}"><i
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