$(document).ready(function() {
	$('#sendBtn').on('click',function(){
		if($('#email').val()==''){
			alert('이메일을 입력해주세요.');
			return false;
		}
		var formdata = $('#joinForm').serialize();
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'checkEmail.do',
			data : formdata,
			success : checkEmailDup
		});
	});
	
	$('#btn-box').on('click','#authBtn',function(){
		if(auth_code != $('#auth_code').val())
			alert("인증 코드가 일치하지 않습니다.");
		else {
			$('#auth_code').val('인증 성공');
			$('#auth_code').attr('readonly',true);
		}
	});
	
	$('#joinBtn').on('click', join);

	$("#checkAll").on('click', function() {
		// 클릭되었으면
		if ($("#checkAll").prop("checked")) {
			// input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
			$("input[name=chk]").prop("checked", true);
			// 클릭이 안되있으면
		} else {
			// input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
			$("input[name=chk]").prop("checked", false);
		}
	});

	$("[name=chk]").on('click', function() {
		var unChecked = false;
		$.each($("[name=chk]"), function(index, item) {
			if (!$(item).prop("checked")) {
				$("#checkAll").prop("checked", false);
				unChecked = true;
				return false;
			}
		});
		if (!unChecked)
			$("#checkAll").prop("checked", true);
	});
	
	$('#nickname, #id, #pass, #email').keydown(function (key) {
        if(key.keyCode == 13){
            join();
        }
    });
});

function join() {
	var getNick = RegExp(/^[가-힣a-zA-Z0-9]{2,8}$/);
	var getId = RegExp(/^[a-zA-Z0-9]{4,12}$/);
	var getCheck = RegExp(/[a-zA-Z0-9]{6,12}$/);

	if (!getNick.test($("#nickname").val())) {
		alert("닉네임 형식에 맞지 않습니다. (한글,숫자,영문) 2~8자리");
		$("#nickname").val("");
		$("#nickname").focus();
		return false;
	} else if (!getId.test($("#id").val())) {
		alert("아이디 형식에 맞지 않습니다. (숫자,영문) 4~12자리");
		$("#id").val("");
		$("#id").focus();
		return false;
	} else if (!getCheck.test($("#pass").val())) {
		alert("비밀번호 형식에 맞지 않습니다. (숫자,영문) 6~12자리");
		$("#pass").val("");
		$("#pass").focus();
		return false;
	} else if ($("#checkAll").is(":checked") == false) {
		alert("이용약관에 동의하여 주세요.");
		return false;
	} else if ($('#auth_code').val()!='인증 성공') {
		alert('이메일 인증을 진행해주세요.')
		return false;
	} else {
		var formdata = $('#joinForm').serialize();
		$.ajax({
			type : 'POST',
			dataType : 'text',
			url : 'joinProDefault.do',
			data : formdata,
			success : viewMessage
		});
	}
}

function viewMessage(res) {
	if(res=='중복된 닉네임')
		alert('중복된 닉네임입니다.');
	else if(res=='중복된 아이디')
		alert('중복된 아이디입니다.');
	else
		location.href = 'joinSuccess.do';
}

function checkEmailDup(res) {
	if(!res) {
		alert('이미 존재하는 이메일입니다.');
	} else {
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