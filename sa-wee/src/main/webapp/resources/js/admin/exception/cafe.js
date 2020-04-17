$(document).ready(function() {
	
		var check = /^[0-9]*$/;
		//전화번호 숫자만 입력되도록
		$('#phone').keyup(
				
				function() {
					if (!check.test($('#phone').val())) {
						console.log($('#phone').val());
						alert('숫자만 입력하세요');
						$("#phone").val($('#phone').val().replace(/[^0-9]/g,""));
					}else{
						console.log($('#phone').val());
						
					}
				});
		
			
			
			
			var page = $('#btnConfirm').val();

			console.log("page : " + page);

			$("#btnConfirm").click(
					function() {

						var c_title = $('input[name="c_title"]').val();
						var c_add = $('input[name="c_add"]').val();
						var c_phone = $('input[name="c_phone"]').val();
						var c_people = $('input[name="c_people"]').val();
						var c_table = $('input[name="c_table"]').val();
						var c_chair = $('input[name="c_chair"]').val();
						var c_open = $('input[name="c_open"]').val();
						var c_close = $('input[name="c_close"]').val();
						var c_rest = $('input[name="c_rest"]').val();

						
						if (c_title == "" || c_add == "" || c_phone == ""
								|| c_people == "" || c_table == ""
								|| c_chair == "" || c_open == ""
								|| c_close == "" || c_rest == "") {

							alert('빈칸이 있습니다. 모든 칸에 값을 입력해주세요.');
							return false;

						} else {

							if (page == "modify_view") {
								// 수정
								var modify = document
										.getElementById("viewForm");
								console.log('modify : ' + modify);
								modify.action = "/admin/updateCafe";
								modify.submit();
								console.log("modify");

							} else {
								// 글쓰기 insert
								var insert = document
										.getElementById("viewForm");
								insert.action = "/admin/cafeInsert";
								insert.submit();
								console.log("insert");

							}

						}

					});

		});