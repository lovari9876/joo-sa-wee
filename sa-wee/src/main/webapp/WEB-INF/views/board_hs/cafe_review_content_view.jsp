<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SON-IN-LAW IS DISE</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- collapse -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link rel="stylesheet" href="css/board_hj/custom-bs.css">
<link rel="stylesheet" href="css/board_hj/jquery.fancybox.min.css">
<link rel="stylesheet" href="css/board_hj/bootstrap-select.min.css">
<link rel="stylesheet" href="fonts/fonts_hj/icomoon/style.css">
<link rel="stylesheet" href="fonts/fonts_hj/line-icons/style.css">
<link rel="stylesheet" href="css/board_hj/owl.carousel.min.css">
<link rel="stylesheet" href="css/board_hj/animate.css">
<link rel="stylesheet" href="css/board_hj/animate.min.css">
<link rel="stylesheet" href="css/board_hj/quill.snow.css">
<link rel="stylesheet" href="css/board_hj/style.css">
<!-- <link rel="stylesheet" href="css/board_hj/font-awesome.min.css"> -->
<link rel="stylesheet" href="css/board_hj/magnific-popup.css">
<link rel="stylesheet" href="css/board_hj/bootstrap.min.css" />

<!-- tooltip, popover -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- collapse -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body id="top">
	<input type="hidden" name="bw_no" value="${cafe_review.cr_no}">

	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->

	<!-- HOME -->
	<section class="section-hero overlay inner-page bg-image"
		style="background-image: url('images/board_hj/lavender_dot.png');"
		id="home-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="custom-breadcrumbs mb-0">
						<!-- 게시판이름과 게시글 작성자 -->
						<div class="title">
							<div class="title_item frist">
								<h4 id="community">${cafeVO.c_title}</h4>
								<span class="slash">&bullet;</span> 
								
							</div>
							<div class="title_item second">
								<span class="slash">추천수(</span><span class="slash rec">${cafe_review.cr_recommend_num}</span><span class="slash">)</span> 
								<span class="slash">&bullet;</span>
								<span class="slash">조회수(${cafe_review.cr_hit})</span>
							</div>
						</div>
						<div>
							<span class="text-white">작성자 ${memberVO.m_nick}</span>
							<span class="slash">&bullet;</span> 
							<span class="text-white">작성일 ${cafe_review.cr_written_date}</span> 
							<span class="slash">&bullet;</span>
							<span class="text-white">수정일 ${cafe_review.cr_updated_date}</span>
						</div>
					</div>
					<br />
					<!-- 게시글 제목 -->
					<h2 class="text-white">${cafe_review.cr_title}</h2>
				</div>
			</div>
		</div>
	</section>

	<!-- 게시글 본문 -->
	<section class="site-section" id="next-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 blog-content">
					<h3 class="mb-4">Lorem ipsum dolor sit amet consectetur
						adipisicing elit</h3>
					<p class="lead">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Assumenda nihil aspernatur nemo sunt, qui, harum
						repudiandae quisquam eaque dolore itaque quod tenetur quo quos
						labore?</p>
					<p>
						<img src="images/board_hj/job_single_img_1.jpg" alt="Image"
							class="img-fluid rounded">
					</p>

					<p>${cafe_review.cr_content}</p>

					<blockquote>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Provident vero tempora aliquam excepturi labore, ad soluta
							voluptate necessitatibus. Nulla error beatae, quam, facilis
							suscipit quaerat aperiam minima eveniet quis placeat.</p>
					</blockquote>

					<p>Eveniet deleniti accusantium nulla natus nobis nam
						asperiores ipsa minima laudantium vero cumque cupiditate ipsum
						ratione dicta, expedita quae, officiis provident harum nisi! Esse
						eligendi ab molestias, quod nostrum hic saepe repudiandae non.
						Suscipit reiciendis tempora ut, saepe temporibus nemo.</p>
					<h4 class="mt-5 mb-4">Lorem ipsum dolor sit amet consectetur
						adipisicing elit</h4>
					<p>Accusamus, temporibus, ullam. Voluptate consectetur laborum
						totam sunt culpa repellat, dolore voluptas. Quaerat cum ducimus
						aut distinctio sit, facilis corporis ab vel alias, voluptas
						aliquam, expedita molestias quisquam sequi eligendi nobis ea error
						omnis consequatur iste deleniti illum, dolorum odit.</p>
					<p>In adipisci corporis at delectus! Cupiditate, voluptas, in
						architecto odit id error reprehenderit quam quibusdam excepturi
						distinctio dicta laborum deserunt qui labore dignissimos
						necessitatibus reiciendis tenetur corporis quas explicabo
						exercitationem suscipit. Nisi quo nulla, nihil harum obcaecati vel
						atque quos.</p>
					<p>Amet sint explicabo maxime accusantium qui dicta enim quia,
						nostrum id libero voluptates quae suscipit dolor quam tenetur
						dolores inventore illo laborum, corporis non ex, debitis quidem
						obcaecati! Praesentium maiores illo atque error! Earum, et, fugit.
						Sint, delectus molestiae. Totam.</p>

					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Culpa iste, repudiandae facere aperiam sapiente, officia delectus
						soluta molestiae nihil corporis animi quos ratione qui labore?
						Sint eaque perspiciatis minus illum.</p>
					<p>Consectetur porro odio quod iure quaerat cupiditate
						similique, dolor reprehenderit molestias provident, esse dolorum
						omnis architecto magni amet corrupti neque ratione sunt beatae
						perspiciatis? Iste pariatur omnis sed ut itaque.</p>
					<p>Id similique, rem ipsam accusantium iusto dolores sit velit
						ex quas ea atque, molestiae. Sint, sed. Quisquam, suscipit!
						Quisquam quibusdam maiores fugiat eligendi eius consequuntur,
						molestiae saepe commodi expedita nemo!</p>

					<!-- 추천 -->
					<br /> <br />
					<div align="center" class="tooltip-purple">
						<input class="good" type="image" src="images/board_hj/good.png"
							name="button" id="rec_btn" value="${cafe_review.cr_no}"
							data-toggle="tooltip" data-container=".tooltip-purple"
							data-placement="top" title="추천 +1">
						<p>
							<span>(</span><span class="rec">${cafe_view.cr_recommend_num}</span><span>)</span>
						</p>
					</div>

					<br />
					<br />
					<!-- 목록보기와 수정, 삭제, 신고 -->
					<form action="/list" method="get">
						<div class="test">
							<div class="test_item first">
								<input type="submit" value="목록" class="btn btn-lavender btn-md">
							</div>
							<div class="test_item second">
								<a href="#">수정</a>
							</div>
							<div class="test_item third">
								<a href="delete?cr_no=${cafe_review.cr_no}">삭제</a>
							</div>
							<div class="test_item fourth">
								<a href="report_view_bw?cr_no=${cafe_review.cr_no}"
									onClick="window.open(this.href, '', 'width=500, height=600, left=400, top=100, resizable=no, scrollbars=no'); return false;">신고</a>
							</div>
						</div>
					</form>

					<!-- 댓글부분 -->
					<%@ include file="/WEB-INF/views/content/comment_view.jsp" %>
				</div>
			</div>
		</div>
	</section>

	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->

	<!-- SCRIPTS -->
	<script src="js/board_hj/jquery.min.js"></script>
	<script src="js/board_hj/jquery-3.2.1.min.js"></script>
	<script src="js/board_hj/jquery.fancybox.min.js"></script>
	<script src="js/board_hj/jquery.easing.1.3.js"></script>

	<script src="js/board_hj/jquery.waypoints.min.js"></script>
	<script src="js/board_hj/jquery.animateNumber.min.js"></script>

	<!-- <script src="js/board_hj/jquery.slicknav.min.js"></script> -->

	<script src="js/board_hj/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hj/jquery.sticky-sidebar.min.js"></script>

	<script src="js/board_hj/bootstrap.min.js"></script>

	<script src="js/board_hj/bootstrap.bundle.min.js"></script>
	<script src="js/board_hj/isotope.pkgd.min.js"></script>
	<script src="js/board_hj/stickyfill.min.js"></script>

	<script src="js/board_hj/owl.carousel.min.js"></script>
	<script src="js/board_hj/quill.min.js"></script>

	<script src="js/board_hj/bootstrap-select.min.js"></script>

	<script src="js/board_hj/custom.js"></script>

	<script src="js/board_hj/main.js"></script>

	<script src="js/board_hj/tooltip.js"></script>
	<script src="js/board_hj/recommed.js"></script>
	<script src="js/board_hj/popover.js"></script>

	<!-- Java Script for header
    ================================================== -->
	<script src="js/header/jquery.slicknav.min.js"></script>
	<script src="js/header/header_hyesoo.js"></script>
	<script src="js/header/scroll.js"></script>

	<!-- Java Script for footer
    ================================================== -->
	<script src="js/footer/footer_hee.js"></script>
	

</body>
</html>