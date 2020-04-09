<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SON-IN-LAW IS DISE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- collapse -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<link rel="stylesheet" href="css/board_hj/custom-bs.css">
<link rel="stylesheet" href="css/board_hj/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/board_hj/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/fonts_hj/icomoon/style.css">
<link rel="stylesheet" href="fonts/fonts_hj/line-icons/style.css">
<link rel="stylesheet" href="css/board_hj/owl.carousel.min.css">
<link rel="stylesheet" href="css/board_hj/animate.css">
<link rel="stylesheet" href="css/board_hj/animate.min.css">
<link rel="stylesheet" href="css/board_hj/quill.snow.css">
<link rel="stylesheet" href="css/board_hj/style.css">
<!-- <link rel="stylesheet" href="css/board_hj/font-awesome.min.css"> -->
<link rel="stylesheet" href="css/board_hj/magnific-popup.css">
<link rel="stylesheet" href="css/board_hj/bootstrap.min.css" />

<!-- tooltip, popover -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- collapse -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body id="top">
	<input type="hidden" name="cr_no" value="${content_view_cr['CR_NO']}"/>

	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->

	<!-- HOME -->
	<section class="section-hero overlay inner-page bg-image"
		style="background-image: url('images/board_hj/lavender_dot.png');"
		id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="custom-breadcrumbs mb-0">
						<!-- 게시판이름과 게시글 작성자 -->
						<div class="title">
							<div class="title_item frist">
								<h4 id="community">${content_view_cr['BT_NAME']}</h4>
								<span class="slash">&bullet;</span> 
								<span class="slash">${content_view_cr['C_TITLE']}</span>
							</div>
							<div class="title_item second">
								<span class="slash">추천수(</span><span class="slash rec">${content_view_cr['CR_RECOMMEND_NUM']}</span><span class="slash">)</span> 
								<span class="slash">&bullet;</span>
								<span class="slash">조회수(${content_view_cr['CR_HIT']})</span>
							</div>
						</div>
						<div>
							<span class="text-white">작성자 ${content_view_cr['M_NICK']}</span>
							<span class="slash">&bullet;</span> 
							<span class="text-white">작성일 ${content_view_cr['CR_WRITTEN_DATE']}</span> 
							<span class="slash">&bullet;</span>
							<span class="text-white">수정일 ${content_view_cr['CR_UPDATED_DATE']}</span>
						</div>
					</div>
					<br />
					<!-- 게시글 제목 -->
					<h2 class="text-white">${content_view_cr['CR_TITLE']}</h2>
				</div>
			</div>
		</div>
	</section>

	<!-- 게시글 본문 -->
	<section class="site-section" id="next-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 blog-content">
					
					<p>${content_view_cr['CR_CONTENT']}</p>

					<!-- 추천 -->
					<br /> <br />
					<div align="center" class="tooltip-purple">
						<input class="good" type="image" src="images/board_hj/good.png"
							name="button" id="rec_btn_cr" value="${content_view_cr['CR_NO']}"
							data-toggle="tooltip" data-container=".tooltip-purple"
							data-placement="top" title="추천 +1">
						<p>
							<span>(</span><span class="rec_cr">${content_view_cr['CR_RECOMMEND_NUM']}</span><span>)</span>
						</p>
					</div>

					<br />
					<br />
					<!-- 목록보기와 수정, 삭제, 신고 -->
					<form action="cafe_map" method="get">
						<div class="test">
							<div class="test_item first">
								<input type="submit" value="목록" class="btn btn-lavender btn-md">
							</div>
							<div class="test_item second">
								<a href="review_modify_view?cr_no=${content_view_cr['CR_NO']}">수정</a>
							</div>
							<div class="test_item third">
								<a href="delete_cr?cr_no=${content_view_cr['CR_NO']}">삭제</a>
							</div>
							<div class="test_item fourth">
								<a href="report_view_cr?cr_no=${content_view_cr['CR_NO']}"
									onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;">신고</a>
							</div>
						</div>
					</form>


					<!-- 댓글부분 -->
					<%-- <%@ include file="/WEB-INF/views/content/comment_view_T.jsp" %> --%>
						<c:choose>
							<c:when test="${content_view_cr['BT_NO'] == 11}">
								<c:import url="/comment_view_cr">
									<c:param name="cm_type" value="카페리뷰"></c:param>
									<c:param name="cm_no2" value="${content_view_cr['CR_NO']}"></c:param>
								</c:import>
							</c:when> 
							<c:otherwise>
								<%@ include file="/WEB-INF/views/content/comment_view_bw.jsp" %>
							</c:otherwise>
						</c:choose>
						
						<%-- <c:param name="cm_type" value="${board_typeVO.bt_no}"></c:param>
						<c:param name="cm_no2" value="${content_view.bw_no}"></c:param> --%>
					
					<!-- 댓글 쓰기 -->
					<div class="comment-form-wrap pt-5">
						<%@ include file="/WEB-INF/views/content/comment_write_view_cr.jsp" %>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->

	<!-- SCRIPTS -->
	<script src="js/board_hj/jquery.min.js"></script>
	<script src="js/board_hj/jquery-3.2.1.min.js"></script>
	<script src="js/board_hj/jquery.fancybox.min.js"></script>
	<script src="js/board_hj/jquery.easing.1.3.js"></script>

	<script src="js/board_hj/jquery.waypoints.min.js"></script>
	<script src="js/board_hj/jquery.animateNumber.min.js"></script>

	<!-- <script src="js/board_hj/jquery.slicknav.min.js"></script> -->

	<script src="js/board_hj/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hj/jquery.sticky-sidebar.min.js"></script>

	<script src="js/board_hj/bootstrap.min.js"></script>

	<script src="js/board_hj/bootstrap.bundle.min.js"></script>
	<script src="js/board_hj/isotope.pkgd.min.js"></script>
	<script src="js/board_hj/stickyfill.min.js"></script>

	<script src="js/board_hj/owl.carousel.min.js"></script>
	<script src="js/board_hj/quill.min.js"></script>

	<script src="js/board_hj/bootstrap-select.min.js"></script>

	<script src="js/board_hj/custom.js"></script>

	<script src="js/board_hj/main.js"></script>

	<script src="js/board_hj/tooltip.js"></script>
	<script src="js/board_hj/recommend_cr.js"></script>
	<script src="js/board_hj/popover.js"></script>

	<!-- Java Script for header
    ================================================== -->
	<script src="js/header/jquery.slicknav.min.js"></script>
	<script src="js/header/header_hyesoo.js"></script>
	<script src="js/header/scroll.js"></script>

	<!-- Java Script for footer
    ================================================== -->
	<script src="js/footer/footer_hee.js"></script>
	

	<!-- modal 일단 실패... -->
	<!--  <script>
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script> -->

	<!-- 신고팝업창 / href="javascript:popupOpen();" 집어넣기 -->
	<!-- <script type="text/javascript">
		function popupOpen() {
			var popUrl = "report"; //팝업창에 출력될 페이지 URL
			var popOption = "width=500, height=600, top=150, left=150, resizable=no, scrollbars=no, status=no;"; //팝업창 옵션(optoin)
			window.open(popUrl, "", popOption);
			close();
		}
	</script> -->

	<!-- collapse 부분 -->
	<!-- <script>
	$('[data-toggle="collapse"]').on('click', function() {
	    var $this = $(this),
	  		 	 $parent = typeof $this.data('parent')!== 'undefined' ? $($this.data('parent')) : undefined;
	    if($parent === undefined) { 
	        $this.find('.glyphicon').toggleClass('glyphicon-plus glyphicon-minus');
	        return true;
	    }

	    /* Open element will be close if parent !== undefined */
	    var currentIcon = $this.find('.glyphicon');
	    currentIcon.toggleClass('glyphicon-plus glyphicon-minus');
	    $parent.find('.glyphicon').not(currentIcon).removeClass('glyphicon-minus').addClass('glyphicon-plus');

	});
	</script> -->


</body>
</html>