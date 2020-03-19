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
<link rel="stylesheet" href="css/board_hs/style.css" />
<link rel="stylesheet" href="css/board_hs/map-style.css" />
<link rel="stylesheet" href="css/board_hs/footer-style.css"/>

</head>
<body id="top">
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- Header section -->
	<header class="header-section">
		<div class="header-warp">
			<div class="header-bar-warp d-flex">

				<!-- site logo -->
				<!-- <a href="home.html" class="site-logo">
					<img src="./img/3535.png" width = "200px" height = "40px" alt="">
				</a> -->
				<br />
				<nav class="top-nav-area w-100">


					<!-- Menu -->
					<ul class="main-menu primary-menu">
						<li><a class="home" href="home">HOME</a></li>
						<li><a class="gameinfo" href="">보드게임 정보</a>
							<ul class="sub-menu">
								<li><a href="">당신의 보드게임</a></li>
								<li><a href="">보드게임 리스트</a></li>
							</ul></li>
						<li><a class="comm" href="list_home">커뮤니티</a>
							<ul class="sub-menu">
								<li><a href="list">보드이야기</a></li>
								<li><a href="list">개봉기 및 리뷰</a></li>
								<li><a href="list">보드게임 모임</a></li>
								<li><a href="list">보드 뉴스</a></li>
								<li><a href="list">질문 & 답변</a></li>
								<li><a href="list">창작 보드게임</a></li>
							</ul></li>
						<li><a href="cafe_map">보드게임카페</a></li>
						<li><a href="blog">보부상</a></li>
						<li><a class="help" href="contact">헬프데스크</a>
							<ul class="sub-menu">
								<li><a href="">자주하는 질문</a></li>
								<li><a href="question_list">1 : 1 문의 </a></li>
								<li><a href="">무인도 </a></li>
							</ul></li>
						<!-- 검색창  -->
						<li><div class="mysearch relative">
								<span class="lnr lnr-magnifier"></span>
								<form action="#" class="mysearch-field">
									<input type="text" placeholder="Search here"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Search here'">
									<button class="mysearch-submit">
										<span class="lnr lnr-magnifier"></span>
									</button>
								</form>
							</div></li>

						<li><a class="fas fa-user" href="#"></a>
							<ul class="sub-menu">
								<li><a href="gameSingle">로그인</a></li>
								<li><a href="gameSingle">회원가입</a></li>

							</ul></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>


	<!-- 지도 부분  -->

	<div class="cafe-map ">
		<div class="cafe-wrap">


			<div class="map_wrap">

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								<input type="text" value="신촌 보드게임" id="keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>

				<div id="map" class = "col-12"
					style="width: 1000px; height: 700px; position: relative; overflow: hidden;"></div>

			</div>
		</div>
	</div>
	
	
	
	<!-- footer 부분 -->
	<footer class="site-footer">

		<a href="#top" class="smoothscroll scroll-top"> <span
			class="fas fa-angle-up"></span>
		</a>

		<div class="container">
			<div class="row mb-5">
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href="#"><h3>Home</h3></a>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href=""><h3>보드게임 정보</h3></a>
					<ul class="list-unstyled">
						<li><a href="#">당신의 보드게임</a></li>
						<li><a href="#">보드게임 리스트</a></li>
					</ul>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href=""><h3>커뮤니티</h3></a>
					<ul class="list-unstyled">
						<li><a href="#">보드 이야기</a></li>
						<li><a href="#">개봉기 및 리뷰</a></li>
						<li><a href="#">보드게임 모임</a></li>
						<li><a href="#">보드 뉴스</a></li>
						<li><a href="#">질문 & 답변</a></li>
						<li><a href="#">창작 보드게임</a></li>
					</ul>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href="#"><h3>보드게임 카페</h3></a>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href="#"><h3>보부상</h3></a>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<a href=""><h3>헬프데스크</h3></a>
					<ul class="list-unstyled">
						<li><a href="#">자주하는 질문</a></li>
						<li><a href="#">1:1 문의</a></li>
						<li><a href="#">무인도</a></li>
					</ul>
				</div>
				<div class="col-6 col-md-3 mb-4 mb-md-0">
					<h3>Contact Us</h3>
					<div class="footer-social">
						<a href="#"><span class="fab fa-facebook-f"></span></a> <a href="#"><span
							class="fab fa-twitter"></span></a> <a href="#"><span
							class="fab fa-instagram"></span></a> <a href="#"><span
							class="fab fa-linkedin-in"></span></a>
					</div>
				</div>
			</div>

			<div class="row text-center">
				<div class="col-12">
					<p class="copyright">
						<small> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>
								document.write(new Date().getFullYear());
							</script> All rights reserved | This template is made with <i
							class="icon-heart text-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a> <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></small><br />
						아이콘 제작자 <a href="https://www.flaticon.com/kr/authors/freepik"
							title="Freepik">Freepik</a> from <a
							href="https://www.flaticon.com/kr/" title="Flaticon">
							www.flaticon.com</a>
					</p>
				</div>
			</div>
		</div>
	</footer>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

		
		
	<!-- map 받아오는 부분 -->	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a13bc800cf0b5a093622d3e66d1a43e2&libraries=services,clusterer,drawing"></script>

	<script>
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, 
			markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,imgOptions), 
			marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
				
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다
			
			kakao.maps.event.addListener(marker, 'click', function(){
				//일단 이렇게는 해놓는데, 
				//var url = 'https://map.kakao.com/link/map/'+position.getLat()+','+position.getLng(); 이런식으로 처리하라함
				var url = '/cafe_content_view';
				window.open(url, '_self');
			})

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div class = "infowindow"style="padding:5px;text-align:center;;z-index:1;border-radius:3px;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다 
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>





	<!--====== Javascripts & Jquery ======-->
	<script src="js/board_hs/jquery-3.2.1.min.js"></script>
	<script src="js/board_hs/jquery.slicknav.min.js"></script>
	<script src="js/board_hs/bootstrap.min.js"></script>
	<script src="js/board_hs/jquery.sticky-sidebar.min.js"></script>
	<script src="js/board_hs/jquery.magnific-popup.min.js"></script>
	<script src="js/board_hs/owl.carousel.min.js"></script>
	
	<script src="js/board_hs/main.js"></script>
	<script src="js/board_hs/doro.js"></script>
	
	<script src="js/board_hs/tab.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/board_hs/custom.js"></script>



</body>
</html>