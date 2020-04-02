<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUN-IN-LAW IS DISE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- collapse -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<%-- <input type="hidden" name="cm_no" value="${comment_list[0]['CM_NO']}"/> --%>
	<input type="hidden" name="cm_type" value="<c:out value="${param['CM_TYPE']}"/>">
	<input type="hidden" name="cm_no2" value="<c:out value="${param['CM_NO2']}"/>"> 
	

	
	<!-- 댓글 달기 -->
	<div class="pt-5">
		<form action="">
			<label for="drop_list"><h3 class="mb-5">6 댓글</h3></label> <select
				id="drop_list" name="drop_list">
				<option value="new">최신순</option>
				<option value="best">인기순</option>
			</select>
		</form>
		
		<ul class="comment-list">
		<c:forEach items="${comment_list}" var="cm_comment_list" varStatus="status">
		<%-- <input type="hidden" name="cm_no" value="${comment_list[0]['CM_NO']}"/> --%>
			<li class="comment">
				<div class="comment-body">
					<form>
						<div class="comment_test">
							<div class="test_item name" id="pop">
								<span role="button" class="pop_btn popovers"
									data-toggle="popover"
									data-content="<a href='#'>회원정보보기</a><br/><a href='#'>쪽지보내기</a><br/><a href='report_view_m?m_no=${comment_list[status.index]["M_NO"]}'>신고하기</a>"><h3>${comment_list[status.index]['M_NICK']}</h3></span>
							</div>
							<!-- 팝업으로 하고싶다.....ㅠㅜㅜㅠㅜ -->
							<div class="test_item reco tooltip-purple">
								<a class="far fa-thumbs-up fa-2x no-text-deco" href="#"
									data-toggle="tooltip" data-container=".tooltip-purple"
									data-placement="top" title="추천"></a><a class="text_items">(</a><a class="text_items">${cm_comment_list[status.index]['CM_RECOMMEND_NUM']}</a><a class="text_items">)</a>
							</div>
						</div>
						<div class="meta">작성일 ${comment_list[status.index]['CM_WRITTEN_DATE']} 수정일 ${comment_list[status.index]['CM_UPDATED_DATE']}</div>
						<p>${comment_list[status.index]['CM_CONTENT']}</p>

						<div class="reply_test">
							<div class="test_item rp">
								<p>
									<a role="button" data-toggle="collapse" href="#replyCommentT"
										class="reply" aria-expanded="false"
										aria-controls="replyCommentT">Reply</a>
								</p>
							</div>

							<div class="test_item modi tooltip-purple">
								<a class="fas fa-edit fa-lg no-text-deco" href="comment_modify"
									data-toggle="tooltip" data-container=".tooltip-purple"
									data-placement="top" title="수정"></a>
							</div>
							<div class="test_item del tooltip-purple">
								<a class="fas fa-trash-alt fa-lg no-text-deco" href="#"
									data-toggle="tooltip" data-container=".tooltip-purple"
									data-placement="top" title="삭제"></a>
							</div>
							<div class="test_item rep tooltip-purple">
								<a class="fas fa-skull fa-lg no-text-deco" href="report_view_cm?cm_no=${comment_list[status.index]['CM_NO']}"
									onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;"
									data-toggle="tooltip" data-container=".tooltip-purple"
									data-placement="top" title="신고"> </a>
							</div>
						</div>
						<div id="replyCommentT" class="collapse">
							<%@ include file="reply.jsp"%>
						</div>
					</form>
				</div>
			</li>
			</c:forEach>
		</ul>
	</div>
	
	
	<!-- SCRIPTS -->
	<script src="js/board_hj/jquery.min.js"></script>
	<script src="js/board_hj/jquery-3.2.1.min.js"></script>
	<script src="js/board_hj/jquery.fancybox.min.js"></script>
	<script src="js/board_hj/jquery.easing.1.3.js"></script>
	
	<script src="js/board_hj/jquery.waypoints.min.js"></script>
	<script src="js/board_hj/jquery.animateNumber.min.js"></script>
	
	<script src="js/board_hj/jquery.slicknav.min.js"></script>
	
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
	<script src="js/board_hj/popover.js"></script>
</body>
</html>