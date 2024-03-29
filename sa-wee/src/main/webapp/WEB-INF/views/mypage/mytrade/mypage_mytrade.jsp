<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>내 사위는 주사위</title>

<!-- 파피콘 -->
<link rel="icon" type="image/png" href="/images/share/wolf_logo.ico" />

<!-- mytrade 테이블 css -->
<link rel="stylesheet" type="text/css"
	href="/css/mypage/cassie/mypagestyle.css" />
<!-- 버튼 -->
<link rel="stylesheet" href="/css/secondhand/buttonstyle.css" />

</head>

<body>

	<!-- 내 거래 -> 내판매/ 내구매 -->
	<!-- mypage 너무 길어서 분리.. -->
	<div class="tab-pane tab-pane2 portfolio-detail fade mytrade--table"
		id="trade" role="tabpanel" aria-labelledby="contact-tab">
		<div class="table-mypage-half">
			<div class="sec-title">
				<p class="table--title">내 구매
				<p>
			</div>
			<table class="table">
				<tr class="table_row header">
					<th class="cell">거래<br />번호
					</th>
					<th class="cell">보부상</th>
					<!-- 보부상 글 제목 -->
					<th class="cell">판매자</th>
					<!-- 닉네임 -->
					<th class="cell">거래일</th>
					<!-- 주문 생성일 -->
					<th class="cell">결제일</th>
					<!-- 결제 전까지는 비워두기 -->
					<th class="cell">상태</th>
					<!-- p_status 기반 -->
					<th class="cell"></th>
					<!-- 변경 버튼 -->
					<!-- 게임,가격은 자세히 보기 눌러서 볼 것 -->
				</tr>
				<c:forEach items="${bPayList}" var="payment">
					<c:set var="buyer" value="${payment['M_BNO']}" scope="request"></c:set>
					<tr class="table_row">
						<td class="cell">${payment['P_NO']}</td>
						<td class="cell"><a
							href="content_view_t?t_no=${payment['T_NO']}">
								${payment['T_TITLE']} </a></td>
						<td class="cell">${payment['M_NICK']}</td>
						<td class="cell">
							<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 --> <fmt:formatDate
								value="${payment['P_ORDER_DATE']}" pattern="yyyy.MM.dd"
								var="date" /> <c:choose>
								<c:when test="${now ne date}">${date}</c:when>
								<c:otherwise>
									<fmt:formatDate value="${payment['P_ORDER_DATE']}"
										pattern="HH:mm" />
								</c:otherwise>
							</c:choose>
						</td>
						<td class="cell">
							<!-- 결제일: 결제완료일 때만 출력 --> <c:if
								test="${payment['P_STATUS']!=1 || payment['P_STATUS']!=7}">
								<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
								<fmt:formatDate value="${payment['P_PAYMENT_DATE']}"
									pattern="yyyy.MM.dd" var="date" />
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when>
									<c:otherwise>
										<fmt:formatDate value="${payment['P_PAYMENT_DATE']}"
											pattern="HH:mm" />
									</c:otherwise>
								</c:choose>
							</c:if>
						</td>
						<td class="cell">
							<!-- 거래 상태 --> <!-- 1.입금대기 2.결제완료 4.배송준비중 5.배송완료 (관리자 승인 후) 
							6.거래완료(판매자에게 입금완료) 7. 거래취소 --> <c:choose>
								<c:when test="${payment['P_STATUS'] eq 1}">거래요청</c:when>
								<c:when test="${payment['P_STATUS'] eq 2}">결제완료</c:when>
								<c:when test="${payment['P_STATUS'] eq 3}">배송중</c:when>
								<c:when test="${payment['P_STATUS'] eq 4}">배송완료</c:when>
								<c:when test="${payment['P_STATUS'] eq 5}">거래완료</c:when>
								<c:when test="${payment['P_STATUS'] eq 6}">6</c:when>
								<c:when test="${payment['P_STATUS'] eq 7}">거래취소</c:when>
								<c:otherwise>불명확</c:otherwise>
							</c:choose>
						</td>
						<td class="cell">
							<!-- 버튼 -->
							<div align="center" class="buy--button">
								<button class="write-btn lavender-btn" type="button"
									data-courier="${payment['P_COURIER']}"
									data-tracking="${payment['P_TRACKING']}"
									name="${payment['P_STATUS']}" value="${payment['P_NO']}"
									onclick="buyModal(this);">
									<c:choose>
										<c:when test="${payment['P_STATUS'] eq 1}">결제하기</c:when>
										<c:when test="${payment['P_STATUS'] eq 2}">배송대기</c:when>
										<c:when test="${payment['P_STATUS'] eq 3}">수취확인</c:when>
										<c:when test="${payment['P_STATUS'] eq 4}">상세정보</c:when>
										<c:when test="${payment['P_STATUS'] eq 5}">상세정보</c:when>
										<c:when test="${payment['P_STATUS'] eq 6}">6</c:when>
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
		<br />

		<div class="table-mypage-half">
			<div class="sec-title">
				<p class="table--title">내 판매</p>
			</div>

			<table class="table">
				<tr class="table_row header">
					<th class="cell">거래<br />번호
					</th>
					<th class="cell">보부상</th>
					<!-- 보부상 글 제목 -->
					<th class="cell">구매자</th>
					<!-- 닉네임 -->
					<th class="cell">거래일</th>
					<!-- 주문 생성일 -->
					<th class="cell">결제일</th>
					<!-- 결제 전까지는 비워두기 -->
					<th class="cell">상태</th>
					<!-- p_status 기반 -->
					<th class="cell"></th>
					<!-- 변경 버튼 -->
					<!-- 게임,가격은 자세히 보기 눌러서 볼 것 -->
				</tr>
				<c:forEach items="${sPayList}" var="payment" varStatus="status">
					<c:set var="seller" value="${payment['M_SNO']}" scope="request"></c:set>
					<tr class="table_row">
						<td class="cell">${payment['P_NO']}</td>
						<td class="cell"><a
							href="content_view_t?t_no=${payment['T_NO']}">
								${payment['T_TITLE']} </a></td>
						<td class="cell">${payment['M_NICK']}</td>
						<td class="cell">
							<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 --> <fmt:formatDate
								value="${payment['P_ORDER_DATE']}" pattern="yyyy.MM.dd"
								var="date" /> <c:choose>
								<c:when test="${now ne date}">${date}</c:when>
								<c:otherwise>
									<fmt:formatDate value="${payment['P_ORDER_DATE']}"
										pattern="HH:mm" />
								</c:otherwise>
							</c:choose>
						</td>
						<td class="cell">
							<!-- 결제일: 결제완료일 때만 출력 --> <c:if
								test="${payment['P_STATUS']!=1 || payment['P_STATUS']!=7}">
								<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
								<fmt:formatDate value="${payment['P_PAYMENT_DATE']}"
									pattern="yyyy.MM.dd" var="date" />
								<c:choose>
									<c:when test="${now ne date}">${date}</c:when>
									<c:otherwise>
										<fmt:formatDate value="${payment['P_PAYMENT_DATE']}"
											pattern="HH:mm" />
									</c:otherwise>
								</c:choose>
							</c:if>
						</td>
						<td class="cell">
							<!-- 거래 상태 --> <!-- 1.거래요청 2.입금대기 3.결제완료 4.배송준비중 5.배송완료 (관리자 승인 후) 
							6.거래완료(판매자에게 입금완료) 7. 거래취소 --> <c:choose>
								<c:when test="${payment['P_STATUS'] eq 1}">거래요청</c:when>
								<c:when test="${payment['P_STATUS'] eq 2}">결제완료</c:when>
								<c:when test="${payment['P_STATUS'] eq 3}">배송중</c:when>
								<c:when test="${payment['P_STATUS'] eq 4}">배송완료</c:when>
								<c:when test="${payment['P_STATUS'] eq 5}">거래완료</c:when>
								<c:when test="${payment['P_STATUS'] eq 6}">6</c:when>
								<c:when test="${payment['P_STATUS'] eq 7}">거래취소</c:when>
								<c:otherwise>불명확</c:otherwise>
							</c:choose>
						</td>
						<td class="cell">
							<!-- 버튼 -->
							<div align="center" class="buy--button">
								<button class="write-btn lavender-btn" type="button"
									data-courier="${payment['P_COURIER']}"
									data-tracking="${payment['P_TRACKING']}"
									name="${payment['P_STATUS']}" value="${payment['P_NO']}"
									onclick="sellModal(this);">
									<c:choose>
										<c:when test="${payment['P_STATUS'] eq 1}">주문확인</c:when>
										<c:when test="${payment['P_STATUS'] eq 2}">운송장입력</c:when>
										<c:when test="${payment['P_STATUS'] eq 3}">상세정보</c:when>
										<c:when test="${payment['P_STATUS'] eq 4}">상세정보</c:when>
										<c:when test="${payment['P_STATUS'] eq 5}">입금확인</c:when>
										<c:when test="${payment['P_STATUS'] eq 6}">6</c:when>
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
	</div>

</body>

</html>