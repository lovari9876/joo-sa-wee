<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<!-- 카테고리, 게시판 별로 선택하기, 회원별(아이디, 닉네임), 제목, 내용별 검색... -->
	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>무인도관리</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
							
								<select tabindex="1" onchange="categoryChange(this)" data-placeholder="전체게시판" class="span2 pull-left">
										<option value="">전체게시판</option>
										<option value="category_1">보드이야기</option>
										<option value="category_2">개봉기 및 리뷰</option>
										<option value="category_3">보드게임 모임</option>
										<option value="category_4">보드뉴스</option>
										<option value="category_5">질문 n 답변</option>
										<option value="category_6">창작 보드게임</option>
								</select>
									
								<select tabindex="2" id="category" data-placeholder="전체말머리" class="span2 pull-left">
										<option>전체말머리</option>
								</select>
									
									
								<!-- <select tabindex="2" data-placeholder="전체말머리" class="span2 pull-left">
										<option value="">전체말머리</option>
										<option value="Category 1">말머리1</option>
										<option value="Category 2">말머리2</option>
										<option value="Category 3">말머리3</option>
										<option value="Category 4">말머리4</option>
								</select> -->
								
								
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
										<li><a href="#">아이디</a></li>
										<li><a href="#">닉네임</a></li>
										<li><a href="#">글 제목</a></li>
										<li><a href="#">글 내용</a></li>
									</ul>
								</div> 
							</div>
						</div>

					</form>
					
					<div class="btn-group pull-left" >
						<button type="button" class="btn selectDelete_btn" data-BW="${island['BT_NO']} ${island['I_NO']}">선택 글 삭제</button>
						<button type="button" class="btn" data-BW="${island['BT_NO']} ${island['I_NO']} ${island['M_NO']}">수정완료</button>
					</div>
					<div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn">정렬</button>
						<button type="button" class="btn">조회수</button>
						<button type="button" class="btn">추천수</button>
					</div>
				</div>


				<section class="list-section">

					<!-- 	<div class="limiter">
						<div class="container-table100">
							<div class="wrap-table100"> -->


					<!-- 리스트 -->
					<div class = "table_mobile">
					<table class="table">
						<tr class="trow header">
							<td class="cell"><input type="checkbox" name = "allCheck" id = "allCheck" value="0"></td> <!-- 전체선택 처리하기  -->
							<td class="cell">글 번호</td>
							<td class="cell">게시판</td>
							<td class="cell span4">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
							<td class="cell">신고수</td>
							<td class="cell">상태</td>
						</tr><!-- 조회수 추천수 추가..? -->
						
						
						<c:forEach items="${island_list}" var="island">
								<tr class="trow">
									<td class="cell"><input type="checkbox" name="chBox" class="chBox" data-BW="${island['BT_NO']} ${island['I_NO']} ${island['M_NO']}"></td>
									<td class="cell">${island['RNUM']}</td>
									<td>
										<c:choose>				
												<c:when test="${island['BT_NO'] eq 1}">보드이야기</c:when>		
												<c:when test="${island['BT_NO'] eq 2}">개봉기 및 리뷰</c:when>
												<c:when test="${island['BT_NO'] eq 3}">보드게임 모임</c:when>
												<c:when test="${island['BT_NO'] eq 4}">보드 뉴스</c:when>
												<c:when test="${island['BT_NO'] eq 5}">질문&답변</c:when>
												<c:when test="${island['BT_NO'] eq 6}">창작 보드게임</c:when>
												<c:when test="${island['BT_NO'] eq 8}">일대일 문의</c:when>
												<c:when test="${island['BT_NO'] eq 9}">보부상</c:when>
												<c:when test="${island['BT_NO'] eq 11}">카페 리뷰</c:when>
												<c:otherwise>불명확</c:otherwise>
											</c:choose>
										</td>
									<td class="cell"><a
										href="report_view?_no=${report.st_no}">${island['I_TITLE']}</a></td>
									<td class="cell">${island['M_ID']}</td>
									<td>
											<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
										<jsp:useBean id="today" class="java.util.Date" /> <!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
										<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
										<fmt:formatDate value="${island['I_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
										<c:choose>
											<c:when test="${now ne date}">${date}</c:when> 
											<c:otherwise>
												<fmt:formatDate value="${island['I_WRITTEN_DATE']}" pattern="HH:mm"/>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="cell">${island['I_REPORT_NUM']}</td>
									<td class="cell">
										<c:if test="${island['I_ISLAND'] eq 1}">수정 전</c:if>	
										<c:if test="${island['I_ISLAND'] eq 2}">수정 완료</c:if>
									</td>
								</tr>
							</c:forEach>

					</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="island_list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="island_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="island_list${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
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
	
	<!-- 체크박스 한번에 전체선택, 선택삭제 -->
	<script src="js/admin/checkBox.js" type="text/javascript"></script>
	
	<script src="js/admin/board_tab/selectbox.js" type="text/javascript"></script>
	
	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
		
		
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>