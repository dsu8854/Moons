$(document).ready(function() {
	$('#joinBtn').on('click', function() {
		var getNick = RegExp(/^[가-힣]+$/);
		var getId = RegExp(/^[a-zA-Z0-9]{4,12}$/);
		var getCheck = RegExp(/[a-zA-Z0-9]{6,12}$/);

		if (!getNick.test($("#nickname").val())) {
			alert("닉네임 형식에 맞지 않습니다.");
			$("#nickname").val("");
			$("#nickname").focus();
			return false;
		} else if (!getId.test($("#id").val())) {
			alert("아이디 형식에 맞지 않습니다. 4~12자리");
			$("#tbPwd").val("");
			$("#tbPwd").focus();
			return false;
		} else if (!getCheck.test($("#password").val())) {
			alert("비밀번호 형식에 맞지 않습니다. (숫자,영문) 6~12자리");
			$("#tbPwd").val("");
			$("#tbPwd").focus();
			return false;
		} else if ($("#checkAll").is(":checked") == false) {
			alert("이용약관에 동의하여 주세요.");
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
	});

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
});

function viewMessage(res) {
	if(res=='중복된 닉네임')
		alert('중복된 닉네임입니다.');
	else if(res=='중복된 아이디')
		alert('중복된 아이디입니다.');
	else
		location.href = 'joinSuccess.do';
}