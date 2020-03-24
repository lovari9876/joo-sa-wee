<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>SON-IN-RAW IS DICE - LOGIN</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

</head>
<body>
	<p>${member.m_id}님환영합니다</p>
	<c:if test="${member == null}">
		<a href="/login">로그인 </a>
	</c:if>

	<c:if test="${msg == false}">
		<p style="color: #f00;">로그인에 실패. 아이디 또는 패스워드를 다시 입력해주십시오.</p>
	</c:if>

	<c:if test="${member != null}">
		<p>${member.m_id}님환영합니다</p>
	</c:if>
</body>
</html>

