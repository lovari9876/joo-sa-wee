<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	

</head>
<body>

	<table width="500" cellpadding="0" cellspacing="10" border="1">
		<tr>
			<td>부서번호</td>
			<td>부서명</td>
			<td>장소</td>
			<td>사원번호</td>
			<td>사원이름</td>
			<td>직업</td>
			<td>매니저</td>
			<td>고용일</td>
			<td>고용일</td>
			<td>고용일</td>	
		</tr>
		
		<c:forEach items="${iList}" var="IslandVO">
			<tr>
					
				<td>${IslandVO.i_no}</td>
				<td>
					<c:choose>				
						<c:when test="${IslandVO.bt_no eq 1}">보드이야기</c:when>		
						<c:when test="${IslandVO.bt_no eq 2}">개봉기 및 리뷰</c:when>
						<c:when test="${IslandVO.bt_no eq 3}">보드게임 모임</c:when>
						<c:when test="${IslandVO.bt_no eq 4}">보드 뉴스</c:when>
						<c:when test="${IslandVO.bt_no eq 5}">질문&답변</c:when>
						<c:when test="${IslandVO.bt_no eq 6}">창작 보드게임</c:when>
						<c:when test="${IslandVO.bt_no eq 8}">일대일 문의</c:when>
						<c:when test="${IslandVO.bt_no eq 9}">보부상</c:when>
						<c:when test="${IslandVO.bt_no eq 11}">카페 리뷰</c:when>
						<c:otherwise>불명확</c:otherwise>
					</c:choose>
				</td>
				<td>${IslandVO.m_no}</td>
				<td>${IslandVO.i_title}</td>
				<td>${IslandVO.i_content}</td>
				<td>${IslandVO.i_written_date}</td>
			<%-- 	<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td> --%>
				<td>${IslandVO.i_hit}</td>
				<td>${IslandVO.i_recommend_num}</td>
				<td>${IslandVO.i_report_num}</td>
				<td>${IslandVO.i_hit}</td>				
			</tr>
		</c:forEach>

		<tr>
			<td colspan="11"><a href="write_view">글작성</a></td>
		</tr>
	</table>

	<%-- 	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>제목</td>
			<td>날짜</td>
			<td>히트</td>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td><c:forEach begin="1" end="${dto.bIndent}">-</c:forEach> <a
					href="content_view?bId=${dto.bId}">${dto.bTitle}</a></td>
				<td>${dto.bDate}</td>
				<td>${dto.bHit}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><a href="write_view">글작성</a></td>
		</tr>
	</table> --%>

</body>
</html>