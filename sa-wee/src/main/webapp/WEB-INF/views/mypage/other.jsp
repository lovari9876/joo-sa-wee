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

<link rel="stylesheet" href="/css/mypage/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="/css/mypage/style.css" />

<link rel="stylesheet" type="text/css" href="/css/mypage/liststyle.css" />
</head>

<body>
	<c:if test="${member.m_info == 'y'}">
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
										<h2>${member.m_nick}</h2>
										<p>
											${member.getR_name(member.r_no)}
											<%-- <c:if test="${member.r_no == 1}">
                                        	보드대마왕
                                        </c:if>
										<c:if test="${member.r_no == 2}">
                                      		보드마스터
                                        </c:if>
										<c:if test="${member.r_no == 3}">
                                        	보드게이머
                                        </c:if>
										<c:if test="${member.r_no == 4}">
                                       		표류자
                                        </c:if> --%>
										</p>
									</div>
								</div>
							</div>
							<div class="col-md-4 eml-mob">
								<ul>
									<li>작성글 수 : ${myWriteCount}</li>
									<li>댓글 수 : ${myReplyCount}</li>
								</ul>
							</div>
							<div class="col-md-4 eml-mob">
								<ul>
									<li>포인트 : ${member.m_point}</li>
								</ul>
							</div>
						</div>
						<div class="nav-detail">
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="home-tab" data-toggle="tab" href="#home" role="tab"
									aria-controls="home" aria-selected="true">회원 정보</a></li>
								<li class="nav-item"><a class="nav-link" id="profile-tab"
									data-toggle="tab" href="#profile" role="tab"
									aria-controls="profile"
									<c:out value="${cate == 'board' ? 'aria-selected=\"true\"' : 'aria-selected=\"false\"'}"/>>회원
										글</a></li>
								<li class="nav-item"><a class="nav-link" id="education-tab"
									data-toggle="tab" href="#education" role="tab"
									aria-controls="contact" aria-selected="false">회원 댓글</a></li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div class="row no-margin home-det">
										<div class="col-md-4 eml-mob">
											<ul>
												<li>아이디 : ${member.m_id}</li>
												<br />
												<li>이메일 : ${member.m_email}</li>
												<br />
												<li>가입일 : <fmt:formatDate value="${member.m_indate}"
														pattern="yyyy.MM.dd" />
												</li>
												<br />
												<li>신고당한 수 : ${member.m_report_num}</li>
												<br />
											</ul>
										</div>
										<div class="col-md-8 home-dat">
											<div class="detal-jumbo">
												<h3>자기소개</h3>
												<p>${member.m_self}</p>
												<br /> <br /> <br /> <br /> <br />
											</div>

											<div class="jumbo-address">
												<div class="row no-margin">
													<div class="col-lg-6 no-padding">

														<table class="addrss-list">
															<tbody>
																<tr>
																	<th>sms수신여부</th>
																	<td>${member.m_re_sms}</td>
																</tr>
																<tr>
																	<th>메일수신여부</th>
																	<td>${member.m_re_notice}</td>
																</tr>
															</tbody>
														</table>

													</div>
													<div class="col-lg-6 no-padding">
														<table class="addrss-list">
															<tbody>
																<tr>
																	<th>쪽지수신여부</th>
																	<td>${member.m_re_message}</td>
																</tr>
																<tr>
																	<th>회원정보공개여부</th>
																	<td>${member.m_info}</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="tab-pane fade profile-tab " id="profile"
									role="tabpanel" aria-labelledby="profile-tab">
									<table class="table">
										<tr class="table_row header">
											<td class="cell">글 번호</td>
											<td class="cell">카테고리 제목</td>
											<td class="cell">글 제목</td>
											<td class="cell">작성일</td>
										</tr>
										<c:forEach items="${myBoardList}" var="board">
											<tr class="trow">
												<td class="cell">${board['RNUM']}</td>
												<td><c:choose>
														<c:when test="${board['BT_NO'] eq 1}">보드이야기</c:when>
														<c:when test="${board['BT_NO'] eq 2}">개봉기 및 리뷰</c:when>
														<c:when test="${board['BT_NO'] eq 3}">보드게임 모임</c:when>
														<c:when test="${board['BT_NO'] eq 4}">보드 뉴스</c:when>
														<c:when test="${board['BT_NO'] eq 5}">질문&답변</c:when>
														<c:when test="${board['BT_NO'] eq 6}">창작 보드게임</c:when>
														<c:when test="${board['BT_NO'] eq 8}">일대일 문의</c:when>
														<c:when test="${board['BT_NO'] eq 9}">보부상</c:when>
														<c:when test="${board['BT_NO'] eq 11}">카페 리뷰</c:when>
														<c:otherwise>불명확</c:otherwise>
													</c:choose></td>
												<td class="cell title"><a
													href="/content_view_i?i_no=${board['I_NO']}&bt_no=${board['BT_NO']}">${board['I_TITLE']}</a></td>

												<td>
													<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 --> <jsp:useBean
														id="today" class="java.util.Date" /> <!-- Date() 생성자가 가장 가까운 millisecond의 date 객체 하나를 생성 -->
													<fmt:formatDate value="${today}" pattern="yyyy.MM.dd"
														var="now" /> <fmt:formatDate
														value="${board['I_WRITTEN_DATE']}" pattern="yyyy.MM.dd"
														var="date" /> <c:choose>
														<c:when test="${now ne date}">${date}</c:when>
														<c:otherwise>
															<fmt:formatDate value="${board['I_WRITTEN_DATE']}"
																pattern="HH:mm" />
														</c:otherwise>
													</c:choose>
												</td>

											</tr>
										</c:forEach>


									</table>

								</div>

								<!-- 내가쓴글 끝, 댓글 시작 -->


								<div class="tab-pane education-detail fade" id="education"
									role="tabpanel" aria-labelledby="contact-tab">
									<table class="table">
										<tr class="table_row header">
											<td class="cell">댓글 번호</td>
											<td class="cell">댓글 내용</td>
											<td class="cell">작성일</td>
										</tr>
										<c:forEach items="${myCommentList}" var="cm">
											<tr class="trow">
												<td class="cell">${cm['RNUM']}</td>
												<td class="cell title"><c:choose>
														<c:when test="${cm['CM_TYPE'] == '게시판'}">
															<a href="/content_view?bw_no=${cm['CM_NO2']}">${cm['CM_CONTENT']}</a>
														</c:when>
														<c:when test="${cm['CM_TYPE'] == '카페리뷰'}">
															<a href="/content_view_cr?cr_no=${cm['CM_NO2']}">${cm['CM_CONTENT']}</a>
														</c:when>
														<c:when test="${cm['CM_TYPE'] == '증고거래'}">
															<a href="/content_view_t?t_no=${cm['CM_NO2']}">${cm['CM_CONTENT']}</a>
														</c:when>
													</c:choose></td>
												<td>
													<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 --> <fmt:formatDate
														value="${today}" pattern="yyyy.MM.dd" var="now" /> <fmt:formatDate
														value="${cm['CM_WRITTEN_DATE']}" pattern="yyyy.MM.dd"
														var="date" /> <c:choose>
														<c:when test="${now ne date}">${date}</c:when>
														<c:otherwise>
															<fmt:formatDate value="${cm['CM_WRITTEN_DATE']}"
																pattern="HH:mm" />
														</c:otherwise>
													</c:choose>
												</td>

											</tr>
										</c:forEach>
									</table>
								</div>
								<div class="tab-pane portfolio-detail fade" id="portfolio"
									role="tabpanel" aria-labelledby="contact-tab">
									<table class="table">
										<tr class="table_row header">
											<td class="cell">카테고리</td>
											<td class="cell">글제목</td>
											<td class="cell">작성일</td>
											<td class="cell">삭제</td>
										</tr>
										<c:forEach items="${myScrap}" var="myScrap">
											<tr class="trow">
												<td class="cell">${myScrap['SC_BOARDTYPE']}</td>
												<td class="cell title"><c:choose>
														<c:when test="${myScrap['SC_BOARDTYPE'] eq '카페 리뷰'}">
															<a href="content_view_cr?cr_no=${myScrap['SC_NO']}">${myScrap['BW_TITLE']}</a>
														</c:when>
														<c:otherwise>
															<a href="content_view?bw_no=${myScrap['SC_NO']}">${myScrap['BW_TITLE']}</a>
														</c:otherwise>
													</c:choose></td>
												<td>
													<!-- 작성일이 오늘이면 시간, 아니면 날짜 출력 jstl로 구현 --> <fmt:formatDate
														value="${today}" pattern="yyyy.MM.dd" var="now" /> <fmt:formatDate
														value="${myScrap['SC_DATE']}" pattern="yyyy.MM.dd"
														var="date" /> <c:choose>
														<c:when test="${now ne date}">${date}</c:when>
														<c:otherwise>
															<fmt:formatDate value="${myScrap['SC_DATE']}"
																pattern="HH:mm" />
														</c:otherwise>
													</c:choose>
												</td>
												<td class="cell"><button class="scrap_delete"
														data-bt="${myScrap['SC_BOARDTYPE']}"
														data-no="${myScrap['SC_NO']}">삭제</button></td>
											</tr>
										</c:forEach>
									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${member.m_info == 'n'}">
		<script type="text/javascript">
		alert("정보 공개 설정을 하지 않은 회원입니다.");
		window.close();
		</script>
			
	</c:if>

</body>

<script src="js/mypage/jquery-3.2.1.min.js"></script>
<script src="js/mypage/popper.min.js"></script>
<script src="js/mypage/bootstrap.min.js"></script>
<script src="js/mypage/script.js"></script>

</html>