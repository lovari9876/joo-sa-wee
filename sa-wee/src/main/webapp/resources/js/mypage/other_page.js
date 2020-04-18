$(function() {
	
	$(document).on(
			"click",
			"#other_page",			
			function popupOpen() {
				var m_nick =  $(this).attr('data-nick');
				console.log(m_nick);
				
				url = "/other?m_nick="+m_nick;
				specs = "width=900, height=650, left=400, top=100";
				window.open(url, "", specs);
				
				return false;
			});
});