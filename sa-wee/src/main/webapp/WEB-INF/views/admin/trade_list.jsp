<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h3>중고거래 내역</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
								<div class="dropdown">
									<a class="dropdown-toggle btn" data-toggle="dropdown" href="#">전체보기 <i class="icon-caret-down"></i>
									</a>
									<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
										<li><a href="#">전체보기</a></li>
										<li><a href="#">판매회원 아이디</a></li>
										<li><a href="#">구매회원 아이디</a></li>
									
									</ul>
								
									
								</div>
								
								 <div class="input-append pull-left">
									<input type="text" class="span3" placeholder="검색을 해라">
									<button type="submit" class="btn">
										<i class="icon-search"></i>
									</button>
								</div> 
								
								
								<!-- <div class="input-append pull-left">
									<input type="text" class="span3" placeholder="검색을 해라">
									<a href="notice_write" class="btn">
										<i class="icon-search"></i>
									</a>
								</div> -->
								
								
							</div>
						</div>

					</form>
					
				</div>


				<section class="list-section">

					<!-- 리스트 -->
					<div class = "table_mobile">
					<table class="table">
						<tr class="trow header">
							<td class="cell">결제 번호</td>
							<td class="cell">판매 회원</td>
							<td class="cell">구매 회원</td>
							<td class="cell">등록 금액</td>
							<td class="cell">거래 금액</td>
							<td class="cell">상태</td>
							<td class="cell">주문일시</td>
							<td class="cell">결제일시</td>
						</tr>
						<tbody>

							<tr class="trow">
								<td class="cell">1</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">2</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">3</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">4</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">5</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">6</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">7</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">8</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">9</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">10</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">11</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">12</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">13</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">14</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
	
							<tr class="trow">
								<td class="cell">15</td>
								<td class="cell">Vincent</td>
								<td class="cell">Williamson</td>
								<td class="cell">1,000</td>
								<td class="cell">1,000</td>
								<td class="cell">결제완료</td>
								<td class="cell">2020-02-22</td>
								<td class="cell">2020-02-22</td>
							</tr>
						</tbody>

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
					
				<!-- 	<div class="control-group">
						<div class="controls write_">
							<button type="submit" class="btn">글 작성</button>
						</div>
					</div> -->
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