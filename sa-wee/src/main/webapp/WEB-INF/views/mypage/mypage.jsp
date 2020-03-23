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

<link rel="stylesheet" href="/css/mypage/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/mypage/style.css" />

<link rel="stylesheet" type="text/css" href="/css/mypage/liststyle.css" />
</head>

<body>
	<!-- header include -->
	<%@ include file="/WEB-INF/views/share/header.jsp"%>

	<div class="container-fluid">
		<div class="cover">
			<div class="cover-layer">
				<div class="container web-portion">
					<div class="row top-det">
						<div class="col-md-4">
							<div class="profil-det-img d-flex">
								<div class="dp">
									<img src="images/bl_share/icons/login/wolf_logo.png" alt="">
								</div>
								<div class="pd">
									<h2>닉네임</h2>
									<p>랭크</p>
								</div>

							</div>
						</div>
						<div class="col-md-4 eml-mob">
							<ul>
								<li>작성글 수 :</li>
								<li>댓글 수 :</li>
							</ul>
						</div>
						<div class="col-md-4 eml-mob">
							<ul>
								<li>포인트 :</li>
								<li>안 본 쪽지 :</li>
							</ul>
						</div>
					</div>
					<div class="nav-detail">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">내 정보</a></li>
							<li class="nav-item"><a class="nav-link" id="profile-tab"
								data-toggle="tab" href="#profile" role="tab"
								aria-controls="profile" aria-selected="false">내 글</a></li>
							<li class="nav-item"><a class="nav-link" id="education-tab"
								data-toggle="tab" href="#education" role="tab"
								aria-controls="contact" aria-selected="false">내 댓글</a></li>
							<li class="nav-item"><a class="nav-link" id="portfolio-tab"
								data-toggle="tab" href="#portfolio" role="tab"
								aria-controls="contact" aria-selected="false">내 스크랩</a></li>
							<li class="nav-item"><a class="nav-link" id="contact-tab"
								data-toggle="tab" href="#contact" role="tab"
								aria-controls="contact" aria-selected="false">내 후원/신고 </a></li>
							<li class="nav-item"><a class="nav-link" id="contact-tab"
								data-toggle="tab" href="#trade" role="tab"
								aria-controls="contact" aria-selected="false">내 거래 </a></li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<div class="row no-margin home-det">
									<div class="col-md-4 eml-mob">
										<ul>
											<li>아이디 :</li>
											<br />
											<li>이메일 :</li>
											<br />
											<li>핸드폰 :</li>
											<br />
											<li>주소 :</li>
											<br />
											<li>가입일 :</li>
											<br />
											<li>신고당한 수 :</li>
											<br />
										</ul>
									</div>
									<div class="col-md-8 home-dat">
										<div class="detal-jumbo">
											<h3>자기소개</h3>
											<p>안녕 민이라고 해~</p>
											<br /> <br /> <br /> <br /> <br />
										</div>

										<div class="jumbo-address">
											<div class="row no-margin">
												<div class="col-lg-6 no-padding">

													<table class="addrss-list">
														<tbody>
															<tr>
																<th>sms수신여부</th>
																<td>Y</td>
															</tr>
															<tr>
																<th>메일수신여부</th>
																<td>Y</td>
															</tr>
														</tbody>
													</table>

												</div>
												<div class="col-lg-6 no-padding">
													<table class="addrss-list">
														<tbody>
															<tr>
																<th>쪽지수신여부</th>
																<td>Y</td>
															</tr>
															<tr>
																<th>회원정보공개여부</th>
																<td>Y</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>

										<div class="links">
											<div class="row ">
												<div class="col-xl-6 col-md-12">
													<ul class="btn-link">
														<li><a href="message"><i
																class="fas fa-paper-plane"></i> 쪽지함</a></li>
														<li><a href="modify_mypage"> <i
																class="fas fa-address-card"></i> 회원정보수정
														</a></li>
														<!-- <li><a href="#modify_mypage"> <i class="fas fa-cloud-download-alt"></i>
																수정
														</a></li> -->
													</ul>
												</div>
												<div class="col-xl-6 col-md-12">
													<ul class="social-link">
														<li><i class="fab fa-facebook-f"></i></li>
														<li><i class="fab fa-twitter"></i></li>
														<li><i class="fab fa-pinterest-p"></i></li>
														<li><i class="fab fa-linkedin-in"></i></li>
														<li><i class="fab fa-youtube"></i></li>
													</ul>
												</div>
											</div>
										</div>

									</div>
								</div>

							</div>
							<div class="tab-pane fade profile-tab" id="profile"
								role="tabpanel" aria-labelledby="profile-tab">
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">카테고리 제목</td>
										<td class="cell">글 제목</td>
										<td class="cell">작성일</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">4</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">5</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">6</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">7</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">8</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">9</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">10</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

								</table>


							</div>
							<div class="tab-pane education-detail fade" id="education"
								role="tabpanel" aria-labelledby="contact-tab">
								<table class="table">
									<tr class="table_row header">
										<td class="cell">댓글 번호</td>
										<td class="cell">원글 제목</td>
										<td class="cell">댓글 내용</td>
										<td class="cell">작성일</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">4</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">5</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">6</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">7</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">8</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">9</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

									<tr class="table_row">
										<td class="cell">10</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>

								</table>
							</div>
							<div class="tab-pane portfolio-detail fade" id="portfolio"
								role="tabpanel" aria-labelledby="contact-tab">
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">글 제목</td>
										<td class="cell">작성자</td>
										<td class="cell">작성일</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
								</table>
							</div>
							<div class="tab-pane portfolio-detail contact-tab fade"
								id="contact" role="tabpanel" aria-labelledby="contact-tab">
								<div class="sec-title">
									<h2>내 후원</h2>
								</div>
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">후원금액</td>
										<td class="cell">후원일</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
								</table>
								<br />
								<div class="sec-title">
									<h2>내 신고</h2>
								</div>
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">신고 대상</td>
										<td class="cell">신고 내용</td>
										<td class="cell">신고일</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
								</table>
							</div>
							<div class="tab-pane portfolio-detail fade" id="trade"
								role="tabpanel" aria-labelledby="contact-tab">
								<div class="sec-title">
									<h2>내 구매</h2>
								</div>
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">구매 내역</td>
										<td class="cell">거래 상대</td>
										<td class="cell">구매일자</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
								</table>
								<br />
								<div class="sec-title">
									<h2>내 판매</h2>
								</div>
								<table class="table">
									<tr class="table_row header">
										<td class="cell">글 번호</td>
										<td class="cell">판매 내역</td>
										<td class="cell">거래 상대</td>
										<td class="cell">판매 일자</td>
									</tr>
									<tr class="table_row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									<tr class="table_row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>

<script src="js/mypage/jquery-3.2.1.min.js"></script>
<script src="js/mypage/popper.min.js"></script>
<script src="js/mypage/bootstrap.min.js"></script>
<script src="js/mypage/script.js"></script>

<!-- Java Script for header  ================================================== -->
<script src="/js/header/jquery.slicknav.min.js"></script>
<script src="/js/header/header_hyesoo.js"></script>
<!-- header 200317 새로 추가해야할 js -->
<script src="/js/header/scroll.js"></script>
<script src="https://code.jquery.com/ui/1.8.5/jquery-ui.min.js" integrity="sha256-fOse6WapxTrUSJOJICXXYwHRJOPa6C1OUQXi7C9Ddy8=" crossorigin="anonymous"></script>



</html>