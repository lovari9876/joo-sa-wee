$(document).ready(
		function() {

			$("#btnConfirm").click(
					function() {

						var g_name_kor = $('input[name="g_name_kor"]').val();
						var g_min = $('input[name="g_min"]').val();
						var g_max = $('input[name="g_max"]').val();
						var g_playtime = $('input[name="g_playtime"]').val();
						var g_release = $('input[name="g_release"]').val();

						if (g_name_kor == "" || g_min == "" || g_max == ""
								|| g_playtime == "" || g_release == "") {

							alert('빈칸이 있습니다. 모든 칸에 값을 입력해주세요.');
							return false;

						} else {
							var modify = document.getElementById("viewForm");
							modify.action = "/admin/updateGame";
							modify.submit();
							console.log("modify");

						}

					});

		});