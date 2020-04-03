<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 파피콘 -->
<link rel="icon" type="image/png" href="images/share/wolf_logo.ico" />
<title>Admin</title>
<link type="text/css" href="css/admin/bootstrap.min.css"
	rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"
	rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"
	rel="stylesheet">
<!--         <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'
            rel='stylesheet'> -->
</head>
<body>

	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	
	<!-- 탭 -->
	<script src="js/admin/chart/tab.js" type="text/javascript"></script> 

	<!-- 차트 Chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="js/admin/chart/chart1.js" type="text/javascript"></script>

	<%@include file="side.jsp"%>

	<!--/.span3-->
	<div class="span9">
		<div class="content">
			<div class="btn-controls">
				<div class="btn-box-row row-fluid">
					<a class="btn-box big span3"><i class="icon-thumbs-up"></i><b>${sessionScope.totalCount}</b>
						<p class="text-muted">방문자 수</p> </a> 
					<a class="btn-box big span3"><i class="icon-user"></i><b>${count_member}</b>
						<p class="text-muted">회원 수</p></a>
					<a class="btn-box big span3"><i class="icon-list-ul"></i><b>${count_board}</b>
						<p class="text-muted">게시글 수</p> </a>
					<a	class="btn-box big span3"><i class="icon-comments"></i><b>${count_comment}</b>
						<p class="text-muted">댓글 수</p> </a>
						
						
						<!-- <a class="btn-box big span3"><i class="icon-shopping-cart"></i><b>15,152</b>
						<p class="text-muted">중고거래 수</p> </a> -->
				</div>
				<div class="btn-box-row row-fluid">
					<!--    <div class="span8">
                                        <div class="row-fluid">
                                            <div class="span12"> -->
                    
                    
                    <!-- 통계로 링크걸기  -->
					<a href="user_list" class="btn-box small span2"><i class="icon-group"></i><b>회원관리</b>
					</a><a href="report_list" class="btn-box small span2"><i class="icon-wrench"></i><b>신고관리</b>
					</a><a href="board_list" class="btn-box small span2"><i class="icon-list-ul"></i><b>게시글관리</b>
					</a><a href="faq_list" class="btn-box small span2"><i class="icon-pencil"></i><b>헬프데스크</b>
					</a><a href="game_list" class="btn-box small span2"><i class="icon-trophy"></i><b>보드게임 공식정보</b> 
					</a><a href="cafe_list" class="btn-box small span2"><i class="icon-beer"></i><b>보드카페 정보</b> </a>
					<!--         </div>
                                        </div>
                         
                                    </div> -->
				</div>
			</div>
			<!--/#btn-controls-->
		
			<!--/.module-->
			<div class="module hide">
				<div class="module-head">
					<h3>Adjust Budget Range</h3>
				</div>
				<div class="module-body">
					<div class="form-inline clearfix">
						<a href="#" class="btn pull-right">Update</a> <label for="amount">
							Price range:</label> &nbsp; <input type="text" id="amount" class="input-" />
					</div>
					<hr />
					<div class="slider-range"></div>
				</div>
			</div>


			<div class="module">

				<div class="module-head">
					<h3>방문자수</h3>
				</div>

				<div class="module-option clearfix">
					<div class="btn-group pull-right" data-toggle="buttons-radio">
						<p class="btn">
							<a href="#tab1">일간</a>
						</p>
						<p class="btn">
							<a href="#tab2">주간</a>
						</p>
						<p class="btn">
							<a href="#tab3">월간</a>
						</p>
						<p class="btn">
							<a href="#tab4">연간</a>
						</p>
					</div>
				</div>
				<div class="module-body">
					<div class="tab-container">
						<div class="chart tab_content" id="tab1">
							<canvas id="myChart"></canvas>
						</div>

						 <div class="chart tab_content" id="tab2">
							<canvas id="myChart2"></canvas>
						</div>
						
						<div class="chart tab_content" id="tab3">
							<canvas id="myChart3"></canvas>
						</div>
						
						<div class="chart tab_content" id="tab4">
							<canvas id="myChart4"></canvas>
						</div> 
					</div>

				</div>

			</div>
			
			
			
			<!--/.module-->
		</div>
		<!--/.content-->
	</div>
	<!--/.span9-->
	</div>
	</div>
	<!--/.container-->
	</div>
	<!--/.wrapper-->
	<div class="footer">
		<div class="container">
			<b class="copyright">&copy; 2014 Edmin - EGrappler.com </b>All rights
			reserved.
		</div>
	</div>
	<!-- <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script> -->
	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>


</body>
</html>