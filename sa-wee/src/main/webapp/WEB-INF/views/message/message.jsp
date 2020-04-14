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
<!-- 내용 -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<link href="css/message/message.css" type="text/css" rel="stylesheet">

<!-- 기본틀 -->
<link rel="stylesheet" href="css/mypage/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mypage/style.css" />
<link rel="stylesheet" type="text/css" href="css/mypage/liststyle.css" />
<link rel="stylesheet" type="text/css" href="css/message/check.css" />

<!-- 403 에러 / csrf 토큰 문제 -->
<%-- <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"
	content="${_csrf.headerName}" /> --%>	
</head>

<body>

	<!-- header include -->
	<%@ include file="/WEB-INF/views/share/header.jsp"%>

	<div class="container web-portion">
		<h3 class=" text-center"></h3>
		<div class="messaging">
			<form id="viewForm" method="post">
				<div class="inbox_msg">
					<div class="inbox_people">
						<div class="headind_srch">
							<div class="recent_heading">							
								<div>									
									<button type="button" class="btn-receive" value="${member.m_no} ">receive</button>
								</div>
								<div>
									<button type="button" class="btn-send" value="${member.m_no}">send</button>
								</div>
							</div>
							<div class="srch_bar">
								<!-- <div class="stylish-input-group"> -->									
									<div class="delBtn">
										<button type="button" class="selectDelete_btn" data-NN="<%-- ${message['N_NO']} --%>">delete</button>
									</div>
								<!-- </div> -->
							</div>
						</div>
						<div class="inbox_chat">
							<div class="allCheck">
								<input type="checkbox" name="allCheck" id="allCheck" /><label
									for="allCheck">모두 선택</label>
							</div>							
							<div class="delBtn">
								<button type="button" class="selectDelete_btn"></button>
							</div>
							<br/>
							<div id="ajax_test">
							<c:forEach items="${message}" var="message">
								<c:if test="${message['M_NO'] == member.m_no && message['N_BLIND'] != 2}">
								<div class="checkBox">
									<input type="checkbox" name="chBox" class="chBox"
										data-NN="${message['N_NO']}" />
								</div>
								

								<div class="chat_list active_chat">
									<div class="chat_people">
										<div class="chat_img">
											<img src="images/bl_share/icons/login/wolf_logo.png"
												alt="sunil">
										</div>
										<div class="chat_ib">
											<h5>
												<a href="/rest/message?n_no=${message['N_NO']}">${message['N_TITLE']}
													<input id="n_no" type="hidden" value="${message['N_NO']}" />
												</a> <span class="chat_date"> <fmt:formatDate
														pattern="yyyy-MM-dd HH:mm"
														value="${message['N_WRITTEN_DATE']}" />
												</span>
											</h5>
											<p>${message['M2_NICK']}</p>

										</div>
									</div>
								</div>
								</c:if>
							</c:forEach>
							</div>
						</div>
						<!-- security -->
						<%-- <input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> --%>
					</div>

					<div id="ajax_content" class="mesgs">
						<div class="msg_history">
							<div id="one_note">
								<h5 class="text-center" id="one_n_title">${noteContent['N_TITLE']}</h5>
								<hr />
								<p>${noteContent['M2_NICK']}
									<span class="time_date" id="one_n_date"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm"
											value="${noteContent['N_WRITTEN_DATE']}" /></span>
								</p>
								<hr />
								<p id="one_n_content">${noteContent['N_CONTENT']}</p>
							</div>
							<%-- <div id="note_content">
								<h5 class="text-center">${noteContent['N_TITLE']}</h5>
								<hr />
								<p>${noteContent['M2_NICK']}
									<span class="time_date"><fmt:formatDate
											pattern="yyyy-MM-dd HH:mm"
											value="${noteContent['N_WRITTEN_DATE']}" /></span>
								</p>
								<hr />
								<p>${noteContent['N_CONTENT']}</p>
							</div> --%>
						</div>
					</div>
					<ul class="notebox">
						<li><a href="send_messageview"
							onClick="window.open(this.href, '', 'width=900, height=800, left=400, top=100'); return false;">
								<i class="fas fa-paper-plane"></i> 쪽지 보내기
						</a></li>
					</ul>
				</div>


			</form>

			<p class="text-center top_spac">
				Design by <a target="_blank" href="#">Sunil Rajput</a>
			</p>
		</div>
	</div>



</body>

<script src="js/mypage/jquery-3.2.1.min.js"></script>
<script src="js/mypage/popper.min.js"></script>
<script src="js/mypage/bootstrap.min.js"></script>
<script src="js/mypage/script.js"></script>
<script src="js/message/content.js"></script>
<script src="js/message/check.js"></script>

<!-- Java Script for header  ================================================== -->
<script src="js/header/jquery.slicknav.min.js"></script>
<script src="js/header/header_hyesoo.js"></script>
<!-- header 200317 새로 추가해야할 js -->
<script src="js/header/scroll.js"></script>

<script src="https://code.jquery.com/ui/1.8.5/jquery-ui.min.js"
	integrity="sha256-fOse6WapxTrUSJOJICXXYwHRJOPa6C1OUQXi7C9Ddy8="
	crossorigin="anonymous"></script>

</html>