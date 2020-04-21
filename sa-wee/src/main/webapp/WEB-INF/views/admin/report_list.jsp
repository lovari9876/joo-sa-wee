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
					<h3>신고관리</h3>
				</div>
				<div class="module-option clearfix">
					<form role="form" method="get">
					<div class = "search">
						<div class="control-group">

							<div class="controls">
								<div class="input-append pull-left">
									<input type="text" maxlength="30" name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="신고내용 검색">
									<button type="submit" class="btn" id="searchBtn">
										<i class="icon-search"></i>
									</button>
									
							 		<script>
								      $(function(){
								        $('#searchBtn').click(function() {
								          self.location = "report_list" + '${pageMaker.makeQuery(1)}' 
								          + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								        });
								      });   
								    </script> 
								</div>


							</div>
						</div>
						<div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn r_type <c:out value="${r_type eq null ? 'active' : ''}"/>" value="" 
							onclick ="location.href='report_list'">전체보기</button>
						<button id="member" type="button" class="btn r_type <c:out value="${r_type == '회원' ? 'active' : ''}"/>" value="회원" 
							onclick ="location.href='report_list?&r_type=회원&keyword='">회원</button>
						<button type="button" class="btn r_type <c:out value="${r_type == '게시글' ? 'active' : ''}"/>" value="게시글"
							onclick ="location.href='report_list?&r_type=게시글&keyword='">게시글</button>
						<button type="button" class="btn r_type <c:out value="${r_type == '댓글' ? 'active' : ''}"/>" value="댓글"
							onclick ="location.href='report_list?&r_type=댓글&keyword='">댓글</button>
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
								<td class="cell">신고 번호</td>
								<td class="cell">신고한 회원</td>
								<td class="cell">신고 대상</td>
								<td class="cell span4">신고 내용</td>
								<!-- 미리보기! 길면 ...으로 표시 ! 목록에서 선택시 content_view 페이지로 이동,  
								 신고한 회원과, 신고당한 대상 이름, 내용 등 표시 -->
								<td class="cell">신고일</td>
							</tr>
								<tbody id="ajax_test"> 
							<c:forEach items="${report_list}" var="report">
								<tr class="trow">
									<td class="cell">${report['R_NO']}</td>
									<td class="cell"><a href="user_view?m_no=${report['M_NO']}">${report['M_ID']}</a></td>
									<td class="cell">${report['R_TYPE']}</td>
									<td class="cell title"><a href="report_view?r_no=${report['R_NO']}&r_type=${report['R_TYPE']}">${report['R_CONTENT']}</a></td>
									<td class="cell">
									<!-- 신고는 귀찮으니가 걍 날짜로 통일.. 일단은 .. -->
										<fmt:formatDate value="${report['R_REPORT_DATE']}" pattern="yyyy.MM.dd"/>
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
									href="report_list${pageMaker.makeSearch(pageMaker.startPage - 1)}&r_type=${r_type}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="report_list${pageMaker.makeSearch(idx)}&r_type=${r_type}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="report_list${pageMaker.makeSearch(pageMaker.endPage + 1)}&r_type=${r_type}"><i
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
	
	<!-- <script src="js/admin/board_tab/tab.js" type="text/javascript"></script> -->
	
	
	
	
</body>
</html>