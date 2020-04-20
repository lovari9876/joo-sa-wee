<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜포맷 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 파피콘 -->
<link rel="icon" type="image/png" href="images/share/wolf_logo.ico" />
<title>관리자 | 내사위는주사위</title>
<link type="text/css" href="css/admin/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"
	rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"
	rel="stylesheet">
<link type="text/css"
	href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
	rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>
	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	<%@include file="side.jsp"%>

	<!-- 카테고리, 게시판 별로 선택하기, 회원별(아이디, 닉네임), 제목, 내용별 검색... -->
	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>보드게임카페</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
								<script>
								      $(function(){
												  $('#searchBtn').click(function() {
												  	event.preventDefault(); // event canceled 막기!
												    	self.location = "cafe_list" 
												    				+ '${pageMaker.makeQuery(1)}' 
												    				+ "&searchType=" 
												    				+ $("#searchType option:selected").val() 
												    				+ "&keyword=" 
												    				+ encodeURIComponent($('#keywordInput').val());
												  });
												}); 
								   </script>
								
 								<div class="dropdown pull-left">
										<select id="searchType" name="searchType" class="span2">
											<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
											<option value = "t" class="btn" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>카페이름</option>
											<option value = "c" class="btn" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>주소</option>
										</select>
								</div> 
								
								<div class="input-append pull-left"> 
									<input type="text" maxlength="30" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="조회  / 검색어입력">
									<button type="submit" class="btn" id="searchBtn">
										<i class="icon-search"></i>
									</button>
								</div>
								
								<div class="btn-group pull-right">
									<button type="button" class="btn"
										onclick="location = 'cafe_write'">글 작성</button>
								</div>
							</div>
						</div>

					</form>
				</div>


				<section class="list-section">

					<!-- 	<div class="limiter">
						<div class="container-table100">
							<div class="wrap-table100"> -->


					<!-- 리스트 -->
					<div class="table_mobile">
						<table class="table">
							<tr class="trow header">
								<td class="cell span1">번호</td>
								<td class="cell span3">카페 이름</td>
								<td class="cell ">주소</td>
								<td class="cell span2">전화번호</td>
							</tr>
							<tbody>
								<c:forEach items="${cafe_list}" var="cafe">
									<tr class="trow">
										<td class="cell">${cafe['RNUM']}</td>
										<td class="cell"><a
											href="/cafe_info?c_no=${cafe['C_NO']}">${cafe['C_TITLE']}</a></td>
										<td class="cell">${cafe['C_ADD']}</td>
										<td class="cell">${cafe['C_PHONE']}</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="cafe_list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="cafe_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="cafe_list${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
										class="icon-double-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
			</div>
		</div>
	</div>

	</section>



	</div>
	</div>
	<!--/.content-->
	</div>
	<!--/.span9-->
	<!-- 		</div>
		</div> -->
	<!--/.container-->
	<!-- 	</div> -->
	<!--/.wrapper-->

	<div class="footer">
		<div class="container">


			<b class="copyright">&copy; 2014 Edmin - EGrappler.com </b> All
			rights reserved.
		</div>
	</div>

	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>