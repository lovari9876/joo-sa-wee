<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<title>SON-IN-RAW IS DICE - LOGIN</title>
</head>
<body>
	<%-- <sec:authorize access="isAnonymous()">
    <h5><a href='<c:url value="/loginview"/>'>LOGIN</a> 로그인 해주세요.</h5>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <form action="/logout" method="POST">
        <button type="submit">LOGOUT</button>
    </form>
</sec:authorize> --%>

	<c:if test="${kakaoID eq null}">
		<a
			href="https://kauth.kakao.com/oauth/authorize?client_id=808a2d6aa457367086dbabd054bb06a1&redirect_uri=http://localhost:8282/kakaologin&response_type=code">
			<img src="/images/bl_share/icons/login/kakaolink_btn_medium_ov.png">
			<h1>${kakaoID}카카오 로그인하시겠습니까?</h1>
		</a>
	</c:if>
	<c:if test="${kakaoID ne null}">
		<h1>${kakaoID}님 카카오 로그인 성공입니다</h1>
		<input type="button" value="로그아웃" onclick="location.href='/kakaoLogout'">
		<input type="button" value="로그아웃2" onclick="location.href='/kakaoLogout2'">
	</c:if>
</body>
</html>
