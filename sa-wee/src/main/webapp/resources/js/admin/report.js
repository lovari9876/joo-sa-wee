$("#m_out").click(function() {
	var out = document.getElementById("viewForm");
	out.action = '/admin/outMember_report';
	out.submit();
	console.log("out");
	alert("해당 회원이 탈퇴처리 되었습니다.");
});


