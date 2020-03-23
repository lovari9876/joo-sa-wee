<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="css/message/message.css" type="text/css" rel="stylesheet">

<!-- 기본틀 -->
<link rel="stylesheet" href="css/mypage/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/mypage/style.css" />
<link rel="stylesheet" type="text/css" href="css/mypage/liststyle.css" />
</head>

<body>

	<!-- header include -->
	<%@ include file="/WEB-INF/views/share/header.jsp"%>

	<div class="container web-portion">
		<h3 class=" text-center"></h3>
		<div class="messaging">
			<div class="inbox_msg">
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>Recent</h4>
						</div>
						<div class="srch_bar">
							<div class="stylish-input-group">
								<input type="text" class="search-bar" placeholder="Search">
								<span class="input-group-addon">
									<button type="button">
										<i class="fa fa-search" aria-hidden="true"></i>
									</button>
								</span>
							</div>
						</div>
					</div>
					<div class="inbox_chat">
						<div class="chat_list active_chat">
							<div class="chat_people">
								<div class="chat_img">
									<img src="images/bl_share/icons/login/wolf_logo.png" alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										쪽지 제목 <span class="chat_date">날짜</span>
									</h5>
									<p>쪽지 보낸사람</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="images/bl_share/icons/login/wolf_logo.png" alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Narin Kim <span class="chat_date">Dec 25</span>
									</h5>
									<p>쿠키사랑해 헉헉</p>
								</div>
							</div>
						</div>
						<div class="chat_list">
							<div class="chat_people">
								<div class="chat_img">
									<img src="images/bl_share/icons/login/wolf_logo.png" alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="mesgs">
					<div class="msg_history">
						<h3 class="text-center">대화 기록</h3>
						<br />
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>테스트입니닷</p>
									<span class="time_date"> 03:57 PM | June 9</span>
								</div>
							</div>
						</div>
						<div class="outgoing_msg">
							<div class="sent_msg">
								<p>Test which is a new approach to have all solutions</p>
								<span class="time_date"> 11:01 AM | June 9</span>
							</div>
						</div>
						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>Test, which is a new approach to have</p>
									<span class="time_date"> 11:01 AM | Yesterday</span>
								</div>
							</div>
						</div>

						<div class="incoming_msg">
							<div class="incoming_msg_img">
								<img src="https://ptetutorials.com/images/user-profile.png"
									alt="sunil">
							</div>
							<div class="received_msg">
								<div class="received_withd_msg">
									<p>We work directly with our designers and suppliers, and
										sell direct to you, which means quality, exclusive products,
										at a price anyone can afford.</p>
									<span class="time_date"> 11:01 AM | Today</span>
								</div>
							</div>
						</div>
					</div>
					<ul class="notebox">
						<li><a href="send_message"
							onClick="window.open(this.href, '', 'width=900, height=800, left=400, top=100'); return false;">
								<i class="fas fa-paper-plane"></i> 쪽지 보내기
						</a></li>
					</ul>
				</div>
			</div>


			<p class="text-center top_spac">
				Design by <a target="_blank" href="#">Sunil Rajput</a>
			</p>
		</div>
	</div>
	
	
</body>

<script src="resources/js/mypage/jquery-3.2.1.min.js"></script>
<script src="resources/js/mypage/popper.min.js"></script>
<script src="resources/js/mypage/bootstrap.min.js"></script>
<script src="resources/js/mypage/script.js"></script>

<!-- Java Script for header  ================================================== -->
<script src="js/header/jquery.slicknav.min.js"></script>
<script src="js/header/header_hyesoo.js"></script>
<!-- header 200317 새로 추가해야할 js -->
<script src="js/header/scroll.js"></script>

<script src="https://code.jquery.com/ui/1.8.5/jquery-ui.min.js" integrity="sha256-fOse6WapxTrUSJOJICXXYwHRJOPa6C1OUQXi7C9Ddy8=" crossorigin="anonymous"></script>


</html>