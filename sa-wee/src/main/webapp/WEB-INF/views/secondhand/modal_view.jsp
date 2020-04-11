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

<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

<!-- 버튼 -->
<link rel="stylesheet" href="css/secondhand/buttonstyle.css" />
<!-- modal -->	
<link rel="stylesheet" href="css/secondhand/modalstyle.css" />

</head>
<body >
						
	<!-- Modal HTML embedded directly into document -->
	<div id="myModal" class="modal--trade">
	
		<div class="modal--content">						
			<div>
				<!-- 폼 수정해서 살 것 select, 가격 select하도록.. -->
				<form action="trade_modify" method="post" enctype="multipart/form-data">
					<input type = "hidden" id = "bt_no" value = "9"/>
					<input type = "hidden" id = "t_no" name="t_no" value = "${tradeVO['T_NO']}"/>
					<input type = "hidden" name="t_island" value = "${tradeVO['T_ISLAND']}" />
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<!-- 로그인 된 상태일 때 글쓰기 가능하도록.. -->
					<!-- <input type = "hidden" id = "m_no" value = ""/> -->									
					
					<table class="write-table">
						<tr class = "row">
							<td class = "cell">말머리 </td>
							<td class = "cell"> 
								<select name="s_no" >
									<option value="32" <c:out value="${tradeVO['S_NO'] == 32 ? 'selected' : ''}"/>>판매중</option>
									<option value="33" <c:out value="${tradeVO['S_NO'] == 33 ? 'selected' : ''}"/>>구매중</option>
									<option value="34" <c:out value="${tradeVO['S_NO'] == 34 ? 'selected' : ''}"/>>거래완료</option>
								</select> 								
							</td>							
						</tr>					
						
						<!-- 입력창 -->
						<tr class="row">
							<td class="cell">제목</td>
							<td class="cell">
								<input type="text" name="t_title" value="${tradeVO['T_TITLE']}" placeholder="제목을 입력하세요">
							</td>
						</tr>
						
						<!-- select 로 보드게임 번호 찍어줘야함... -->
						<!-- 없으면 직접 입력 가능: 향후 방향성 모호하므로 일단 이름 하나만 입력하도록. -->
						<tr class="row">
							<td class="cell">보드게임</td>
							<td class="cell">
								<input type="text" name="gameNames" value="${gameNames}"
									placeholder="보드게임의 이름을 쉼표(,)로 구분하여 입력하세요">
							</td>
						</tr>
						
						<tr class="row">
							<td class="cell">가격</td>
							<td class="cell">
								<input type="text" name="prices" value="${prices}"
										placeholder="보드게임의 희망 가격을 쉼표(,)로 구분하여 숫자로 입력하세요">
							</td>
						</tr>
						
					</table>
					<button class="list" type="button" onclick="self.location='tlist'">목록</button>
					<button class="modify-btn" type="submit">수정 완료</button>
				</form>
			
				<span id="modal--close">close</span>
			</div>
		</div>
		
	</div>
	
	<script>
		// Get the modal
		var modal = document.getElementById('myModal');
		
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
		
		// Get the <span> element that closes the modal
		var span = document.getElementById("modal--close");                                          
		
		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
		    modal.style.display = "block";
		}
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		    modal.style.display = "none";
		}
	</script>
					

</body>
</html>