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


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>공지사항</h3>
				</div>



				<!-- 본문 -->

				<div class="view-section">
					<div class="view-container">


						<div class="content-view">

							<form action="" enctype="multipart/form-data">
								<table class="table" >
									<!-- <tr class = "row">
							<td class = "cell">게시판 선택</td>
							<td class = "cell">
								<select>
										<option value="0" selected>보드이야기</option>
										<option value="1">개봉기 및 리뷰</option>
										<option value="2">보드게임 모임</option>
										<option value="3">보드뉴스</option>
										<option value="4">질문 & 답변</option>
										<option value="5">창작 보드게임</option>
								</select> 
								<select>
										<option value="0" selected>이부분</option>
										<option value="1">처리방법</option>
										<option value="2">모르겠음</option>
								</select>
							</td>
						</tr> -->

									<tr class="row">
										<td class="cell span1">제목</td>
										<td class="cell span8">제목제목제목제목</td>

									</tr>

									<tr class="row">
										<td class="cell span1">내용</td>
										<td class="cell span8">Lorem ipsum dolor sit amet, consectetur
											adipisicing elit. Quae quidem blanditiis delectus corporis,
											possimus officia sint sequi ex tenetur id impedit est
											pariatur iure animi non a ratione reiciendis nihil sed
											consequatur atque repellendus fugit perspiciatis rerum et.
											Dolorum consequuntur fugit deleniti, soluta fuga nobis.
											Ducimus blanditiis velit sit iste delectus obcaecati debitis
											omnis, assumenda accusamus cumque perferendis eos aut quidem!
											Aut, totam rerum, cupiditate quae aperiam voluptas rem
											inventore quas, ex maxime culpa nam soluta labore at amet
											nihil laborum? Explicabo numquam, sit fugit, voluptatem autem
											atque quis quam voluptate fugiat earum rem hic, reprehenderit
											quaerat tempore at. Aperiam.</td>
									</tr>


								</table>
								<div class="module-option clearfix">
									<div class="control-group">
										<div class="controls">
											<button type="button" class="btn  pull-left"
												onclick="location='notice_list'">목록</button>
											<button type="submit" class="btn  pull-right">수정</button>

										</div>
									</div>
								</div>


							</form>




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