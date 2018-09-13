$(document).ready(function(){
	$('#sendBtn').on('click',function(){
		if($('#mail_subject').val()==''){
			alert('제목을 입력하세요.');
			return false;
		} else if($('#mail_content').val()==''){
			alert('내용을 입력하세요.');
			return false;
		}
		
		$('[name=title]').val($('#mail_subject').val());
		$('[name=content]').val($('#mail_content').val());
		
		var formdata = $('#mailForm').serialize();
		$.ajax({
			url: 'mailSendAll.do',
			type: 'POST',
			dataType: 'text',
			data: formdata,
			success: function(res){
				if(res) {
					alert('발신 성공');
					location.href="adminMain.do";
				} else {
					alert('발신 실패');
				}
			}
		});
	});
});