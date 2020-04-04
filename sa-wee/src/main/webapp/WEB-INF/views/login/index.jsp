<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<sec:authorize access="isAnonymous()">
    <h5><a href='<c:url value="/loginView"/>'>LOGIN</a> 로그인 해주세요.</h5>
</sec:authorize>
