<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<sec:authorize access="isAnonymous()">
    <h5><a href='<c:url value="/loginView"/>'>LOGIN</a> 로그인 해주세요.</h5>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <form action="/logout" method="POST">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <button type="submit">LOGOUT</button>
    </form>
</sec:authorize>


	<!-- a태그로 form 태그 사용하기  -->
	<!--
	<a href="#" onclick="document.getElementById('logout-form').submit();">Sign out</a>
	<form id="logout-form" action='<c:url value='/accounts/logout'/>' method="POST">
	   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>
	-->


