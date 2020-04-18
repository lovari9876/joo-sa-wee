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
							물품을 발송하신 다음, 택배사 및 운송장 번호를 입력해주세요.													
						</div>
						<br/>
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
						<!-- form table -->
						<table>
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
						<!-- modal close -->
						<span class="modal--close" onClick="closeSellModal()">close</span>
						<br/>
						
					</div>
					
				</form>						
			</div>
		</div>		
	</div>

	
	<script>
		
		// 구매요청 버튼 누를 때, 체크 안된 것이 있으면 alert 띄우고 모달 유지, 
		// 1개 이상 체크하면 완료 alert 띄우고 form action 주소 이동
		function isChecked() {
			var checkBoxes = document.getElementsByName("tg");	
			var msg = "구매 요청이 완료되었습니다.\n마이페이지에서 확인해보세요.";
			var chk = false;
			var count = 0;
			
			for(var i=0; i<checkBoxes.length; i++){
				if(checkBoxes[i].checked){
					count = count +1; 
				}
			}
			
			if(count != 0) {
				alert(msg);	
				return;
			} else {
				msg = "구매할 상품을 선택하세요.";
				alert(msg);	
				return false;
			}			
			
		} // 버튼에 onClick="return isChecked()" 이렇게 해야 
		  // 미체크 시 alert 띄우고 모달로 돌아온다!
		
	</script>
					

</body>
</html>