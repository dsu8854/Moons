$(document).ready(function() {
	$('#loginBtn').on('click', function() {
		var formdata = $('#loginForm').serialize();
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'loginProDefault.do',
			data : formdata,
			success : viewMessage
		});
	});
	
	$('#findBtn').on('click',function(){
		location.href= 'findFormDefault.do';
	});

	$('#join').on('click', function() {
		location.href = 'joinFormDefault.do';
	});
});

function viewMessage(res) {
	if(res=='아이디/비밀번호 불일치')
		alert('아이디 또는 비밀번호가 일치하지 않습니다.');
	else
		location.href = 'index.do';
}