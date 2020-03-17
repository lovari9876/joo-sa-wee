


			/*if ($("#fileCheck").val() != "") {
				var ext = $('#docufile').val().split('.').pop().toLowerCase();
				if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg', 'doc',
						'docx', 'xls', 'xlsx', 'hwp' ]) == -1) {
					alert('등록 할수 없는 파일명입니다.');
					$("#fileCheck").val(""); // input file 파일명을 다시 지워준다.
					return;
				}
			}*/

			var thumbext = document.getElementById('fileCheck').value; 
			 //파일을 추가한 input 박스의 값

			thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); 
			 //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.

			if (thumbext != "jpg" && thumbext != "png" && thumbext != "gif"
					&& thumbext != "bmp") { // 확장자를 확인합니다.

				alert('썸네일은 이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');

				return;

			}

		