<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 파피콘 -->
<link rel="icon" type="image/png" href="images/share/wolf_logo.ico" />
<title>Admin</title>
<link type="text/css" href="css/admin/bootstrap.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/bootstrap-responsive.min.css"rel="stylesheet">
<link type="text/css" href="css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="images/admin/icons/css/font-awesome.css"rel="stylesheet">
<link type="text/css"href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->
</head>


<body>
	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	<%@include file="side.jsp"%>


	<!-- content -->

	<div class="span9">
		<div class="content">
			<div class="module">
				<div class="module-head">
					<h3>중고거래 내역</h3>
				</div>
				<div class="module-option clearfix">
					<form>

						<div class="control-group">

							<div class="controls">
								<script>
								      $(function(){
											  $('#searchBtn').click(function() {
											  	event.preventDefault(); // event canceled 막기!
											    	self.location = "trade_list" 
											    				+ '${pageMaker.makeQuery(1)}' 
											    				+ "&searchType=" 
											    				+ $("#searchType option:selected").val() 
											    				+ "&keyword=" 
											    				+ encodeURIComponent($('#keywordInput').val());
											  });
											}); 
								   </script>
								
								 <div class="dropdown pull-left">
										<select id="searchType" name="searchType" class="span2">
											<option value = "n" class="btn" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색타입선택</option>
											<option value = "a" class="btn" <c:out value="${scri.searchType eq 'a' ? 'selected' : ''}"/>>판매자 아이디 </option>
											<option value = "b" class="btn" <c:out value="${scri.searchType eq 'b' ? 'selected' : ''}"/>>구매자 아이디 </option>
										</select>
								</div> 
								
								<div class="input-append pull-left">
									<input type="text" maxlength="30"  name="keyword" id="keywordInput" value="${scri.keyword}" class="span2" placeholder="조회 /검색어 입력">
									<button type="submit" class="btn" id="searchBtn">
										<i class="icon-search"></i>
									</button>
								</div> 
								
								
							</div>
						</div>

					</form>
					
				</div>


				<section class="list-section">

					<!-- 리스트 -->
					<div class = "table_mobile">
					<table class="table">
						<tr class="trow header">
							<td class="cell">거래번호</td>
							<td class="cell">판매자</td>
							<td class="cell">구매자</td>
							<td class="cell">거래일</td>
							<td class="cell">결제일</td>
							<td class="cell">상태</td>
							<td class="cell">거래상세</td>
							<td class="cell">입금</td>
						</tr>
						<tbody>

							<c:forEach items="${trade_list}" var="trade" >
								<tr class="trow">
									<td class="cell">${trade['P_NO']}</td>
									<td class="cell">${trade['M_SID']}</td>
									<td class="cell">${trade['M_BID']}</td>											
									<td class="cell">
										<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
										<fmt:formatDate value="${trade['P_ORDER_DATE']}" pattern="yyyy.MM.dd" var="date"/>
										<c:choose>
											<c:when test="${now ne date}">${date}</c:when> 
											<c:otherwise>
												<fmt:formatDate value="${trade['P_ORDER_DATE']}" pattern="HH:mm"/>
											</c:otherwise>
										</c:choose>											
									</td>	
									<td class="cell"> <!-- 결제일: 결제완료일 때만 출력 -->
										<c:if test="${payment['P_STATUS']!=1 || payment['P_STATUS']!=7}">
											<!-- 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 -->
											<fmt:formatDate value="${trade['P_PAYMENT_DATE']}" pattern="yyyy.MM.dd" var="date"/>
											<c:choose>
												<c:when test="${now ne date}">${date}</c:when> 
												<c:otherwise>
													<fmt:formatDate value="${trade['P_PAYMENT_DATE']}" pattern="HH:mm"/>
												</c:otherwise>
											</c:choose>														
										</c:if>
									</td>
									<td class="cell">
									<!-- 거래 상태 -->
									<!-- 1.입금대기 2.결제완료 4.배송준비중 5.배송완료 (관리자 승인 후) 
											6.거래완료(판매자에게 입금완료) 7. 거래취소 -->
										<c:choose>				
											<c:when test="${trade['P_STATUS'] eq 1}">거래요청</c:when>		
											<c:when test="${trade['P_STATUS'] eq 2}">결제완료</c:when>
											<c:when test="${trade['P_STATUS'] eq 3}">배송중</c:when>
											<c:when test="${trade['P_STATUS'] eq 4}">배송완료</c:when>
											<c:when test="${trade['P_STATUS'] eq 5}">5</c:when>
											<c:when test="${trade['P_STATUS'] eq 6}">6</c:when>
											<c:when test="${trade['P_STATUS'] eq 7}">거래취소</c:when>
											<c:otherwise>불명확</c:otherwise>
										</c:choose>											
									</td>
									<td class="cell"> <!-- 버튼 -->
										<button class="btn pgt_detail" type="button" value="${trade['P_NO']}">
											상세내역
										</button> 
									</td>	
									
									<td class="cell"> <!-- 버튼 -->
										<button class="btn pgt_account" type="button" data-sno="${trade['M_SNO']}" data-bno="${trade['M_BNO']}">
											입금
										</button> 
									</td>	
									
																		
								</tr>
							</c:forEach>
	
						</tbody>

					</table>
				
					<script>
						$(".pgt_detail").click(function() {
							var p_no = $(this).val();
							window.open("trade_list_pgt/" + p_no, "a", "width=400, height=200, left=800, top=300"); 
						});
						
						$(".pgt_account").click(function() {
							var sno = $(this).attr('data-sno');
							var bno = $(this).attr('data-bno');
							window.open("trade_list_account/" + sno + "/" + bno, "a", "width=400, height=290, left=800, top=300"); 
						});
						
					
					
					</script>
					
					</div>

					<div class="pagination pagination-centered">
						<ul>
							<c:if test="${pageMaker.prev}">
								<li><a
									href="trade_list${pageMaker.makeSearch(pageMaker.startPage - 1)}"><i
										class="icon-double-angle-left"></i></a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}" var="idx">
								<li><a href="trade_list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="trade_list${pageMaker.makeSearch(pageMaker.endPage + 1)}"><i
										class="icon-double-angle-right"></i></a></li>
							</c:if>
						</ul>
					</div>
					
			</div>
		</div>
	</div>

	</section>



	</div>
	</div>
	<!--/.content-->
	</div>
	<!--/.span9-->
	<!-- 		</div>
		</div> -->
	<!--/.container-->
	<!-- 	</div> -->
	<!--/.wrapper-->

	<div class="footer">
		<div class="container">


			<b class="copyright">&copy; 2014 Edmin - EGrappler.com </b> All
			rights reserved.
		</div>
	</div>

	<script src="js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="js/admin/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>