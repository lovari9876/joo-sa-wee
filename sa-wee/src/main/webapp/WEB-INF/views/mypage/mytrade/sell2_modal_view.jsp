<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>SON-IN-LAW IS DISE</title>
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- LOGO
    ================================================== -->
    <link rel="icon" type="image/png"
		href="/images/share/wolf_logo.ico" />
	
	<!-- modal -->	
	<link rel="stylesheet" href="/css/mypage/cassie/mypage_modalstyle.css" />

</head>
<body >
						
	<!-- 2. 판매자가 운송장 입력하는 모달 -->
	<div id="sell2-modal" class="modal--trade">
	
		<div class="modal--content">						
			<div>
				<!-- ajax로 값 불러와서 form으로 전달  -->
				<form action="sellerTracking" method="post" enctype="multipart/form-data">
					<input type = "hidden" class="sell2-modal-p_no" name="p_no" /> 
					<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
					
					<!-- 로그인 된 상태일 때 글쓰기 가능하도록.. -->
					<!-- <input type = "hidden" id = "m_no" value = ""/> -->									
					<div class="table--div">
						<div class="modal--info">
							구매자의 결제가 완료되었습니다.<br/>
							결제 내역은 아래와 같습니다.													
						</div>
						<table>
							<thead>
								<tr class="table--row">
									<th class="table--cell">보드게임</th>
									<th class="table--cell">희망가격</th>
								</tr>
							</thead>
							<tbody id="ajax-sell2">
							</tbody>			
							<!-- ajax로 게임, 가격 받는 부분 -->				
							<tr class="table--row sum--row">
								<td class="table--cell">합계</td>
								<td id="ajax-sum-sell2" class="table--cell"></td>
							</tr> <!-- 결국 마이페이지 내의 모달은 다 한 페이지에 있기에 -->
								  <!-- 절대 모달끼리 id가 중복되면 안된다.. 안나와.. -->
								  
						</table>
						<br/>
						<br/>
						<div class="modal--info">
							물품을 발송하신 다음, 택배사 및 운송장 번호를 입력해주세요.													
						</div>
						<!-- form table -->
						<table class="tracking_table">
							<tr class="table--row">
								<td class="table--cell">택배사</td>
								<td class="table--cell">
									<input type = "text" name="p_courier" 
										placeholder="택배사를 입력하세요."/>
								</td>
							</tr>	
							
							<tr class="table--row">
								<td class="table--cell">운송장</td>
								<td class="table--cell">
									<input type = "text" name="p_tracking" 
										placeholder="운송장 번호를 입력하세요."/>
								</td>
							</tr>
						</table>
						<br/>						
						<!-- form 제출 -->
						<button class="write-btn lavender-btn" type="submit"
								onClick="alert('제출합니다.');">확인</button>
						<!-- modal close -->
						<span class="modal--close" onClick="closeSellModal()">close</span>						
						
					</div>
					
				</form>						
			</div>
		</div>		
	</div>
					

</body>
</html>