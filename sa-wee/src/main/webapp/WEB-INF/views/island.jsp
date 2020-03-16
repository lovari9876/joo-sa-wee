<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html class="no-js" lang="UTF-8">
<head>

    <!--- basic page needs
    ================================================== -->
    <meta charset="utf-8">
    <title>secondhand_trade_list</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="css/css_secondhand/base.css">
    <link rel="stylesheet" href="css/css_secondhand/vendor.css">
    <link rel="stylesheet" href="css/css_secondhand/main.css">
    
	<style type="text/css" media="screen"> /* 이 페이지에만 해당쓰~~ */
    	body{
    		
    		
    	}  
    </style> 
    
    <!-- 혜수꺼 css
    ================================================== -->
    <link rel="stylesheet" href="css_header/header_hyesoo.css">
    <link rel="stylesheet" href="css_header/slicknav.min.css" /> 
    <link rel="stylesheet" href="css_header/font-awesome.min.css" />
    <link rel="stylesheet"
		href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

	<!-- 희정 footer css
    ================================================== -->
	<link rel="stylesheet" href="css_footer/footer_hee.css">
	<link rel="stylesheet" href="fonts/fonts_cassie/icomoon/style.css"> <!-- scroll 화살표 -->

    <!-- script
    ================================================== -->
    <script src="js/js_cassie/modernizr.js"></script>
    <!-- <script src="js/pace.min.js"></script> --><!-- 프리로더와 더불어 나아가는 흰 줄 -->

    <!-- favicons
    ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">

</head>

<body id="top" class="island">

	<!-- 상단바 전체 -->
	<!-- Header section -->
	<header class="header-section">
		<div class="header-warp">
			<div class="header-bar-warp d-flex ">

				<!-- site logo -->
				<!-- <a href="home.html" class="site-logo">
					<img src="./img/3535.png" width = "200px" height = "40px" alt="">
				</a> -->
				<nav class="top-nav-area w-100 row">

					<!-- 상단바 메뉴 -->
					<ul class="main-menu head--ul primary-menu">
						<li><a href="home">Home</a></li>
						<li><a class="gameinfo" href="">보드게임 정보</a>
							<ul class="sub-menu">
								<li><a href="">당신의 보드게임</a></li>
								<li><a href="">보드게임 리스트</a></li>
							</ul></li>
						<li><a class="comm" href="games">커뮤니티</a>
							<ul class="sub-menu">
								<li><a href="list">보드이야기</a></li>
								<li><a href="list">개봉기 및 리뷰</a></li>
								<li><a href="list">보드게임 모임</a></li>
								<li><a href="list">보드 뉴스</a></li>
								<li><a href="list">질문 & 답변</a></li>
								<li><a href="list">창작 보드게임</a></li>
							</ul></li>
						<li><a href="review">보드게임카페</a></li>
						<li><a href="blog">보부상</a></li>
						<li><a class="help" href="contact">헬프데스크</a>
							<ul class="sub-menu">
								<li><a href="">자주하는 질문</a></li>
								<li><a href="">1 : 1 문의 </a></li>
								<li><a href="">무인도 </a></li>
							</ul></li>
						<!-- 검색창  -->
						<li><div class="mysearch relative">
								<span class="lnr lnr-magnifier"></span>
								<form action="#" class="mysearch-field">
									<input type="text" placeholder="검색어를 입력하세요"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '검색어를 입력하세요'">
									<button class="mysearch-submit">
										<span class="lnr lnr-magnifier"></span>
									</button>
								</form>
							</div></li>

						<!-- 사람모양 아이콘  -->
						<li><a class="fas fa-user" href="#"></a>
							<ul class="sub-menu">
								<li><a href="gameSingle">로그인</a></li>
								<li><a href="gameSingle">회원가입</a></li>

							</ul> <!-- <div class = smile>
								<a class = "fas fa-user" href="#"></a>
								<ul class = "sub-menu">
									<li><a href = "">로그인</a></li>
									<li><a href = "">회원가입</a></li>
								</ul>
							</div>	 --></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- Header section end -->


    <!-- styles
    ================================================== -->
    <section id="styles" class="s-styles">
    
        <div class="row narrow section-intro add-bottom text-center">

            <div class="col-twelve tab-full">

                <h1>무인도</h1> <!-- 글씨체 바꾸기 -->

                <p class="lead">무인도에 갇히셨나요?
                	<br>얼른 수정해서 있어야 할 곳으로 돌아가세요.
                	<br>그렇지 않으면..... 영원히 이 곳에서 벗어날 수 없을 것입니다.
                </p>  
            </div>

        </div>
        
         <!-- 검색 -->
		<div class="search--bar row search--island">
		  <div class="col-lg-8 mx-auto">
		
		    <div class="search--box rounded">
		
		      <!-- Custom rounded search bars with input group -->
		      <form action="">		
		      
		        <div class="search--div p-1 bg-island rounded rounded-pill shadow-sm mb-4">
		          <div class="input-group">
		            <div class="input-group-prepend">
		              <button type="submit" class="btn btn-link text-warning"><i class="fa fa-search"></i></button>
		            </div>
		            <input type="search" placeholder="검색어를 입력하세요" aria-describedby="button-addon2" class="form-control border-0 ">
		          </div>
		        </div>
		        		
		      </form>
		      <!-- End -->
		
		    </div>
		  </div>
		</div>  
		<!-- 검색 끝 -->  
         
        
  		<!-- 테이블 시작! -->
        <div class="row add-bottom">

            <div class="col-twelve">

                <h3>Tables</h3>
                <p>돌아가고 싶다면.... 얼른 수정하십시오....</p>

                <div class="table-responsive">

                    <table class="island--table">
                            <thead>
	                            <tr class="table-header">
	                                <th>글 번호</th>
	                                <th>글 제목</th>
	                                <th>작성자</th>
	                                <th>수정상태</th>
	                            </tr>
                            </thead>
                            <tbody>
	                            <tr>
	                                <td>Naruto Uzumaki</td>
	                                <td>16</td>
	                                <td>Male</td>
	                                <td>Konoha</td>
	                            </tr>
	                            <tr>
	                                <td>Sakura Haruno</td>
	                                <td>16</td>
	                                <td>Female</td>
	                                <td>Konoha</td>
	                            </tr>
	                            <tr>
	                                <td>Sakura Haruno</td>
	                                <td>16</td>
	                                <td>Female</td>
	                                <td>Konoha</td>
	                            </tr>
	                            <tr>
	                                <td>Sakura Haruno</td>
	                                <td>16</td>
	                                <td>Female</td>
	                                <td>Konoha</td>
	                            </tr>
	                            <tr>
	                                <td>Sakura Haruno</td>
	                                <td>16</td>
	                                <td>Female</td>
	                                <td>Konoha</td>
	                            </tr>
	                            <tr>
	                                <td>Sakura Haruno</td>
	                                <td>16</td>
	                                <td>Female</td>
	                                <td>Konoha</td>
	                            </tr>
	                            <tr>
	                                <td>Sakura Haruno</td>
	                                <td>16</td>
	                                <td>Female</td>
	                                <td>Konoha</td>
	                            </tr>
	                            <tr>
	                                <td>Sakura Haruno</td>
	                                <td>16</td>
	                                <td>Female</td>
	                                <td>Konoha</td>
	                            </tr>
	                            <tr>
	                                <td>Sakura Haruno</td>
	                                <td>16</td>
	                                <td>Female</td>
	                                <td>Konoha</td>
	                            </tr>
	                            <tr>
	                                <td>Sakura Haruno</td>
	                                <td>16</td>
	                                <td>Female</td>
	                                <td>Konoha</td>
	                            </tr>
                            </tbody>
                    </table>

                </div>

            </div>
            
        </div> <!-- end row -->
    

        <div class="row">

            <div class="col-six tab-full">

                <h3 class="add-bottom">Form Styles</h3>

                <form>
                    <div>
                        <label for="sampleInput">Your email</label>
                        <input class="full-width" type="email" placeholder="test@mailbox.com" id="sampleInput">
                    </div>
                    <div>
                        <label for="sampleRecipientInput">Reason for contacting</label>
                        <div class="cl-custom-select">
                            <select class="full-width" id="sampleRecipientInput">
                                <option value="Option 1">Questions</option>
                                <option value="Option 2">Report</option>
                                <option value="Option 3">Others</option>
                            </select>
                        </div>
                    </div>
                    
                    <label for="exampleMessage">Message</label>
                    <textarea class="full-width" placeholder="Your message" id="exampleMessage"></textarea>

                    <label class="add-bottom">
                        <input type="checkbox">
                        <span class="label-text">Send a copy to yourself</span>
                    </label>
                    
                    <input class="btn--primary full-width" type="submit" value="Submit">

                </form>

            </div>

            <div class="col-six tab-full">

                <h3 class="add-bottom">Alert Boxes</h3>

                
                <div class="alert-box alert-box--error hideit">
                    <p>Error Message. Your Message Goes Here.</p>
                    <i class="fa fa-times alert-box__close"></i>
                </div> <!-- end error -->
                        
                <div class="alert-box alert-box--success hideit">
                    <p>Success Message. Your Message Goes Here.</p>
                    <i class="fa fa-times alert-box__close"></i>
                </div> <!-- end success -->
                        
                <div class="alert-box alert-box--info hideit">
                    <p>Info Message. Your Message Goes Here.</p>
                    <i class="fa fa-times alert-box__close"></i>
                </div> <!-- end info -->
                        
                <div class="alert-box alert-box--notice hideit">
                    <p>Notice Message. Your Message Goes Here.</p>
                    <i class="fa fa-times alert-box__close"></i>
                </div> <!-- end notice -->
            
            </div>

        </div> <!-- end row -->

    </section> <!-- end styles -->


	<!-- Footer section -->
	<footer class="site-footer">

		<a href="#top" class="smoothscroll scroll-top"> <span
			class="icon-keyboard_arrow_up"></span>
		</a>

		<div class="container">
			<div class="footer--row mb-5">
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
			</div>

			<div class="footer--row text-center">
				<div class="col-12">
					<div class="copyright text-white">
						<a href="">Colorlib</a> 2018 @ All rights reserved
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer section end -->


    <!-- Java Script
    ================================================== -->
    <script src="js/js_cassie/jquery-3.2.1.min.js"></script>
    <script src="js/js_cassie/plugins.js"></script>
    <script src="js/js_cassie/main.js"></script>
    <script src="js_header/jquery.slicknav.min.js"></script>
	<script src="js_header/header_hyesoo.js"></script>
	<script src="js_footer/footer_hee.js"></script>

</body>

</html>