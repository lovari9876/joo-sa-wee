<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SON-IN-RAW IS DICE - my page</title>

<!-- 파피콘 -->
<link rel="icon" type="image/png" href="/images/share/wolf_logo.ico" />

<link rel="stylesheet" href="resources/css/mypage/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/fontawsom-all.min.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/mypage/style.css" />
<link rel="stylesheet" type="text/css"
	href="resources/css/mypage/liststyle.css" />


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
									<img src="resources/images/bl_share/icons/wolf_logo.png" alt="">
								</div>
								<div class="pd">
									<h5>내 이미지</h5>
									<br />
									<p>
										<input type="file" name="file" id="fileCheck" />
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 eml-mob">
							<div class="pd">
								<br />
								<p>
									<label>닉네임</label> <input placeholder="Nickname..."
										class="w3-input" type="text" id="m_nick" name="m_nick"
										value="${ member.id }">
								</p>
							</div>
						</div>
						<div class="col-md-4 eml-mob">
							<div class="pd">
								<br />
								<p>
									<label>비밀번호</label> <input placeholder="Nickname..."
										class="w3-input" type="text" id="m_nick" name="m_nick"
										value="${ member.id }">
								</p>
								<p>
									<label>비밀번호 확인</label> <input placeholder="Nickname..."
										class="w3-input" type="text" id="m_nick" name="m_nick"
										value="${ member.id }">
								</p>
							</div>
						</div>
					</div>
					<div class="nav-detail">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="home-tab" data-toggle="tab" href="#home" role="tab"
								aria-controls="home" aria-selected="true">내 정보 수정</a></li>
						</ul>


						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="home" role="tabpanel"
								aria-labelledby="home-tab">
								<div class="row no-margin home-det">
									<div class="col-md-4 eml-mob">
										<br /> <br />
										<p>
											<label>아이디</label> <input placeholder="Nickname..."
												class="w3-input" type="text" id="m_nick" name="m_nick"
												readonly value="${ member.id }">
										</p>
										<br />
										<p>
											<label>이메일</label> <input placeholder="Nickname..."
												class="w3-input" type="text" id="m_nick" name="m_nick"
												value="${ member.id }">
										</p>
										<br />
										<p>
											<label>핸드폰</label> <input placeholder="Nickname..."
												class="w3-input" type="text" id="m_nick" name="m_nick"
												value="${ member.id }">
										</p>
										<br /> <br /> <br />

										<p>
											<label>우편번호</label> <input placeholder="Nickname..."
												class="w3-input" type="text" id="m_nick" name="m_nick"
												value="${ member.id }">
										</p>
										<br />
										<p>
											<label>주소</label> <input placeholder="Nickname..."
												class="w3-input" type="text" id="m_nick" name="m_nick"
												value="${ member.id }">
										</p>
										<br />
										<p>
											<label>상세주소</label> <input placeholder="Nickname..."
												class="w3-input" type="text" id="m_nick" name="m_nick"
												value="${ member.id }">
										</p>
										<br />




									</div>
									<div class="col-md-8 home-dat">
										<div class="detal-jumbo">
											<h3>자기소개</h3>
											<p>
												<input placeholder="Nickname..." class="w3-input"
													type="text" id="m_nick" name="m_nick"
													value="${ member.id }">
											</p>
											<br /> <br /> <br /> <br /> <br />
										</div>

										<div class="jumbo-address">
											<div class="row no-margin">
												<div class="col-lg-6 no-padding">

													<table class="addrss-list">
														<tbody>
															<tr>
																<th>SMS수신여부</th>

																<td><div id="radio">
																		<input type="radio" name="m_re_sms" value="y">
																		Yes <input type="radio" name="m_re_sms" value="n">
																		No
																	</div></td>
															</tr>
															<tr>
																<th>메일수신여부</th>
																<td><div id="radio">
																		<input type="radio" name="m_re_notice" value="y">
																		Yes <input type="radio" name="m_re_notice" value="n">
																		No
																	</div></td>
															</tr>
														</tbody>
													</table>

												</div>
												<div class="col-lg-6 no-padding">
													<table class="addrss-list">
														<tbody>
															<tr>
																<th>쪽지수신여부</th>
																<td><div id="radio">
																		<input type="radio" name="m_re_message" value="y">
																		Yes <input type="radio" name="m_re_message" value="n">
																		No
																	</div></td>
															</tr>
															<tr>
																<th>회원정보공개여부</th>
																<td><div id="radio">
																		<input type="radio" name="m_info" value="y">
																		Yes <input type="radio" name="m_info" value="n">
																		No
																	</div></td>
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
														<li><a href="mypage"><i
																class="fas fa-address-card"></i> 마이페이지</a></li>

														<li><a href="modify_mypage"><i
																class="fas fa-circle-notch"></i> 처음으로</a></li>
													</ul>
													<ul class="btn-link">
														<li><a href="#"><i class="fas fa-times"></i> 탈퇴</a></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<script src="resources/js/mypage/jquery-3.2.1.min.js"></script>
<script src="resources/js/mypage/file.js"></script>
<script src="resources/js/mypage/popper.min.js"></script>
<script src="resources/js/mypage/bootstrap.min.js"></script>
<script src="resources/js/mypage/script.js"></script>

<!-- Java Script for header  ================================================== -->
<script src="/js/header/jquery.slicknav.min.js"></script>
<script src="/js/header/header_hyesoo.js"></script>
<!-- header 200317 새로 추가해야할 js -->
<script src="/js/header/scroll.js"></script>

<script src="https://code.jquery.com/ui/1.8.5/jquery-ui.min.js" integrity="sha256-fOse6WapxTrUSJOJICXXYwHRJOPa6C1OUQXi7C9Ddy8=" crossorigin="anonymous"></script>

</html>