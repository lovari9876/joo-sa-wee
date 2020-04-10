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
	<script src="js/admin/chart/tab.js" type="text/javascript"></script>
	<!-- 차트 Chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="js/admin/chart/chart_comment.js" type="text/javascript"></script>




	<%@include file="side.jsp"%>

	<!--/.span3-->
	<div class="span9">
		<div class="content">
			<div class="module">

				<div class="module-head">
					<h3>댓글</h3>
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
					</div>
					
				</div>

			</div>

		</div>



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

	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>




</body>
</html>