<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 사위는 주사위</title>
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
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<!-- modal -->	
<link rel="stylesheet" href="css/board_hj/modalstyle.css" />
<body>

	<%-- <input type="hidden" name="cm_no" value="${comment_list[0]['CM_NO']}"/> --%>
	<input type="hidden" name="cm_type" value="<c:out value='${param["CM_TYPE"]}'/>">
	<input type="hidden" name="cm_no2" value="<c:out value='${param["CM_NO2"]}'/>"> 



	<!-- 댓글 달기 -->
	<div class="pt-5">
		<h3 class="mb-5">${comment_count_cr['CM_COUNT']} Comments</h3>

		<ul class="comment-list">
			<c:forEach items="${comment_list_cr}" var="cm_comment_list_cr" varStatus="status">
				<%-- <input type="hidden" name="cm_no" value="${comment_list[0]['CM_NO']}"/> --%>
				<li class="comment" style="margin-left:<c:out value="${40*comment_list_cr[status.index]['CM_INDENT']}"/>px; padding-right:<c:out value="${40*comment_list_cr[status.index]['CM_INDENT']}"/>px;">
					<div class="comment-body">
							<div class="comment_test">
								<sec:authorize access="isAuthenticated()">
								<div class="test_item name" id="pop">
									<span role="button" class="pop_btn popovers"
										data-toggle="popover"
										data-content="<a href='#'>회원정보보기</a><br/><a href='#'>쪽지보내기</a><br/><a href='report_view_m_cr?m_no=${comment_list_cr[status.index]["M_NO"]}&cr_no=${content_view_cr["CR_NO"]}'>신고하기</a>"><h3>${comment_list_cr[status.index]['M_NICK']}</h3></span>
								</div>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
								<h3>${comment_list_cr[status.index]['M_NICK']}</h3>
								</sec:authorize>
								<!-- 팝업으로 하고싶다.....ㅠㅜㅜㅠㅜ -->
								<sec:authorize access="isAuthenticated()">
								<div class="test_item reco tooltip-purple">
									<input class="rec_cm_btn_cr" id="rec_cm_btn" type="image"
										src="images/board_hj/thums_up_cm2_color.png" name="button"
										value="${comment_list_cr[status.index]['CM_NO']}"
										data-toggle="tooltip" data-container=".tooltip-purple"
										data-placement="top" title="추천" /><span class="text_items">(</span><span
										class="text_items rec_cm_cr">${comment_list_cr[status.index]['CM_RECOMMEND_NUM']}</span><span
										class="text_items">)</span> <input type="hidden" name="cr_no"
										class="rec_cm_btn_cr" value="${content_view_cr['CR_NO']}">
								</div>
								</sec:authorize>
								<sec:authorize access="isAnonymous()">
								<div class="test_item reco tooltip-purple">
									<input class="rec_cm_btn" id="rec_cm_btn" type="image" src="images/board_hj/thums_up_cm2_color.png"
										Onclick="location.href='http://localhost:8282/loginview'"
										data-toggle="tooltip" data-container=".tooltip-purple"
										data-placement="top" title="추천"/><span class="text_items">(</span><span class="text_items rec_cm">${comment_list_cr[status.index]['CM_RECOMMEND_NUM']}</span><span class="text_items">)</span>
									<input type="hidden" name="cr_no" class="rec_cm_btn" value="${content_view_cr['CR_NO']}">
								</div>
								</sec:authorize>
							</div>
							<div class="meta">작성일
								<fmt:formatDate value="${today}" pattern="yyyy.MM.dd" var="now"/>
								<fmt:formatDate value="${comment_list_cr[status.index]['CM_WRITTEN_DATE']}" pattern="yyyy.MM.dd" var="date"/>
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when> 
									<c:otherwise>
										<fmt:formatDate value="${comment_list_cr[status.index]['CM_WRITTEN_DATE']}" pattern="HH:mm"/>
									</c:otherwise>
								</c:choose>	 
						수정일
							<fmt:formatDate value="${comment_list_cr[status.index]['CM_UPDATED_DATE']}" pattern="yyyy.MM.dd" var="date"/>
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when> 
									<c:otherwise>
										<fmt:formatDate value="${comment_list_cr[status.index]['CM_UPDATED_DATE']}" pattern="HH:mm"/>
									</c:otherwise>
								</c:choose>	</div>
							
							<p>${comment_list_cr[status.index]['CM_CONTENT']}</p>

							<div class="reply_test">
								<div class="test_item rp">
									<p>
										<sec:authorize access="isAuthenticated()">
										<a role="button" class="reply" href="reply_view_cr?cm_no=${comment_list_cr[status.index]['CM_NO']}"
										onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;"
										>Reply</a> 
										</sec:authorize>
										<sec:authorize access="isAnonymous()">
										<a role="button" class="reply" href="loginview"
										>Reply</a>
										</sec:authorize>
									</p>
								</div>
								<c:if test = "${comment_list_cr[status.index]['M_NO'] != m_no}">
								<sec:authorize access="isAuthenticated()">
								<div class="test_item rep tooltip-purple">
									<a class="fas fa-skull fa-lg no-text-deco"
										href="report_view_cm?cm_no=${comment_list_cr[status.index]['CM_NO']}"
										onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;"
										data-toggle="tooltip" data-container=".tooltip-purple"
										data-placement="top" title="신고"> </a>
								</div>
								</sec:authorize>
								</c:if>
								<sec:authorize access="isAnonymous()">
								<div class="test_item rep tooltip-purple">
									<a class="fas fa-skull fa-lg no-text-deco" href="loginview"
										data-toggle="tooltip" data-container=".tooltip-purple"
										data-placement="top" title="신고"></a>
								</div>
								</sec:authorize>
								<c:if test = "${comment_list_cr[status.index]['M_NO'] eq m_no}">
								<div class="test_item del tooltip-purple">
									<a class="fas fa-trash-alt fa-lg no-text-deco"
										href="comment_delete_cr?cm_no=${comment_list_cr[status.index]['CM_NO']}&cr_no=${content_view_cr['CR_NO']}"
										data-toggle="tooltip" data-container=".tooltip-purple"
										data-placement="top" title="삭제"></a>
								</div>
								</c:if>
								<c:if test = "${comment_list_cr[status.index]['M_NO'] eq m_no}">
								<div class="test_item modi tooltip-purple">
									<a class="fas fa-edit fa-lg no-text-deco" id="cm_modi"
										href="comment_modify_view_cr?cm_no=${comment_list_cr[status.index]['CM_NO']}"
										onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;"
										data-toggle="tooltip" data-container=".tooltip-purple"
										data-placement="top" title="수정"></a>
								</div>
								</c:if>
							</div>
		
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

	<script src="js/board_hj/recommend_cm_cr.js"></script>
</body>
</html>