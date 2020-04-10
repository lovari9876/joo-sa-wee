<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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



</head>
<body>
	<input type="hidden" name="cm_type" value="<c:out value='${param["CM_TYPE"]}'/>">
	<input type="hidden" name="cm_no2" value="<c:out value='${param["CM_NO2"]}'/>"> 
	
	<!-- 한줄평 부분 전체 -->
	<div class="oneline" id="oneline">

		<!-- 한줄평 부분 전체 -->
		<div class="pt-5">

			<!-- 댓글 작성 -->
			<%@ include file="/WEB-INF/views/content/comment_write_view_or.jsp" %>

			<!-- 한줄평 리스트 -->

			<!-- 한줄평 count -->
				<h3 class="mb-5">${comment_count_or['CM_COUNT']} 한줄평</h3>

			<!-- 한줄평 리스트 -->
			<ul class="comment-list">

				<c:forEach items="${comment_list_or}" var="cm_comment_list_or" varStatus="status">
				<!-- 한줄평 하나하나 -->
				<li class="comment">
					<!-- 댓글부분 -->
					<div class="comment-body">
						<form>

							<!-- 회원 이름 눌렀을때 뜨는거 -->
							<div class="comment_test">
								<div class="test_item name" id="pop">
									<span role="button" class="pop_btn popovers"
										data-toggle="popover"
										data-content="<a href='#'>회원정보보기</a><br/><a href='#'>쪽지보내기</a><br/><a href='report_view_m?m_no=${comment_list_or[status.index]["M_NO"]}&c_no=${cafe_info.c_no}'>신고하기</a>">
										<h3>${comment_list_or[status.index]['M_NICK']}</h3>
									</span>
								</div>

								<!-- 추천 버튼 -->
								<div class="test_item reco tooltip-purple">
								<input class="rec_cm_btn_or" id="rec_cm_btn" type="image" src="images/board_hj/thums_up_cm2_color.png"
									name="button" value="${comment_list_or[status.index]['CM_NO']}"
									data-toggle="tooltip" data-container=".tooltip-purple"
									data-placement="top" title="추천"/><span class="text_items">(</span><span class="text_items rec_cm_or">${comment_list_or[status.index]['CM_RECOMMEND_NUM']}</span><span class="text_items">)</span>
								<input type="hidden" name="c_no" class="rec_cm_btn_or" value="${cafe_info.c_no}">
							</div>

							</div>

							<!-- 작성일자 -->
							<div class="meta">>작성일 <jsp:useBean id="today" class="java.util.Date" /> <!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
							 <fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
								<fmt:formatDate value="${comment_list_or[status.index]['CM_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when> 
									<c:otherwise>
										<fmt:formatDate value="${comment_list_or[status.index]['CM_WRITTEN_DATE']}" pattern="HH:mm"/>
									</c:otherwise>
								</c:choose>	 
						수정일
							<fmt:formatDate value="${comment_list_or[status.index]['CM_UPDATED_DATE']}" pattern="yyyy.MM.dd" var="date"/>
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when> 
									<c:otherwise>
										<fmt:formatDate value="${comment_list_or[status.index]['CM_UPDATED_DATE']}" pattern="HH:mm"/>
									</c:otherwise>
								</c:choose>	</div>



							<!-- 댓글 내용 -->
							<p>${comment_list_or[status.index]['CM_CONTENT']}</p>



							<!-- 수정, 삭제, 신고 버튼부분 -->
							<div class="reply_test">
								<div class="test_item rep tooltip-purple">
									<a class="fas fa-skull fa-lg no-text-deco" href="report_view_cm?cm_no=${comment_list_or[status.index]['CM_NO']}"
										onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;"
										data-toggle="tooltip" data-container=".tooltip-purple"
										data-placement="top" title="신고"> </a>
								</div>
								<div class="test_item del tooltip-purple">
									<a class="fas fa-trash-alt fa-lg no-text-deco" href="comment_delete_or?cm_no=${comment_list_or[status.index]['CM_NO']}&c_no=${cafe_info.c_no}"
										data-toggle="tooltip" data-container=".tooltip-purple"
										data-placement="top" title="삭제"></a>
								</div>
								<div class="test_item modi tooltip-purple">
									<a class="fas fa-edit fa-lg no-text-deco" href="comment_modify_view_or?cm_no=${comment_list_or[status.index]['CM_NO']}"
										onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;"
										data-toggle="tooltip" data-container=".tooltip-purple"
										data-placement="top" title="수정"></a>
								</div>
							</div>

						</form>
					</div>
				</li>
				</c:forEach>
			</ul>
			<!-- END comment-list -->

			<!-- 댓글 쓰기 -->

		</div>


	</div>


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
	<script src="js/board_hj/recommend_cm_or.js"></script>
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

</body>
</html>