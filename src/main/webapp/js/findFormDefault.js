var auth_code;

$(document).ready(function() {
	$('#sendBtn').on('click',function(){
		var formdata = $('#findForm').serialize();
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'checkEmail.do',
			data : formdata,
			success : viewMessage
		});
	});
	
	$('#btn-box').on('click','#authBtn',function(){
		if(auth_code != $('#auth_code').val())
			alert("인증 코드가 일치하지 않습니다.");
		else {
			$('#auth_code').val('인증 성공');
			$('#auth_code').attr('readonly',true);
			console.log("여기 들어오니?");
			$('#btn-box').append('<li><input type="button" id="findBtn" value="비밀번호 찾기" /></li>');
		}
	});
	
	$('#btn-box').on('click','#findBtn',function(){
		$('#findForm').attr('action','findProDefault.do').submit();
	});
});

function viewMessage(res) {
	if(res=='아이디/이메일 불일치') {
		alert('계정 정보가 없습니다.');
	} else if('인증 성공') {
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'mailSend.do',
			data : 'user_email='+$('#email').val(),
			success : resultMessage
		});
	}
}

function resultMessage(res) {
	if(res=='발송 실패') {
		alert('메일 전송에 실패하였습니다.');
	} else {
		auth_code = res;
		$('#btn-box').append('<li><input type="text" id="auth_code" placeholder="인증코드(6자리)" /></li>');
		$('#btn-box').append('<li><input type="button" id="authBtn" value="인증코드 확인" /></li>');
	}
}