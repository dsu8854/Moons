$(document).ready(function() {
	toastr.options = {
			"closeButton": true,
			"debug": false,
			"newestOnTop": false,
			"progressBar": false,
			"positionClass": "toast-bottom-right",
			"preventDuplicates": false,
			"onclick": clickEvent,
			"showDuration": "300",
			"hideDuration": "1000",
			"timeOut": "3000",
			"extendedTimeOut": "1000",
			"showEasing": "swing",
			"hideEasing": "linear",
			"showMethod": "fadeIn",
			"hideMethod": "fadeOut"
		}
			
		webSocket = new WebSocket("ws://192.168.200.158:8090/moons/chatws.do");
		webSocket.onopen = onOpen;
		webSocket.onmessage = onMessage;
		webSocket.onclose = onClose;
	
	$('#reportBtn').on('click', function() {
		location.href = "adminReport.do";
	});

	$('#withdrawBtn').on('click', function() {
		location.href = "adminWithdraw.do";
	});

	$('#boardBtn').on('click', function() {
		location.href = "adminBoard.do";
	});
	
	$('#memberBtn').on('click', function() {
		location.href = "adminMember.do";
	});
	
	$('#mailBtn').on('click', function() {
		location.href = "adminMail.do";
	});
	
	countReport();
	countWithdraw();
});

//WebSocket이 연결된 경우 호출되는 함수
function onOpen() {
	webSocket.send('1|' + 0);
}

function onClose() {
	webSocket.send('2|' + 0);
	webSocket.close();
}

//서버에서 메시지가 왔을 때 호출되는 함수
function onMessage(evt) {
	// 서버가 전송한 메시지 받아오기
	var data = evt.data;

	if (data == 'report') {
		$('.reportCount').text(parseInt($('.reportCount').text())+1);
		toastr.warning('신고가 접수되었습니다.');
	} else if (data == 'withdraw') {
		$('.withdrawCount').text(parseInt($('.withdrawCount').text())+1);
		toastr.info('인출 신청이 접수되었습니다.');
	}
}

function countReport() {
	$.ajax({
		url: 'reportCount.do?',
		type: 'POST',
		dataType: 'text',
		success: function(res) {
			$('.reportCount').text(res);
		}
	});
}

function countWithdraw() {
	$.ajax({
		url: 'withdrawCount.do?',
		type: 'POST',
		dataType: 'text',
		success: function(res) {
			$('.withdrawCount').text(res);
		}
	});
}

function clickEvent(e) {
	if($(e.currentTarget).hasClass('toast-warning')){
		location.href='adminReport.do';
	} else {
		location.href='adminWithdraw.do';
	}
}