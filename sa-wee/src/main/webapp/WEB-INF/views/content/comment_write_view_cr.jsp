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

</head>
<body>
		<!-- 댓글 쓰기 -->
			<h3 class="mb-5">Leave a comment</h3>
			<form action="comment_write_cr" method="post">
				<input type="hidden" name="cm_no2" value="${content_view_cr['CR_NO']}">
				<input type="hidden" name="cr_no" value="${content_view_cr['CR_NO']}">
				<input type="hidden" name="m_no" value="${m_no}">
				<div class="form-group">
					<label for="message">Comment</label>
					<textarea name="cm_content" id="message" cols="30" rows="10"
						class="form-control" placeholder="댓글을 입력하세요."></textarea>
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
</body>
</html>