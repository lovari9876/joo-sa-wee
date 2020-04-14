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
	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	<%@include file="side.jsp"%>

	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3><a href="/faq">FAQ - 자주하는 질문</a></h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">
							<div class="controls">
								
				 				 <script>
								      $(function(){
												  $('#searchBtn').click(function() {
												  	event.preventDefault(); // event canceled 막기!
												    	self.location = "faq_list" 
												    				+ '${pageMaker.makeQuery(1)}' 
												    				+ "&s_no="
												    				+ $("#s_no option:selected").val() 
												    				+ "&searchType=" 
												    				+ $("#searchType option:selected").val() 
												    				+ "&keyword=" 
												    				+ encodeURIComponent($('#keywordInput').val());
												  });
												}); 
								   </script>	
							 	<div class="dropdown pull-left">
									<select id="s_no" name="s_no" data-placeholder="전체말머리" class="span2">
											<option value="0" <c:out value="${s_no == null ? 'selected' : ''}"/>>전체말머리</option>
											<option value="22" <c:out value="${s_no eq '22' ? 'selected' : ''}"/>>회원</option>
											<option value="23" <c:out value="${s_no eq '23' ? 'selected' : ''}"/>>결제</option>
											<option value="24" <c:out value="${s_no eq '24' ? 'selected' : ''}"/>>정보 수정</option>
											<option value="25" <c:out value="${s_no eq '25' ? 'selected' : ''}"/>>무인도 게시판</option>
											<option value="26" <c:out value="${s_no eq '26' ? 'selected' : ''}"/>>기타</option>
									</select>
								</div>
								
								<div class="dropdown pull-left">
										<select id="searchType" name="searchType" class="span2">
											<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
											<option value = "a" class="btn" <c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>제목</option>
											<option value = "b" class="btn" <c:out value="${scri.searchType eq 'b' ? 'selected' : ''}"/>>내용</option>
											<option value = "ab" class="btn" <c:out value="${scri.searchType eq 'ab' ? 'selected' : ''}"/>>작성자</option>
										</select>
								</div> 
								
								<div class="input-append pull-left"> 
									<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="조회  / 검색어입력">
									<button type="submit" class="btn">
										<i class="icon-search"></i>
									</button>
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
							<td class="cell span1">번호</td>
							<td class="cell">말머리</td>
							<td class="cell span5">글 제목</td>
							<td class="cell">작성일</td>
							<td class="cell span1">조회수</td>
						</tr><!-- 조회수 추천수 추가..? -->
						
						<tbody>
							<c:forEach items="${faq_list}" var="faq">
									<tr class="trow">
										<td class="cell">${faq.faq_no}</td>
										<td class="cell subject">
											<c:choose>				
													<c:when test="${faq.s_no eq 22}">회원</c:when>
													<c:when test="${faq.s_no eq 23}">결제</c:when>
													<c:when test="${faq.s_no eq 24}">정보 수정</c:when>
													<c:when test="${faq.s_no eq 25}">무인도 게시판</c:when>
													<c:when test="${faq.s_no eq 26}">기타</c:when>
												</c:choose>
										</td>
											
										<td class="cell title"><a
											href="/admin/faq_view?faq_no=${faq.faq_no}">${faq.faq_title}</a></td>
										<td class="cell"> 
											<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
											<jsp:useBean id="today" class="java.util.Date" />
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${faq.faq_written_date}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when>
												<c:otherwise>
													<fmt:formatDate value="${faq.faq_written_date}" pattern="HH:mm:ss"/>
												</c:otherwise>
											</c:choose>
										</td>
										<td class="cell">${faq.faq_hit}</td>
									</tr>
							</c:forEach>
						</tbody>

					</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="faq_list${pageMaker.makeSearch(pageMaker.startPage - 1)}&s_no=${s_no}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="faq_list${pageMaker.makeSearch(idx)}&s_no=${s_no}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="faq_list${pageMaker.makeSearch(pageMaker.endPage + 1)}&s_no=${s_no}"><i
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