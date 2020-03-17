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
<link type="text/css" href="images/icons/css/font-awesome.css"rel="stylesheet">
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
					<h3>게시글관리</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
							
								<select tabindex="1" data-placeholder="전체게시판" class="span2 pull-left">
										<option value="">전체게시판</option>
										<option value="Category 1">보드이야기</option>
										<option value="Category 2">개봉기 및 리뷰</option>
										<option value="Category 3">보드게임 모임</option>
										<option value="Category 4">보드뉴스</option>
										<option value="Category 5">질문 n 답변</option>
										<option value="Category 6">창작 보드게임</option>
								</select>
									
								<select tabindex="2" data-placeholder="전체말머리" class="span2 pull-left">
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
						<button type="button" class="btn" >선택 글 삭제</button>
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
							<td class="cell"><input type="checkbox" value="0"></td> <!-- 전체선택 처리하기  -->
							<td class="cell">글 번호</td>
							<td class="cell">게시판</td>
							<td class="cell">글 제목</td>
							<td class="cell">작성자</td>
							<td class="cell">작성일</td>
						</tr><!-- 조회수 추천수 추가..? -->
						
						
						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">1</td>
							<td class="cell">Vincent Williamson</td><!-- 메인 사이트의 해당 글로 링크 걸기  -->
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>
						</a>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="2"></td>
							<td class="cell">2</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">3</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">4</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">5</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">6</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">7</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">8</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">9</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">10</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">11</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">12</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">13</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">14</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">2020-02-22</td>
						</tr>

						<tr class="trow">
							<td class="cell"><input type="checkbox" value="1"></td>
							<td class="cell">15</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
							<td class="cell">Vincent Williamson</td>
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