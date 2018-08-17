$(document).ready(function() {
	$('#joinBtn').on('click', function() {
		var getNick = RegExp(/^[가-힣]+$/);

		if (!getNick.test($("#nickname").val())) {
			alert("닉네임 형식에 맞지 않습니다.");
			$("#nickname").val("");
			$("#nickname").focus();
			return false;
		} else {
			var formdata = $('#joinForm').serialize();
			$.ajax({
				type : 'POST',
				dataType : 'text',
				url : 'joinProSns.do',
				data : formdata,
				success : viewMessage
			});
		}
	});
});

function viewMessage(res) {
	if(res=='중복된 닉네임')
		alert('중복된 닉네임입니다.');
	else
		location.href = 'index.do';
}