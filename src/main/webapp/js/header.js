var webSocket;
var my_code;
var prev_page;
var current_page;
var receiver;

$(document).ready(function(){	
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
		
	webSocket = new WebSocket("ws://192.168.10.61:8090/moons/chatws.do");
	webSocket.onopen = onOpen;
	webSocket.onmessage = onMessage;
	webSocket.onclose = onClose;

	my_code = $('#my_code').val();
	prev_page = document.referrer.toString();
	current_page = window.location.href.toString();
		
	countNotice();
	countDm();

	$('#adminBtn').on('click', function(){
		location.href = "adminMain.do";
	});
		
	$('#noticeBtn').on('click', function() {
		location.href = "notice.do";
	});

	$('#messageBtn').on('click', function() {
		location.href = "dmList.do";
	});
		
	$('#paymentBtn').on('click', function() {
		location.href = "payment.do";
	});
	
	//자동검색창 크기조절
	$('#suggest').css({'top':($('#searchField').offset().top+45)+'px',
		'left':$('#searchField').offset().left+'px'});
	//창크기 변화시 자동검색창 크기조절
	$('#suggest').css({'top':($('#searchField').offset().top+45)+'px',
		'left':$('#searchField').offset().left+'px',
		'width':$('#searchField').width()+'px'});
	$(window).on('resize',function(){
		$('#suggest').css({'top':($('#searchField').offset().top+45)+'px',
			'left':$('#searchField').offset().left+'px',
			'width':$('#searchField').width()+'px'});
	});
	
	//search.do가 아닌곳에서 검색버튼 클릭시
	var url=window.location.href;
	$('#searchbtn').click(function(){
		if(!(window.location.href.indexOf("search.do")>=0))
			$('#searchLoc').val(url.slice(url.indexOf('/moons/') + 1, url.length));
		$('#searchFrm').submit();
	});
	
	$('#searchField').on('keypress',function(event){
		 if(event.keyCode==13){
			if($('#searchField').val()=="")
					return false;
				
			if(!(window.location.href.indexOf("search.do")>=0)){
				$('#searchLoc').val(url.slice(url.indexOf('/moons/') + 7, url.length));
			}
			$('#searchFrm').submit();
		 }
	 });
	
	//자동완성:자동검색 이벤트  ajax 발생
	$('#searchField').on('keyup', function(){
		$('#suggest').css({'display':'inline'});
		
		if($('#searchField').val()==""){
			$('#suggest').css({'display':'none'});
			return false;
		}
			
		$.ajax({
			type:'GET',
			dataType:'xml',
			url:'searchMovieOpen.do?search='+$('#searchField').val()+'&listCount=4&startCount=0&detail=N',
			success:suggestMovieMessage
		});
		
		$.ajax({
			type:'GET',
			dataType:'json',
			url:'searchUserOpen.do?search='+$('#searchField').val()+'&listCount=4&startCount=0',
			success:suggestUserMessage
		});
	});
	
	//body클릭시 자동검색창 가려짐
	$('body').on('click',function(){
		if($(this).attr('id')=='suggest')
			return false;
		$('#suggest').css({'display':'none'});
	});

});

//WebSocket이 연결된 경우 호출되는 함수
function onOpen() {
	webSocket.send('1|' + my_code);

	if (current_page.indexOf('dmRoom.do') != -1)
		enterDm();
	else if (prev_page.indexOf('dmRoom.do') != -1)
		leaveDm();
	
	if(current_page.indexOf('notice.do') != -1)
		readNotice();
}

function onClose() {
	webSocket.send('2|' + my_code);
	webSocket.close();
}

//서버에서 메시지가 왔을 때 호출되는 함수
function onMessage(evt) {
	// 서버가 전송한 메시지 받아오기
	var data = evt.data;

	if (data == 'notice') {
		$('.noticeCount').text(parseInt($('.noticeCount').text())+1);
		toastr.info('알림이 도착했습니다.');
	} else {
		var chk_cmd = data.split("|");
		if (chk_cmd[0] == 'dm') {
			if (chk_cmd[1] == '0') {
				$('.dmbody').append('<div class="dmReceive"><a href=""><img src="images/'
									+ $('#yourPhoto').val()
									+ '" alt="" class="receiverPhoto"</a><span class="receiveBorder"><span class="reMes">'
									+ chk_cmd[3]
									+ '</span></span><span class="resDate">방금</span></div>');
				document.querySelector(".dmbody").scrollTo(0,document.querySelector(".dmbody").scrollHeight);
				
				var dmFormData = $('#dmForm').serialize();
				$.ajax({
					url: 'dmRead.do?',
					type: 'POST',
					dataType: 'text',
					data: dmFormData
				});
			} else {
				$('.messageCount').text(parseInt($('.messageCount').text())+1);
				$('#roomCount_'+chk_cmd[2]).text(parseInt($('#roomCount_'+chk_cmd[2]).text())+1);
				$('#roomMessage_'+chk_cmd[2]).text(chk_cmd[3]);
				toastr.success(chk_cmd[3], chk_cmd[4]);
				receiver = parseInt(chk_cmd[1]);
			}
		}
	}
}

function enterDm() {
	webSocket.send('3|' + my_code);
}

function leaveDm() {
	webSocket.send('4|' + my_code);
}

function countNotice() {
	$.ajax({
		url: 'noticeCount.do?',
		type: 'POST',
		dataType: 'text',
		success: function(res) {
			$('.noticeCount').text(res);
		}
	});
}

function countDm() {
	$.ajax({
		url: 'dmCount.do?',
		type: 'POST',
		dataType: 'text',
		success: function(res) {
			$('.messageCount').text(res);
		}
	});
}

function readNotice() {
	$.ajax({
		url: 'noticeRead.do?',
		type: 'POST',
		dataType: 'text',
		success: function() {
			$('.noticeCount').text(0);
		}
	});
}

function mytimeline() {
	$('#myTimelineForm').attr('action','timeline.do').submit();
}

function clickEvent(e) {
	if($(e.currentTarget).hasClass('toast-success')){
		$('#noticeDmForm').children('input').val(receiver);
		$('#noticeDmForm').submit();
	} else {
		location.href='notice.do';
	}
}
	
function suggestMovieMessage(data){
	var xmlData = $(data).find('Result');
	
	$('#suggestMovie').empty();
	
	$(xmlData).find('Row').each(function(index){
		var ap='<div class="searchMovieBox"><div id="movieTitle">'+ $(this).find('title').text() +'<br/>';
		ap+='<input type="hidden" id="movieDirector" value="'+$(this).find('director').text()+'" /></div></div>';
		
		$(document).on('click','.searchBox',function(){
			location.href = 'movie.do?title='+$(this).find('#movieTitle').text()+'&director='+$(this).find('#movieDirector').val();
		});
		
		$('#suggestMovie').append(ap);
	}); 

	$(document.getElementsByTagName('img')).each(function(index,item){
		if($(item).attr('src')=="  "){
			$(item).attr('src','images/noimage.png');
		}
	});
}//end viewMessage

function suggestUserMessage(data){
	$('#suggestUser').empty();
	console.log('suggestuser');
	$.each(data, function(index, value){
		var st='<div class="searchUserBox">'
			+'<div id="image"><img src="images/'+value.user_photo+'"/></div>'
			+'<div id="userName">'+ value.user_nickname 
			+'&nbsp; <span id="userID"> @'+value.user_id +'</span></div>'
			+'<input type="hidden" id="userCode" value="'+value.user_code+'"/></div>';
		
		$(document).on('click','.searchUserBox',function(){
			location.href='timeline.do?user_code='+$(this).find('#userCode').val();
		});
		
		$('#suggestUser').append(st);
	}); 
 	$(document.getElementsByTagName('img')).each(function(index,item){
		if($(item).attr('src')=='images/null'){
			$(item).attr('src','images/basic.png');
		}
	});
} 