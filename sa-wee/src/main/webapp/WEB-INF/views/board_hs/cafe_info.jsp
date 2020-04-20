<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 사위는 주사위</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600"
	rel="stylesheet">



<!-- tooltip, popover -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- Stylesheets -->
<link rel="stylesheet" href="css/board_hs/bootstrap.min.css" />
<link rel="stylesheet" href="css/board_hs/font-awesome.min.css" />
<link rel="stylesheet" href="css/board_hs/slicknav.min.css" />
<link rel="stylesheet" href="css/board_hs/owl.carousel.min.css" />
<link rel="stylesheet" href="css/board_hs/magnific-popup.css" />
<link rel="stylesheet" href="css/board_hs/animate.css" />
<link rel="stylesheet" href="css/board_hs/linearicons.css" />
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://kit.fontawesome.com/4b0668ef4e.js" crossorigin="anonymous"></script> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Main Stylesheets -->


<link rel="stylesheet" href="css/board_hs/doro.css" />
<link rel="stylesheet" href="css/board_hs/cafe_content_view_style.css" />
<!-- <link rel="stylesheet" href="css/board_hs/liststyle.css" /> -->


</head>
<body id="top">
	
	<!-- Header section -->
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp"%>
	<!-- header include end -->

	<!-- 도로록  -->
	<div class="sidenav">
		<ul class="mymenu">
			<li><a class="icon fas fa-store" id="uno" href="#firstblank"></a>
				<div class="hide">카페 정보</div></li>
			<li><a class="icon fas fa-pencil-alt" id="dos" href="#blank1"></a>
				<div class="hide">한줄평</div></li>
			<li><a class="icon fas fa-book-open" id="tres" href="#blank2"></a>
				<div class="hide">카페 리뷰</div>
		</ul>
	</div>



	<!-- 밑에 전체 -->
	<input type = "hidden" value = "${cafe_info.c_no}">
	<section class="view-section" id="firstblank">
		<div class="view-wrap">
			<div class="view-container">
				<div class="cafe">
					<!-- 카페 이름 -->
					<div class="cafe-name" id="cafe-name">
						<h4>${cafe_info.c_title}</h4>
					</div>

					<!-- 카페 사진 -->
					<div class="cafe-photo" id="cafe-photo">



						<div id="carouselExampleIndicators" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>


							<div class="carousel-inner" role="listbox">
								<div class="carousel-item active">
									<img src="images/board_hs/cafe1.png">
								</div>

								<div id="target" class="carousel-item">
									<img src="images/board_hs/cafe2.png">
								</div>

								<div class="carousel-item">
									<img src="images/board_hs/cafe4.png">
								</div>
							</div>


							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>

					</div>


					<!-- 카페 정보 -->

					<div class="cafe-info" id="cafe-info">
						<div class="info-wrap">
							<div class="info">
								<i class="fas fa-map-marker-alt"></i> 주소 : ${cafe_info.c_add} <br />
								<i class="fas fa-phone"></i> 전화번호 : ${cafe_info.c_phone} <br />
								<i class="fas fa-users"></i> 수용인원 : ${cafe_info.c_people}명 <br />
								<i class="fas fa-couch"></i> 테이블 개수 : ${cafe_info.c_table}개 의자
								개수 : ${cafe_info.c_chair}개 <br /> <i class="far fa-clock"></i>
								오픈 시간 : ${cafe_info.c_open} <br /> <i class="fas fa-clock"></i>
								마감 시간 : ${cafe_info.c_close} <br /> <i
									class="fas fa-door-closed"></i> 카페 휴일 : ${cafe_info.c_rest} <br />
							</div>
						</div>
						<c:if test = "${m_id eq 'admin'}">
							<div class = "admin_delete"><a href="/cafe_list">삭제</a></div>
						</c:if>
						
						<c:if test = "${m_id eq 'admin'}">
							<div class = "admin_modify">
								<a href = "/admin/cafe_modify?c_no=${cafe_info.c_no}">수정</a>&nbsp;&nbsp;
							</div>
						</c:if>
					
						
						
						
					</div>

				</div>


				<!-- 빈공간 -->
				<div id="blank1"></div>


						<!-- 한줄평 리스트 -->
					
				<c:import url="/comment_view_or">
							<c:param name="cm_type" value="한줄평"></c:param>
							<c:param name="cm_no2" value="${cafe_info.c_no}"></c:param>
					</c:import> 


				<!-- 빈공간 -->

				<div id="blank2"></div>



				<!-- 카페 리뷰 부분 -->
				<div class="cafe-review" id="cafe-review">

					<div class="review-wrap">


					
						<h3 class = "mb-5 review">리뷰부분입니다.</h3>
					
						<div class = "table-wrap">
						<div class = "review-table">

							<table class="table">

								<tr class="row header">
									<td class="tcell">글 번호</td>
									<td class="tcell">글 제목</td>
									<td class="tcell">작성자</td>
									<td class="tcell">작성일</td>
									<td class="tcell">조회수</td>
									<td class="tcell">추천수</td>
								</tr>
								<tbody class = "tbody">
									<c:forEach items="${list}" var="list">
									<tr class="row">
										<td class = "tcell">${list['CR_NO']}</td>
										<td class = "tcell"><a href="content_view_cr?cr_no=${list['CR_NO']}">${list['CR_TITLE']}</a>  [${list['CM']}]</td>
										<td class = "tcell">${list['M_NICK']}</td>
										<td class = "tcell">
											<jsp:useBean id="today" class="java.util.Date" />
											<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
											<fmt:formatDate value="${list['CR_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
												<c:choose>
													<c:when test="${now ne date}">${date}</c:when> 
													<c:otherwise>
														<fmt:formatDate value="${list['CR_WRITTEN_DATE']}" pattern="HH:mm"/>
													</c:otherwise>
												</c:choose>
										</td>
										<td class = "tcell">${list['CR_HIT']}</td>
										<td class = "tcell">${list['CR_RECOMMEND_NUM']}</td>
									</tr>
									</c:forEach>
								</tbody>
								<tr class = "row">
									<td colspan = "6" class = "cell"><a class = "bold"  href = "read_more?c_no=${cafe_info.c_no}">리뷰 더보기</a></td>
								</tr>

							</table>
						</div>
						</div>
						
						
					</div>

				</div>

			</div>
		</div>



		<!-- footer 부분 -->

	</section>

	<!-- footer 부분 -->
	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp"%>
	<!-- footer include end -->






	<!--====== Javascripts & Jquery ======-->
	<script src="js/board_hs/jquery-3.2.1.min.js"></script>
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hs/jquery.slicknav.min.js"></script>
	<script src="js/board_hs/owl.carousel.min.js"></script>
	<script src="js/board_hs/jquery.sticky-sidebar.min.js"></script>
	<script src="js/board_hs/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hs/main.js"></script>
	<script src="js/board_hs/doro.js"></script>
	<script src="js/header/scroll.js"></script>
	<script src="js/board_hs/cafe-photo.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/footer/footer_hee.js"></script>

	<!-- script 부분 -->
	<!-- tooltip 부분 -->
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

	<!-- popover 부분 -->
	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover({
				html : true
			});
		});
	</script>
	
	<!-- 삭제 완료 confirm -->
	<script>
		$('.admin_delete').click(function(){
			var confirm_val = confirm("정말 삭제하시겠습니까?");
			if (confirm_val){
				location.href="/admin/deleteCafe/${cafe_info.c_no}";
				alert('해당 글이 삭제되었습니다.');
			}
		});
	</script>

</body>
</html>