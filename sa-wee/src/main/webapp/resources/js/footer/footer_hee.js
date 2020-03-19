// 이미 smoothscroll 쓰고 있다면 안겹치게 주석 고고

jQuery(function($) {

	'use strict';

	// navigation
	var OnePageNavigation = function() {
		var navToggler = $('.site-menu-toggle');
		
		$("body").on("click", ".main-menu li a[href^='#'], .smoothscroll[href^='#'], .site-mobile-menu .site-nav-wrap li a",
				function(e) {
					e.preventDefault();

					var hash = this.hash;

					$('html, body').animate({ 
						'scrollTop' : $(hash).offset().top
						}, 600, 'easeInOutCirc', function() {
							window.location.hash = hash;
						});

			});
	};
	OnePageNavigation();	

});