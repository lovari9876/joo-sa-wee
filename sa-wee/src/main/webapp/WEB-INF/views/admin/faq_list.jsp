<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- 날짜포맷 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 파피콘 -->
<link rel="icon" type="image/png" href="images/share/wolf_logo.ico" />
<title>Admin</title>
<link type="text/css" href="css/admin/bootstrap.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"rel="stylesheet">
<link type="text/css"href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>

	<%@include file="side.jsp"%>

	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3><a href="faq">FAQ - 자주하는 질문</a></h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
							
								<select tabindex="1" data-placeholder="전체말머리" class="span2 pull-left">
										<option value="">전체말머리</option>
										<option value="Category 1">말머리1</option>
										<option value="Category 2">말머리2</option>
										<option value="Category 3">말머리3</option>
										<option value="Category 4">말머리4</option>
								</select>
									
				
								<div class="input-append pull-right"> 
									<input type="text" class="span3" placeholder="검색을해라">
									<button type="submit" class="btn">
										<i class="icon-search"></i>
									</button>
								</div>
								
								 <div class="dropdown pull-right">
									<a class="dropdown-toggle btn" data-toggle="dropdown" href="#">전체보기 <i class="icon-caret-down"></i>
									</a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
										<li><a href="#">전체보기</a></li>
										<li><a href="#">글 제목</a></li>
										<li><a href="#">글 내용</a></li>
									</ul>
								</div> 
							</div>
						</div>

					</form>
					
					
					<div class="btn-group pull-right" >
						<button type="button" class="btn" onclick = "location = 'faq_write'"  >글 작성</button>
					</div>
				</div>


				<section class="list-section">

					<!-- 	<div class="limiter">
						<div class="container-table100">
							<div class="wrap-table100"> -->


					<!-- 리스트 -->
					<div style="overflow-x: auto;">
					<table class="table">
						<tr class="trow header">
							<td class="cell">글 번호</td>
							<td class="cell">말머리</td>
							<td class="cell span5">글 제목</td>
							<td class="cell">작성일</td>
							<td class="cell">조회수</td>
						</tr><!-- 조회수 추천수 추가..? -->

						<c:forEach items="${faq_list}" var="board">
								<tr class="trow">
									<td class="cell">${board['BW_NO']}</td>
									<td class="cell">${board['S_CONTENT']}</td>
									<td class="cell"><a
										href="/content_view?bw_no=${board['BW_NO']}">${board['BW_TITLE']}</a></td>
									<td class="cell"> 
										<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
										<jsp:useBean id="today" class="java.util.Date" />
										<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
										<fmt:formatDate value="${board['BW_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
										<c:choose>
											<c:when test="${now ne date}">${date}</c:when>
											<c:otherwise>
												<fmt:formatDate value="${board['BW_WRITTEN_DATE']}" pattern="HH:mm:ss"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="cell">${board['BW_HIT']}</td>
								</tr>
							</c:forEach>

					</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="board_list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="board_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="board_list${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
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

	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>