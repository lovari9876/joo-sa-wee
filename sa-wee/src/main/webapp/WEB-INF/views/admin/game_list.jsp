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

<!-- 카테고리, 게시판 별로 선택하기, 회원별(아이디, 닉네임), 제목, 내용별 검색... -->
	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>보드게임 공식정보</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
								<div class="dropdown pull-left">
										<select id="searchType" name="searchType" class="span2">
											<option value = "a" class="btn" <c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>한글제목</option>
											<option value = "b" class="btn" <c:out value="${scri.searchType eq 'b' ? 'selected' : ''}"/>>영어제목</option>
											<option value = "ab" class="btn" <c:out value="${scri.searchType eq 'ab' ? 'selected' : ''}"/>>한영제목</option>
										</select>
								</div>
								<div class="input-append pull-left"> 
									<input type="text" maxlength="30" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="조회  / 검색어입력">
									<button type="submit" class="btn" id="searchBtn">
										<i class="icon-search"></i>
									</button>
								</div>
								
								
							</div>
						</div>

					</form>
					<!-- <div class="btn-group pull-left">
							<button type="button" class="btn"
										onclick="location = 'game_write'">글 작성(보류)</button>
					</div> -->
					<!-- 			
					<div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn">정렬</button>
						<button type="button" class="btn">게임이름</button>
						<button type="button" class="btn">난이도</button>
					</div> -->
				</div>


				<section class="list-section">

			

					<!-- 리스트 -->
					<div class = "table_mobile">
					<table class="table">
							<tr class="trow header">
								<td class="cell">번호</td>
								<td class="cell">한글이름</td> <!-- 행 클릭시 상세 정보  -->
								<td class="cell span3">영어이름</td> 
								<td class="cell">인원</td>
								<td class="cell">출시일</td>
								<td class="cell">플레이시간</td><!-- 분 단위 -->
								<td class="cell">수정일</td>
							</tr>
							
							<tbody>
								<c:forEach items="${game_list}" var="game">
									<tr class="trow"  onClick="location.href='/game_detail?g_no=${game['G_NO']}'">
										<td class="cell">${game['RNUM']}</td>
										<td class="cell">
											<c:if test="${game['G_NAME_KOR'] == null}"> 입력안됨 </c:if>
											<c:if test="${game['G_NAME_KOR'] != null}"> ${game['G_NAME_KOR']} </c:if>
										</td>
										<td class="cell g_title ">${game['G_NAME']}</td>
										<td class="cell">${game['G_MIN']} ~ ${game['G_MAX']}명</td>
										<td class="cell">${game['G_RELEASE']}년</td>
										<td class="cell">${game['G_PLAYTIME']}분</td>
										<td class="cell"> 
											<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
											<jsp:useBean id="today" class="java.util.Date" />
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${game['G_UPDATED_DATE']}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when>
												<c:otherwise>
													<fmt:formatDate value="${game['G_UPDATED_DATE']}" pattern="HH:mm:ss"/>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="game_list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="game_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="game_list${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
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