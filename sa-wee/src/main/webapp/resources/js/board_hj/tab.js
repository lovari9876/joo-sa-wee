$(document).ready(function() {

	// When page loads...
	$(".tabcontent").hide(); // Hide all content
	$("ul.tab li:first").addClass("current").show(); // Activate first tab
	$(".tabcontent:first").show(); // Show first tab content

	// On Click Event
	$("ul.tab li").click(function() {

		$("ul.tab li").removeClass("current"); // Remove any "active" class
		$(this).addClass("current"); // Add "active" class to selected tab
		$(".tabcontent").hide(); // Hide all tab content

		var activeTab = $(this).find("a").attr("href"); // Find the href attribute value to identify the active tab + content
		$(activeTab).fadeIn(); // Fade in the active ID content
		return false;
	});

});
