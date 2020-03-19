$(function() {

	$("#form-total")
			.steps(
					{
						headerTag : "h2",
						bodyTag : "section",
						transitionEffect : "fade",
						enableAllSteps : true,
						autoFocus : true,
						transitionEffectSpeed : 500,
						titleTemplate : '<div class="title">#title#</div>',
						labels : {
							previous : 'Previous',
							next : 'Next Step',
							finish : 'Submit',
							current : ''
						},

						onStepChanging : function(event, currentIndex, newIndex) {
							var m_name = $('#m_name').val();
							var m_id = $('#m_id').val();
							var m_nick = $('#m_nick').val();
							var gender = $(
									':input:radio[name=m_gender]:checked')
									.val();

							var m_phone = $('#m_phone').val();
							var m_email = $('#m_email').val();
							var m_post = $('#m_post').val();
							var m_addr = $('#m_addr1').val() + ' '
									+ $('#m_addr2').val();

							var m_re_sms = $(
									':input:radio[name=m_re_sms]:checked')
									.val();
							var m_re_notice = $(
									':input:radio[name=m_re_notice]:checked')
									.val();
							var m_re_message = $(
									':input:radio[name=m_re_message]:checked')
									.val();
							var m_info = $(':input:radio[name=m_info]:checked')
									.val();

							var m_self = $('#m_self').val();

							$('#m_name-val').text(m_name);
							$('#m_id-val').text(m_id);
							$('#m_nick-val').text(m_nick);
							$('#m_gender-val').text(gender);

							$('#m_phone-val').text(m_phone);
							$('#m_email-val').text(m_email);
							$('#m_post-val').text(m_post);
							$('#m_addr-val').text(m_addr);

							$('#m_re_sms-val').text(m_re_sms);
							$('#m_re_notice-val').text(m_re_notice);
							$('#m_re_message-val').text(m_re_message);
							$('#m_info-val').text(m_info);

							$('#m_self-val').text(m_self);

							return true;
						},

						onFinished : function(event, currentIndex) {
							alert("Submitted!");
							location.href="join_success";							
						}

					});

	$("#date").datepicker({
		dateFormat : "MM - DD - yy",
		showOn : "both",
		buttonText : '<i class="zmdi zmdi-chevron-down"></i>',
	});
});
