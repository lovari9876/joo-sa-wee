<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 파피콘 -->
<link rel="icon" type="image/png" href="images/share/wolf_logo.ico" />
<title>관리자 | 내사위는주사위</title>
<link type="text/css" href="/css/admin/bootstrap.min.css"rel="stylesheet">
<link type="text/css" href="/css/admin/bootstrap-responsive.min.css"rel="stylesheet">
<link type="text/css" href="/css/admin/theme.css" rel="stylesheet">
<link type="text/css" href="/images/admin/icons/css/font-awesome.css"rel="stylesheet">
<link type="text/css"href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600'rel='stylesheet'>
<!-- <link rel="stylesheet" href="css/liststyle.css" /> -->

<!-- jQuery for  -->
<script src="/js/cassie/jquery-3.2.1.min.js"></script>

</head>


<body>
	<script src="js/admin/jquery-1.9.1.min.js" type="text/javascript"></script>
	<!-- content -->

	<div class="span9">
		<div class="content">
			
			<!-- 구매자 -->
			<div class="module">
				<div class="module-head">
					<h3>구매자 계좌 정보</h3>
				</div>
				
					<div class = "table_mobile">
						<table class="table">
							<tr class="trow header">
								<td class="cell">회원 아이디</td>
								<td class="cell">은행명</td>
								<td class="cell span2">계좌번호</td>
								<td class="cell">환불</td>
							</tr>
							<tbody>
									<tr class="trow">
										<td class="cell">${account_s.m_id}</td>
										<td class="cell">${account_s.m_bank}</td>	
										<td class="cell">${account_s.m_account}</td>	
										<td class="cell"> <!-- 버튼 -->
											<button class="btn" type="button" value="${p_no}" 
													onclick="buyerRefund(this);">
												환불
											</button> 
										</td>	
									</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				
				<!-- 판매자 -->
			<div class="module">
				<div class="module-head">
					<h3>판매자 계좌 정보</h3>
				</div>
				
					<div class = "table_mobile">
						<table class="table">
							<tr class="trow header">
								<td class="cell">회원 아이디</td>
								<td class="cell">은행명</td>
								<td class="cell span2">계좌번호</td>
								<td class="cell">입금</td>
							</tr>
							<tbody>
									<tr class="trow">
										<td class="cell">${account_b.m_id}</td>
										<td class="cell">${account_b.m_bank}</td>	
										<td class="cell">${account_b.m_account}</td>	
										<td class="cell"> <!-- 버튼 -->
											<button class="btn" type="button" value="${p_no}" 
													onclick="sellerRemit(this);">
												입금
											</button> 
										</td>	
									</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				
			</div>
		</div>		

	<script type="text/javascript">
		/* 구매자 환불 */
		function buyerRefund(btn) {
			var p_no = $(btn).val();
			
			alert("구매자에게 환불 처리합니다.");
			
			// 부모창 이동, 자식 닫기
			opener.document.location.href="/admin/trade_list_refund/"+p_no;			
			self.close();
		}
		
		/* 판매자 입금 */
		function sellerRemit(btn) {
			var p_no = $(btn).val();
			
			alert("판매자에게 판매대금을 입금 처리합니다.");
			
			// 부모창 이동, 자식 닫기
			opener.document.location.href="/admin/trade_list_remit/"+p_no;			
			self.close();
		}
	
	</script>
	
	<script src="/js/admin/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="/js/admin/bootstrap.min.js" type="text/javascript"></script>


</body>
</html>