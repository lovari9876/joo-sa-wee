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
					<h3>1대1 문의</a></h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
								<script>
								      $(function(){
												  $('#searchBtn').click(function() {
												  	event.preventDefault(); // event canceled 막기!
												    	self.location = "ask_list" 
												    				+ '${pageMaker.makeQuery(1)}' 
												    				+ "&s_content="
												    				+ $("#s_content option:selected").val() 
												    				+ "&searchType=" 
												    				+ $("#searchType option:selected").val() 
												    				+ "&keyword=" 
												    				+ encodeURIComponent($('#keywordInput').val());
												  });
												}); 
								   </script>
							
								<div class="dropdown pull-left">
									<select id="s_content" name="s_content" data-placeholder="전체말머리" class="span2">
											<option value="0" <c:out value="${s_content == null ? 'selected' : ''}"/>>전체말머리</option>
											<option value="27" <c:out value="${s_content eq '27' ? 'selected' : ''}"/>>회원관련문의</option>
											<option value="28" <c:out value="${s_content eq '28' ? 'selected' : ''}"/>>결제관련문의</option>
											<option value="29" <c:out value="${s_content eq '29' ? 'selected' : ''}"/>>정보수정요청</option>
											<option value="30" <c:out value="${s_content eq '30' ? 'selected' : ''}"/>>무인도관련문의</option>
											<option value="31" <c:out value="${s_content eq '31' ? 'selected' : ''}"/>>기타문의</option>
									</select>
								</div>
								
								
								<div class="dropdown pull-left">
										<select id="searchType" name="searchType" class="span2">
											<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>전체보기</option>
											<option value = "t" class="btn" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
											<option value = "c" class="btn" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
											<option value = "w" class="btn" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
											<option value = "tc" class="btn" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
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
				</div>


				<section class="list-section">

					<div style="overflow-x: auto;">
					<table class="table">
						<tr class="trow header">
							<td class="cell span1">번호</td>
							<td class="cell">말머리</td>
							<td class="cell span5">글 제목</td> <!-- 메인 사이트의 ask 1대1문의 게시판 링크 걸기 -->
							<td class="cell">답변여부</td> <!-- 댓글 유무 -->
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
						</tr>
						<tbody>
							<c:forEach items="${ask_list}" var="board">
									<tr class="trow">
										<td class="cell">${board['RNUM']}</td>
										<td class="cell subject">${board['S_CONTENT']}</td>
										<td class="cell title"><a
											href="/content_view?bw_no=${board['BW_NO']}">
											<c:if test = "${board['BW_SECRET'] eq 'y' }"><img src="images/board_hs/lock.png"> </c:if>
											${board['BW_TITLE']}</a></td>
										<td class="cell">
											<c:choose>
												<c:when test="${board['CM'] eq 0}">N</c:when>
												<c:otherwise>Y</c:otherwise>
												
											</c:choose>
											
										</td>
										<td class="cell"><a href="user_view?m_no=${board['M_NO']}">${board['M_ID']}</a></td>
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
									</tr>
								</c:forEach>
							</tbody>
					</table>
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="ask_list${pageMaker.makeSearch(pageMaker.startPage - 1)}&s_content=${s_content}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="ask_list${pageMaker.makeSearch(idx)}&s_content=${s_content}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="ask_list${pageMaker.makeSearch(pageMaker.endPage + 1)}&s_content=${s_content}"><i
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