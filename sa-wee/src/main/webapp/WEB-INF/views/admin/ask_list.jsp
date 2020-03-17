<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
					<h3><a href="faq">1대1 문의</a></h3>
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
					
					
					<!-- <div class="btn-group pull-right" >
						<button type="button" class="btn" onclick = "location = 'faq_write'"  >글 작성</button>
					</div> -->
				</div>


				<section class="list-section">

					<div style="overflow-x: auto;">
					<table class="table">
						<tr class="trow header">
							<td class="cell">글 번호</td>
							<td class="cell">말머리</td>
							<td class="cell span5">글 제목</td> <!-- 메인 사이트의 ask 1대1문의 게시판 링크 걸기 -->
							<td class="cell">답변여부</td> <!-- 댓글 유무 -->
							<td class="cell">작성일</td>
						</tr>

						<tr class="trow">
							<td class="cell">1</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">N</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">2</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">N</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">3</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">4</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">5</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">6</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">7</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">8</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">9</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">10</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">11</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">12</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">13</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">14</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell">15</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Y</td>
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