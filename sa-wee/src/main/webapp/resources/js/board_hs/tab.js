$(document).ready(function(){
	
	$('.tab li').click(function(){
		var activeTab = $(this).attr('data-tab');
		$('.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	
	})
});