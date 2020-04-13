<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="img/favicon.ico" rel="shortcut icon" />

<!-- 파피콘 -->
<link rel="icon" type="image/png"
	href="resources/images/share/wolf_logo.ico" />

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
<link rel="stylesheet" href="fonts/fonts_cassie/icomoon/style.css">
<!-- <script src="https://kit.fontawesome.com/4b0668ef4e.js" crossorigin="anonymous"></script> -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Main Stylesheets -->

<link rel="stylesheet" href="css/board_hs/writestyle.css" />

<script src = "js/board_hs/ckeditor.js" ></script>

</head>
<body id = "top">
	

	<!-- Header section -->
	
	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->
	




	<!-- 작성하는 부분 전체 -->

	<div class="write-section">
		<div class="write-container">


			<div class="write-view">

				<div class="writeName">
					<h3>글 작성하기</h3>
				</div>
				<div class = "square"></div>
				
				<div class="slider-wrap ">

						<div class="advertise-slider">

							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								



								<div class="carousel-inner " role="listbox">

									<!-- 이거 한뭉텅이씩 추가하면 광고 추가됨 -->
									<div class="carousel-item active">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/">
											<img class="d-block w-100 " src="images/board_hs/jumanji.png">
										</a>
										
									</div>

									<div id="target" class="carousel-item ">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/"><img
											class="d-block w-100" src="images/board_hs/1.jpg"></a>
										
									</div>

									<div class="carousel-item">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/"><img
											class="d-block w-100" src="images/board_hs/2.jpg"></a>
										
									</div>
									
									<div class="carousel-item">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/"><img
											class="d-block w-100" src="images/board_hs/3.jpg"></a>
										
									</div>
									
									<div class="carousel-item">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/"><img
											class="d-block w-100" src="images/board_hs/4.jpg"></a>
										
									</div>
									
									<div class="carousel-item">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/"><img
											class="d-block w-100" src="images/board_hs/5.jpg"></a>
										
									</div>
									
									<div class="carousel-item">
										<a target="_blank"
											href="https://www.zmangames.com/en/products/terra-mystica/"><img
											class="d-block w-100" src="images/board_hs/6.jpg"></a>
										
									</div>


								</div>


								
							</div>
						</div>




					</div>
			


			</div>
		</div>
	</div>

	
	
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
	<script src="js/header/scroll.js"></script>
	<script src="js/board_hs/jquery.easing.1.3.js"></script>
	<script src="js/board_hs/isotope.pkgd.min.js"></script>
	<script src="js/board_hs/bootstrap-select.min.js"></script>
	<script src="js/board_hs/category.js"></script>
	<script src="js/board_hs/toList.js"></script>
	<script src="js/footer/footer_hee.js"></script>
	
	<script>
	
		$(".carousel").carousel({
			interval:1,
			keyboard : true,
			pause : "hover"
		});
	</script>
	
	<!-- ckEditor 관련 -->
	
	<script type="text/javascript">
			var myEditor;
			ClassicEditor
				.create( document.querySelector( '#editor' ), {
					
					
					
					
					ckfinder: {
				        uploadUrl: '${pageContext.request.contextPath}/fileupload' // 내가 지정한 업로드 url (post로 요청감)
				       
					},
					
					toolbar: [ 'heading', '|',  'bold', 'italic','fontSize','fontColor', 'fontFamily', 'alignment:left', 'alignment:center', 'alignment:right','link', 'bulletedList', 'numberedList', 'blockQuote','insertTable',  'imageUpload', 'imageStyle:alignLeft', 'imageStyle:full', 'imageStyle:alignRight'],

					image : {
						styles : ['full', 'alignLeft', 'alignRight']
					},
					
					uiClor : '#FFFFFF',
					
					removePlugins: [ 'ImageCaption' ],
					
					alignment: {
			            options: [ 'left', 'center', 'right' ]
			        }
				} )
				.then( editor => {
			        console.log( 'Editor was initialized', editor );
			        myEditor = editor;
		    } )
			.catch( error => {
			    console.error( error );
			} );
		</script>
	
	
	
	

</body>
</html>