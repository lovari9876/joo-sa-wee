<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Poppins:300,500,600"
	rel="stylesheet">
	


<!-- tooltip, popover -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	

<!-- Stylesheets -->
<link rel="stylesheet" href="css/board_hs/bootstrap.min.css" />
<link rel="stylesheet" href="css/board_hs/font-awesome.min.css" />
<link rel="stylesheet" href="css/board_hs/slicknav.min.css" />
<link rel="stylesheet" href="css/board_hs/owl.carousel.min.css" />
<link rel="stylesheet" href="css/board_hs/magnific-popup.css" />
<link rel="stylesheet" href="css/board_hs/animate.css" />
<link rel="stylesheet" href="css/board_hs/linearicons.css" />
<link rel="stylesheet"
	href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://kit.fontawesome.com/4b0668ef4e.js" crossorigin="anonymous"></script> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Main Stylesheets -->


<link rel = "stylesheet" href = "css/board_hs/doro.css"/>
<link rel="stylesheet" href="css/board_hs/cafe_content_view_style.css" />



</head>
<body id = "top">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- Header section -->
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->

	<!-- 도로록  -->
	<div class="sidenav">
		<ul class="mymenu">
			<li><a class="icon fas fa-store" id="uno" href="#firstblank"></a>
				<div class="hide">카페 정보</div></li>
			<li><a class="icon fas fa-pencil-alt" id="dos"
				href="#blank1"></a>
				<div class="hide">한줄평</div></li>
			<li><a class="icon fas fa-book-open" id="tres" href="#blank2"></a>
				<div class="hide">카페 리뷰</div>
		</ul>
	</div>



	<!-- 밑에 전체 -->

	<section class="view-section" id = "firstblank">
		<div class="view-wrap">
			<div class="view-container" >
				<div class = "cafe">
				<!-- 카페 이름 -->
				<div class="cafe-name" id = "cafe-name">
					<h4>레드버튼 신촌점</h4>
				</div>

				<!-- 카페 사진 -->
				<div class="cafe-photo" id="cafe-photo">



					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>


						<div class="carousel-inner" role="listbox">
							<div class="carousel-item active">
								<img src="images/board_hs/cafe1.png">
							</div>

							<div id="target" class="carousel-item">
								<img src="images/board_hs/cafe2.png">
							</div>

							<div class="carousel-item">
								<img src="images/board_hs/cafe4.png">
							</div>
						</div>


						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>

				</div>


				<!-- 카페 정보 -->

				<div class="cafe-info" id="cafe-info">
					<div class = "info-wrap">
						<div class="info">
							<i class="fas fa-map-marker-alt"></i> 주소 : 서울시 서울시 서울시 <br /> <i
								class="fas fa-phone"></i> 전화번호 : 02-1234-5678 <br /> <i
								class="fas fa-users"></i> 수용인원 : 3명 <br /> <i
								class="fas fa-couch"></i> 테이블 개수 : 2개 의자 개수 : 1개 <br /> <i
								class="far fa-clock"></i> 오픈 시간 : 07 : 00 <br /> <i
								class="fas fa-clock"></i> 마감 시간 : 08 : 00 <br /> <i
								class="fas fa-door-closed"></i> 카페 휴일 : 월, 수, 목, 금 <br />
						</div>
					</div>
				</div>
				
				</div>


				<!-- 빈공간 -->
				<div id = "blank1"></div>



				<!-- 한줄평 부분 전체 -->
				<div class="oneline" id="oneline">

					<!-- 한줄평 부분 전체 -->
					<div class="pt-5">



						<!-- 댓글 작성 -->
						<div class="comment-form-wrap ">
							<h3 class="mb-5">한줄평 부분입니다.</h3>
							<form action="#" method="get">
								<!-- 댓글 작성자 이름은 넣어야 함!! -->
								<!-- <div class="form-group">
									<label for="name">Name *</label> <input type="text"
										class="form-control" id="name">
								</div>
								<div class="form-group">
									<label for="email">Email *</label> <input type="email"
										class="form-control" id="email">
								</div>
								<div class="form-group">
									<label for="website">Website</label> <input type="url"
										class="form-control" id="website">
								</div> -->

								<div class="form-group">
									<label for="message">Comment</label> 
									<input type="text" id="message" class="form-control" name="" placeholder="내용을 입력하세요">
									<!-- <textarea name="" id="message" cols="30" rows="10"
										class="form-control"></textarea> -->
								</div>
								<div class="form-group">
									<input type="submit" value="작성" class="btn btn-lavender btn-md">
								</div>
							</form>
						</div>




						<!-- 한줄평 리스트 -->
						
						<!-- 최신순, 인기순으로 보기 -->
						<form class = "category" action="">
							<label for="drop_list"><h3 class="mb-5"> 6 한줄평</h3></label> 
							<select id="drop_list" name="drop_list">
								<option value="new">최신순</option>
								<option value="best">인기순</option>
							</select>
						</form>
						
						<!-- 한줄평 리스트 -->
						<ul class="comment-list">


							<!-- 한줄평 하나하나 -->
							<li class="comment">
								
								<!-- 프로필 사진 -->
								<div class="vcard bio">
									<!-- <img src="images/person_2.jpg" alt="Image placeholder"> -->
								</div>
								
								<!-- 댓글부분 -->
								<div class="comment-body">
									<form>
										
										<!-- 회원 이름 눌렀을때 뜨는거 -->
										<div class="comment_test">
											<div class="test_item name" id="pop">
												<span role="button" class="pop_btn popovers"
													data-toggle="popover"
													data-content="<a href='#'>회원정보보기</a><br/><a href='#'>쪽지보내기</a><br/><a href='report'>신고하기</a>">
													<h3> Jacob Smith</h3>
												</span>
											</div>
											
											<!-- 추천 버튼 -->
											<div class="test_item rec tooltip-purple">
												<a class="far fa-thumbs-up fa-2x no-text-deco" href="#" 
												data-toggle="tooltip" 
												data-container=".tooltip-purple"
												data-placement="top" 
												title="추천"></a>
												
												<a class="text_items">(숫자)</a>
											</div>
											
										</div>
										
										
										
										<!-- 작성일자 -->
										<div class="meta">January 9, 2018 at 2:21pm</div>
										
										
										
										<!-- 댓글 내용 -->
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit. Pariatur quidem laborum necessitatibus, ipsam impedit
											vitae autem, eum officia, fugiat saepe enim sapiente iste
											iure! Quam voluptas earum impedit necessitatibus, nihil?
											
										</p>
											
											
											
										<!-- 수정, 삭제, 신고 버튼부분 -->
										<div class="reply_test">
 
											<div class="test_item modi tooltip-purple">
												<a class="fas fa-edit fa-lg no-text-deco" href="#"
													data-toggle="tooltip" data-container=".tooltip-purple"
													data-placement="top" title="수정"></a>
											</div>
											<div class="test_item del tooltip-purple">
												<a class="fas fa-trash-alt fa-lg no-text-deco" href="#"
													data-toggle="tooltip" data-container=".tooltip-purple"
													data-placement="top" title="삭제"></a>
											</div>
											<div class="test_item rep tooltip-purple">
												<a class="fas fa-skull fa-lg no-text-deco" href="report"
													onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;"
													data-toggle="tooltip" data-container=".tooltip-purple"
													data-placement="top" title="신고"> </a>
											</div>
										</div>

									</form>
								</div>
							</li>

							<!-- 한줄평 하나하나  -->
							<li class="comment">
								<div class="vcard bio"></div>
								<div class="comment-body">
									<h3>Chris Meyer</h3>
									<div class="meta">January 9, 2018 at 2:21pm</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Pariatur quidem laborum necessitatibus, ipsam impedit
										vitae autem, eum officia, fugiat saepe enim sapiente iste
										iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
									
								</div>

							</li>



							<!-- 한줄평 하나하나  -->
							<li class="comment">
								<div class="vcard bio">
									<!-- <img src="images/person_1.jpg" alt="Image placeholder"> -->
								</div>
								<div class="comment-body">
									<h3>Jean Doe</h3>
									<div class="meta">January 9, 2018 at 2:21pm</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Pariatur quidem laborum necessitatibus, ipsam impedit
										vitae autem, eum officia, fugiat saepe enim sapiente iste
										iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
								</div>
							</li>
						</ul>
						<!-- END comment-list -->

						<!-- 댓글 쓰기 -->

					</div>


				</div>




				<!-- 빈공간 -->
				<div id = "blank2"></div>



				<!-- 카페 리뷰 부분 -->
				<div class="cafe-review" id="cafe-review">
					<div class = "review-wrap">
						
						
						<form class = "category" action="">
							<label for="drop_list"><h3 class="mb-5"> 리뷰부분입니다.</h3></label> 
							<select id="drop_list" name="drop_list">
								<option value="new">최신순</option>
								<option value="best">인기순</option>
							</select>
						</form>
						
						<form action="">

							<div class="search">

								<select>
									<option value="0" selected>제목</option>
									<option value="1">내용</option>
									<option value="2">닉네임</option>
								</select> <input id="searchBar" type="text">
		
								<!-- 여기 미쳐버렸음. 일단 버튼으로 만들어 놓고 다음에 해야함 타입이 submit 인줄도 모르겠음-->
								<button type="submit" class="fa fa-fw fa-search"></button>
	
							</div>
						</form>
						
						
						<div class = "review-table">
							<table class="table">
									<tr class="row header">
										<td class="cell">글 번호</td>
										<td class="cell">글 제목</td>
										<td class="cell">작성자</td>
										<td class="cell">작성일</td>
									</tr>
	
									<tr class="row">
										<td class="cell">1</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
									<tr class="row">
										<td class="cell">2</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
									<tr class="row">
										<td class="cell">3</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
									<tr class="row">
										<td class="cell">4</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
									<tr class="row">
										<td class="cell">5</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
									<tr class="row">
										<td class="cell">6</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
									<tr class="row">
										<td class="cell">7</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
									<tr class="row">
										<td class="cell">8</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
									<tr class="row">
										<td class="cell">9</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
									<tr class="row">
										<td class="cell">10</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									
									<tr class="row">
										<td class="cell">11</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									
									<tr class="row">
										<td class="cell">12</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									
									<tr class="row">
										<td class="cell">13</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									
									<tr class="row">
										<td class="cell">14</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
									
									<tr class="row">
										<td class="cell">15</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
										<td class="cell">Vincent Williamson</td>
									</tr>
	
								</table>	
							</div>
									<button class="write-btn" type="button" onclick="location.href='cafe_review_write'">글쓰기</button>
						</div>
									
				</div>

			</div>
		</div>
		
		
		
	<!-- footer 부분 -->
	
	</section>
	
	<!-- footer 부분 -->
	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->
	
	




	<!--====== Javascripts & Jquery ======-->
	<script src="js/board_hs/jquery-3.2.1.min.js"></script>
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hs/jquery.slicknav.min.js"></script>
	<script src="js/board_hs/owl.carousel.min.js"></script>
	<script src="js/board_hs/jquery.sticky-sidebar.min.js"></script>
	<script src="js/board_hs/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hs/main.js"></script>
	<script src="js/board_hs/doro.js"></script>
	<script src="js/js_header/scroll.js"></script>
	<script src="js/board_hs/cafe-photo.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/js_footer/footer_hee.js"></script>
	
	<!-- script 부분 -->
	<!-- tooltip 부분 -->
	<script>
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

	<!-- popover 부분 -->
	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover({
				html : true
			});
		});
	</script>

</body>
</html>