<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUN-IN-LAW IS DISE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

</head>
<body>
	<!-- 댓글 쓰기 -->
	<div class="comment-form-wrap ">
		<h3 class="mb-5">한줄평 부분입니다.</h3>
		<form action="comment_write_or" method="get">
			<input type="hidden" name="cm_no2" value="${cafe_info.c_no}">
			<input type="hidden" name="c_no" value="${cafe_info.c_no}">
			<input type="hidden" name="m_no" value="${m_no}">
			<div class="form-group">
				<label for="message">Comment</label> <input type="text" id="message"
					class="form-control" name="cm_content" placeholder="내용을 입력하세요">
			</div>
			<div class="form-group">
				<sec:authorize access="isAuthenticated()">
				<input type="submit" value="작성" class="btn btn-lavender btn-md">
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
				<input type="button" value="작성" class="btn btn-lavender btn-md" Onclick="location.href='http://localhost:8282/loginview'">
				</sec:authorize>
			</div>
		</form>
	</div>

</body>
</html>