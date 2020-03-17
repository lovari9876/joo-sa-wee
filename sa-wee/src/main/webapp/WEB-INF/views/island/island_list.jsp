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

	<!-- header include start -->
	<%@ include file="/WEB-INF/views/share/header.jsp" %>
	<!-- header include end -->
	
	
    <!-- styles // 본문 테이블
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


	<!-- footer include start -->
	<%@ include file="/WEB-INF/views/share/footer.jsp" %>
	<!-- footer include end -->


    <!-- Java Script
    ================================================== -->
    <script src="js/js_cassie/jquery-3.2.1.min.js"></script>
    <script src="js/js_cassie/plugins.js"></script>
    <script src="js/js_cassie/main.js"></script>
    <script src="js/js_header/jquery.slicknav.min.js"></script>
	<script src="js/js_header/header_hyesoo.js"></script>
	<!-- <script src="js/js_footer/footer_hee.js"></script> --> <!-- scroll to top 이미 있음 -->

</body>

</html>