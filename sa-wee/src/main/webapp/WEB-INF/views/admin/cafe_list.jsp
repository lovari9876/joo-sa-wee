<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edmin</title>
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

								

								<div class="dropdown pull-left">
									<a class="dropdown-toggle btn" data-toggle="dropdown" href="#">전체보기
										<i class="icon-caret-down"></i>
									</a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
										<li><a href="#">전체보기</a></li>
										<li><a href="#">카페이름</a></li>
										<li><a href="#">카페주소</a></li>
									</ul>
								</div>
								
								<div class="input-append pull-left">
									<input type="text" class="span3" placeholder="검색을해라">
									<button type="submit" class="btn">
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
					
					<!-- <div class="btn-group pull-left">
						<button type="button" class="btn">선택 글 삭제</button>
					</div> -->
					<!-- <div class="btn-group pull-right" data-toggle="buttons-radio">
						<button type="button" class="btn">정렬</button>
						<button type="button" class="btn">조회수</button>
						<button type="button" class="btn">작성일</button>
					</div> -->
				</div>


				<section class="list-section">

					<!-- 	<div class="limiter">
						<div class="container-table100">
							<div class="wrap-table100"> -->


					<!-- 리스트 -->
					<div class="table_mobile">
						<table class="table">
							<tr class="trow header">
								<td class="cell">글 번호</td>
								<td class="cell">카페 이름</td>
								<td class="cell">전화번호</td>
								<td class="cell">주소</td>
								<td class="cell">조회수</td>
								<td class="cell">작성일</td>
							</tr>
							

							<tr class="trow">
								<td class="cell">1</td>
								<td class="cell"><a href = "cafe_view">Vincent Williamson</a></td><!-- 행 선택시, 상세보기.. content_view ?? 메인 사이트 이동????-->
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">2</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">3</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">4</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">5</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">6</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">7</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">8</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">9</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">10</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">11</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">12</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">13</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">14</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

							<tr class="trow">
								<td class="cell">15</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">Vincent Williamson</td>
								<td class="cell">8</td>
								<td class="cell">2020-02-22</td>
							</tr>

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