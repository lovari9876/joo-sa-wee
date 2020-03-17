<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edmin</title>
<link type="text/css" href="css/admin/bootstrap.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"rel="stylesheet">
<link type="text/css"href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>

	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="js/admin/fetchPage.js" type="text/javascript"></script>
	

	<%@include file="side.jsp"%>


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>신고관리</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
								<div class="dropdown">
									<a class="dropdown-toggle btn" data-toggle="dropdown" href="#">신고대상 <i class="icon-caret-down"></i>
									</a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
										<li><a href="#">전체보기</a></li>
										<li><a href="#">회원</a></li>
										<li><a href="#">게시글</a></li>
										<li><a href="#">댓글</a></li>
									
									</ul>
								
									
								</div>
									<div class="input-append pull-left">
									<input type="text" class="span3"
										placeholder="검색을 해라">
									<button type="submit" class="btn">
										<i class="icon-search"></i>
									</button>
								</div>
								
								
							</div>
						</div>

					</form>
					<div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn">전체보기</button>
						<button type="button" class="btn">회원</button>
						<button type="button" class="btn">게시글</button>
						<button type="button" class="btn">댓글</button>
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
							<td class="cell">신고 번호</td>
							<td class="cell">신고 대상</td>
							<td class="cell">신고 내용</td> 
							<!-- 미리보기! 길면 ...으로 표시 ! 목록에서 선택시 content_view 페이지로 이동,  
								 신고한 회원과, 신고당한 대상 이름, 내용 등 표시 -->
							<td class="cell">신고일</td>
						</tr>

						<tr class="trow">
							<td class="cell">1</td>
							<td class="cell"><a onclick="fetchPage('report_view2')">회원</a></td> <!-- ajax로 구현 -->
							<td class="cell title"><a href="report_view">신고내용 내용 내용bbbbbbbbbbbbabccabababababababababbbbbbbbbbbbbbb </a></td><!-- 링크이동 -->
							<td class="cell">2020-02-20</td>
						</tr>
						
						<c:forEach items="${report_list}" var="report">
						
						
						<tr class="trow">
							<td class="cell">${report.st_no}</td>
							<td class="cell"><a href = "report_view?st_no=${report.st_no}">${report.st_comment_num}</a></td>
							<td class="cell">${report.st_trade_num}</td>
							<td class="cell">${report.st_date}</td>
						</tr>
						
						
						</c:forEach>
					</table>
					</div>
					<div class="pagination pagination-centered">
						<ul>
							<li><a href="#"><i class="icon-double-angle-left"></i></a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#"><i class="icon-double-angle-right"></i></a></li>
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