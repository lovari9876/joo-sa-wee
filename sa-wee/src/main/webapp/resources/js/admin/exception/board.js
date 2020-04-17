$(document).ready(
		function() {

			var page = $('#btnConfirm').val();
			
			$("#btnConfirm").click(
					function() {
						

						var title = $('#title').val();	//제목
						var editor = myEditor.getData();//내용 (에디터 값 가져오기)
						

						if (title == "" || editor == "") {

							alert('빈칸이 있습니다. 모든 칸에 값을 입력해주세요.');
							return false;

						} else {
							
							if(page == 'faq_modify'){
								var modify = document.getElementById("viewForm");
								modify.action="/admin/updateFaq";
								modify.submit();
								console.log("modify");
								
							}else if(page == 'faq_write'){
								var insert = document.getElementById("viewForm");
								insert.action="/admin/faqInsert";
								insert.submit();
								console.log("insert");
								
							}else if(page = 'notice_write'){
								var insert = document.getElementById("viewForm");
								insert.action="/admin/boardInsert";
								insert.submit();
								console.log("insert");
								
							}else if(page = 'notice_modify'){
								var modify = document.getElementById("viewForm");
								modify.action="/admin/updateNotice";
								modify.submit();
								console.log("modify");
							}
							
							
							
							
							
							

						}

					});

		});