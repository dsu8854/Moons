var webSocket;
var nick;

$(document).ready(function() {
	// 웹 소켓 연결
	webSocket = new WebSocket("ws://localhost:8090/mywebsocket/chatws.do");
	webSocket.onopen = onOpen;
	webSocket.onmessage = onMessage;
	webSocket.onclose = onClose;

	// 전송 버튼 눌렀을 때 메시지 전송
	$('#sendBtn').on('click', function() {
		onSend();
	});

	// 엔터 키로 메시지 전송
	$('#message').on('keypress', function(event) {
		if (event.keyCode == 13)
			onSend();
	})

	// 퇴장 버튼을 누를 때 이벤트 처리
	$('#exitBtn').on('click', function() {
		webSocket.send(nick + '님 퇴장');
		onClose();
	});

	// 브라우저 창을 종료할 때 연결 해제
	$(window).on('close', function() {
		onClose();
	})
});

// WebSocket이 연결된 경우 호출되는 함수
function onOpen() {
	console.log("연결");
	$("#nickname").attr("readonly", true);
	nick = $('#nickname').val();
	webSocket.send(nick + '님 입장');
	$('#enterBtn').hide();
	$('#exitBtn').show();
}

// 서버에서 메시지가 왔을 때 호출되는 함수
function onMessage(evt) {
	// 서버가 전송한 메시지 받아오기
	var data = evt.data;
	var chk_cmd = data.split(":");
	var chk_msg = data.split("/");
	if (chk_cmd.length == 1 && chk_msg.length != 1) {
		$('#userList').empty();
		var userList = data.split("/");
		$.each(userList, function(index, item) {
			if (index == 0)
				return true;
			$('#userList').append(item + '<br />');
		});
	} else {
		// 메시지를 출력
		$('#chatMessageArea').append(data + '<br />');
	}
}

// 메시지 전송 처리
function onSend() {
	// nickname과 message에 입력된 내용을 서버에 전송
	var msg = $('#message').val();
	// 메시지 전송
	webSocket.send(nick + ':' + msg);
	// 메시지 입력창 초기화
	$('#message').val('');
}

function onClose() {
	console.log("종료");
	// 웹 소켓 연결 해제
	webSocket.close();
	$("#nickname").attr("readonly", false);
	$('#enterBtn').show();
	$('#exitBtn').hide();
	nick = '';
}