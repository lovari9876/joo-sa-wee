<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SON-IN-RAW IS DICE - my page</title>

<!-- 파피콘 -->
<link rel="icon" type="image/png" href="/images/share/wolf_logo.ico" />

<!-- mytrade 테이블 css -->
<link rel="stylesheet" type="text/css" href="/css/mypage/cassie/mypagestyle.css" />
<!-- 버튼 -->
<link rel="stylesheet" href="css/secondhand/buttonstyle.css" />

</head>

<body>

	<!-- 내 거래 -> 내판매/ 내구매 -->
	<!-- mypage 너무 길어서 분리.. -->
	<div class="tab-pane portfolio-detail fade mytrade--table" id="trade"
		role="tabpanel" aria-labelledby="contact-tab">
		
		<div class="sec-title">
			<p class="table--title">내 구매<p>
		</div>
		<table class="table">
			<tr class="table_row header">
				<th class="cell">거래<br/>번호</th>
				<th class="cell">보부상</th><!-- 보부상 글 제목 -->
				<th class="cell">구매자</th> <!-- 닉네임 -->
				<th class="cell">거래일</th> <!-- 주문 생성일 -->
				<th class="cell">결제일</th> <!-- 결제 전까지는 비워두기 -->
				<th class="cell">상태</th> <!-- p_status 기반 -->
				<th class="cell"></th> <!-- 변경 버튼 -->
				<!-- 게임,가격은 자세히 보기 눌러서 볼 것 -->
			</tr>
			<c:forEach items="${bPayList}" var="payment" >
				<tr class="table_row">
					<td class="cell">${payment['P_NO']}</td>
					<td class="cell">${payment['T_TITLE']}</td>
					<td class="cell">${payment['M_NICK']}</td>											
					<td class="cell">
						<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
						<fmt:formatDate value="${payment['P_ORDER_DATE']}" pattern="yyyy.MM.dd" var="date"/>
						<c:choose>
							<c:when test="${now ne date}">${date}</c:when> 
							<c:otherwise>
								<fmt:formatDate value="${payment['P_ORDER_DATE']}" pattern="HH:mm"/>
							</c:otherwise>
						</c:choose>											
					</td>	
					<td class="cell"> <!-- 결제일: 결제완료일 때만 출력 -->
						<c:if test="${payment['P_STATUS']==6}">
							<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
							<fmt:formatDate value="${payment['P_PAYMENT_DATE']}" pattern="yyyy.MM.dd" var="date"/>
							<c:choose>
								<c:when test="${now ne date}">${date}</c:when> 
								<c:otherwise>
									<fmt:formatDate value="${payment['P_PAYMENT_DATE']}" pattern="HH:mm"/>
								</c:otherwise>
							</c:choose>														
						</c:if>
					</td>
					<td class="cell">
					<!-- 거래 상태 -->
					<!-- 1.거래요청 2.입금대기 3.결제완료 4.배송준비중 5.배송완료 (관리자 승인 후) 
							6.거래완료(판매자에게 입금완료) 7. 거래취소 -->
						<c:choose>				
							<c:when test="${payment['P_STATUS'] eq 1}">거래요청</c:when>		
							<c:when test="${payment['P_STATUS'] eq 2}">입금대기</c:when>
							<c:when test="${payment['P_STATUS'] eq 3}">결제완료</c:when>
							<c:when test="${payment['P_STATUS'] eq 4}">배송 준비중</c:when>
							<c:when test="${payment['P_STATUS'] eq 5}">배송 완료</c:when>
							<c:when test="${payment['P_STATUS'] eq 6}">결제완료</c:when>
							<c:when test="${payment['P_STATUS'] eq 7}">거래취소</c:when>
							<c:otherwise>불명확</c:otherwise>
						</c:choose>											
					</td>
					<td class="cell"> <!-- 버튼 -->
						<div align="center" class="buy--button" >
							<button id ="myBtn" class="write-btn lavender-btn" type="button" >
								<c:choose>				
									<c:when test="${payment['P_STATUS'] eq 1}">가격확정</c:when>		
									<c:when test="${payment['P_STATUS'] eq 2}">입금대기</c:when>
									<c:when test="${payment['P_STATUS'] eq 3}">결제완료</c:when>
									<c:when test="${payment['P_STATUS'] eq 4}">배송 준비중</c:when>
									<c:when test="${payment['P_STATUS'] eq 5}">배송 완료</c:when>
									<c:when test="${payment['P_STATUS'] eq 6}">결제완료</c:when>
									<c:when test="${payment['P_STATUS'] eq 7}">거래취소</c:when>
									<c:otherwise>불명확</c:otherwise>
								</c:choose>
							</button> 
						</div>
					</td>										
				</tr>
			</c:forEach>
		</table>
		<br />
		
		
		<div class="sec-title">
			<p class="table--title">내 판매</p>
		</div>
		
		<table class="table">
			<tr class="table_row header">
				<th class="cell">거래<br/>번호</th>
				<th class="cell">보부상</th><!-- 보부상 글 제목 -->
				<th class="cell">구매자</th> <!-- 닉네임 -->
				<th class="cell">거래일</th> <!-- 주문 생성일 -->
				<th class="cell">결제일</th> <!-- 결제 전까지는 비워두기 -->
				<th class="cell">상태</th> <!-- p_status 기반 -->
				<th class="cell"></th> <!-- 변경 버튼 -->
				<!-- 게임,가격은 자세히 보기 눌러서 볼 것 -->
			</tr>
			<c:forEach items="${sPayList}" var="payment" >
				<tr class="table_row">
					<td class="cell">${payment['P_NO']}</td>
					<td class="cell">
						<a href="content_view_t?t_no=${payment['T_NO']}">
							${payment['T_TITLE']}
						</a>
					</td>
					<td class="cell">${payment['M_NICK']}</td>											
					<td class="cell">
						<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
						<fmt:formatDate value="${payment['P_ORDER_DATE']}" pattern="yyyy.MM.dd" var="date"/>
						<c:choose>
							<c:when test="${now ne date}">${date}</c:when> 
							<c:otherwise>
								<fmt:formatDate value="${payment['P_ORDER_DATE']}" pattern="HH:mm"/>
							</c:otherwise>
						</c:choose>											
					</td>	
					<td class="cell"> <!-- 결제일: 결제완료일 때만 출력 -->
						<c:if test="${payment['P_STATUS']==6}">
							<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
							<fmt:formatDate value="${payment['P_PAYMENT_DATE']}" pattern="yyyy.MM.dd" var="date"/>
							<c:choose>
								<c:when test="${now ne date}">${date}</c:when> 
								<c:otherwise>
									<fmt:formatDate value="${payment['P_PAYMENT_DATE']}" pattern="HH:mm"/>
								</c:otherwise>
							</c:choose>														
						</c:if>
					</td>
					<td class="cell">
					<!-- 거래 상태 -->
					<!-- 1.거래요청 2.입금대기 3.결제완료 4.배송준비중 5.배송완료 (관리자 승인 후) 
							6.거래완료(판매자에게 입금완료) 7. 거래취소 -->
						<c:choose>				
							<c:when test="${payment['P_STATUS'] eq 1}">거래요청</c:when>		
							<c:when test="${payment['P_STATUS'] eq 2}">입금대기</c:when>
							<c:when test="${payment['P_STATUS'] eq 3}">결제완료</c:when>
							<c:when test="${payment['P_STATUS'] eq 4}">배송 준비중</c:when>
							<c:when test="${payment['P_STATUS'] eq 5}">배송 완료</c:when>
							<c:when test="${payment['P_STATUS'] eq 6}">결제완료</c:when>
							<c:when test="${payment['P_STATUS'] eq 7}">거래취소</c:when>
							<c:otherwise>불명확</c:otherwise>
						</c:choose>
					</td> 
					<td class="cell"> <!-- 버튼 -->
						<div align="center" class="buy--button" >
							<button id ="price-btn" class="write-btn lavender-btn" type="button" >
								<c:choose>				
									<c:when test="${payment['P_STATUS'] eq 1}">가격확정</c:when>		
									<c:when test="${payment['P_STATUS'] eq 2}">입금대기</c:when>
									<c:when test="${payment['P_STATUS'] eq 3}">결제완료</c:when>
									<c:when test="${payment['P_STATUS'] eq 4}">배송 준비중</c:when>
									<c:when test="${payment['P_STATUS'] eq 5}">배송 완료</c:when>
									<c:when test="${payment['P_STATUS'] eq 6}">결제완료</c:when>
									<c:when test="${payment['P_STATUS'] eq 7}">거래취소</c:when>
									<c:otherwise>불명확</c:otherwise>
								</c:choose>
							</button> 
						</div>
					</td>										
				</tr>
			</c:forEach>
		</table>
	</div>


</body>

</html>