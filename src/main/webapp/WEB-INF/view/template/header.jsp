<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var webSocket;
	var user_code;
	var prev_page;
	var current_page;
	var receiver;

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
		
		webSocket = new WebSocket("ws://localhost:8090/moons/chatws.do");
		webSocket.onopen = onOpen;
		webSocket.onmessage = onMessage;
		webSocket.onclose = onClose;

		user_code = $('#user_code').val();
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
	});

	//WebSocket이 연결된 경우 호출되는 함수
	function onOpen() {
		webSocket.send('1|' + user_code);

		if (current_page.indexOf('dmRoom.do') != -1)
			enterDm();
		else if (prev_page.indexOf('dmRoom.do') != -1)
			leaveDm();
		
		if(current_page.indexOf('notice.do') != -1)
			readNotice();
	}
	
	function onClose() {
		webSocket.send('2|' + user_code);
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
					
					/* toastr.options.onclick = function (event) {
						alert('여기');
						location.href="dmRoom.do?dm_receiver="+chk_cmd[1];
			        }; */
				}
			}
		}
	}

	function enterDm() {
		webSocket.send('3|' + user_code);
	}

	function leaveDm() {
		webSocket.send('4|' + user_code);
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
	
	function timeline() {
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
</script>
<link href="css/toastr.css" type="text/css" rel="stylesheet" />
<script src="js/toastr.js"></script> 
<script src="js/sidebar.js"></script>
<link rel="stylesheet" href="css/sidebar.css">
<script src="js/header.js"></script>
<link href="css/header.css" type="text/css" rel="stylesheet" />
<div class="header-box">
	<div class="menubar">
		<a href="" class="menubarBtn"><img src="images/menubar.jpg" width="30" height="30" id="menu-bar"></a>
		<a href="index.do"><img src="images/logo.JPG" width="170" height="50" id="logo"></a>
	</div>
	<div class="search-box">
        <form id="searchFrm" method="POST" action="search.do">
        	<input type="text" name="search" id="searchField" placeholder="검색어를 입력해 주세요." />
			<select name="type" id="searchType">
				<option value="movie" selected="selected">영화</option>
				<option value="director">감독</option>
				<option value="user">유저</option>
			</select>
			<input type="hidden" name="location" id="searchLoc" value=""/>
        <button type="submit" id="searchBtn" value="검색"><img alt="" src="images/search.jpg" width="30" height="30"></button>
        </form>
    </div> 
    <!-- 자동완성 -->
    <div id="suggest">
         <dl>
            <dt id="suggestMovieSubject">영화</dt>
            <dd id="suggestMovie"></dd>
            <dt id="suggestUserSubject">유저</dt>
            <dd id="suggestUser"></dd>
         </dl>
    </div>
	<div class="right-button">
		<c:set var="user_code" value='<%=session.getAttribute("user_code")%>' />
		<c:choose>
			<c:when test="${user_code==0 }">
				<div class="adminArea">
					<input type="button" value="관리자" id="adminBtn" />
				</div>
			</c:when>
			<c:otherwise>
				<div class="noticeArea">
					<input type="button" value="알림" id="noticeBtn" />
					<span class="noticeCountArea">
						<span class="noticeCount"></span>
					</span>
				</div>
				<div class="messageArea">
					<input type="button" value="메세지" id="messageBtn" /> 
					<span class="messageCountArea">
						<span class="messageCount"></span>
					</span>
				</div>
				<div class="paymentArea">
					<input type="button" value="결제내역" id="paymentBtn" />
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<form id="noticeDmForm" action="dmRoom.do" method="post">
		<input type="hidden" name="dm_receiver" />
	</form>
	<div class="overlay"></div>
	<div id="sidebarWrap">
		<nav id="sidebar">
			<!-- 브런치 사이드바 따옴 -->
			<div id="wrapSideMenu" class="open">
				<div class="wrap_side_profile">
					<a href="javascript:timeline()" class="#side_my brunchHomeLink"> 
					<c:set var="user_photo" value='<%=session.getAttribute("user_photo")%>' />
						<c:choose>
							<c:when test="${empty user_photo}">
								<img class="my_image" src="images/basic.png" />
							</c:when>
							<c:otherwise> 
								<img class="my_image" src="images/${user_photo }" />
							</c:otherwise>
						</c:choose>
						<div class="my_profile">
							<strong class="user_name"><%=session.getAttribute("user_nickname")%></strong>
						</div>
					</a>
				</div>
				<div class="wrap_side_service_menu logout" style="height: 416px;">
					<ul>
						<li>
							<a class="menu_word5 #side_ready" href="javascript:timeline()">
								<span class="bar_left"></span>My Review
								<span class="bar_right"></span>
							</a>
							<form id="myTimelineForm" method="post"> 
								<input type="hidden" id="user_code" name="user_code" value='<%=session.getAttribute("user_code")%>' />
							</form>
						</li>
						<li>
							<a class="menu_word5 #side_ready" href="write.do">
								<span class="bar_left"></span>Review Write
								<span class="bar_right"></span>
							</a>
						</li>
						<li class="hr"></li>
						<li class="now_page">
							<a class="menu_word4 #side_brunch" href="index.do">
								<span class="bar_left"></span>MoonS
								<span class="bar_right"></span>
							</a>
						</li>
						<li>
							<a class="menu_word5 #side_publish brunchPublishLink" href="ranking.do">
								<span class="bar_left"></span>Movie Introduce
								<span class="bar_right"></span>
							</a>
						</li>
						<li>
							<a class="menu_word2 #side_feed brunchFeedLink" href="javascript:timeline()">
								<span class="bar_left"></span>Review Feed
								<span class="bar_right"></span>
							</a>
						</li>
						<li>
							<a class="menu_word6 #side_mag" href="/magazine">
							<span class="bar_left"></span>Hot Review
							<span class="bar_right"></span>
							</a>
						</li>
					</ul>
					<div class="wrap_side_setting" style="position: absolute;">
						<a href="profile.do" class="#side_settings"><button type="button">설정</button></a>
						<a id="sideMenuLogoutButton" href="exit.do"><button type="button">로그아웃</button></a>
					</div>
				</div>
				<!-- 인스타그램 따온것 -->
				<div class="SkY6J">
					<nav class="uxKLF">
						<ul class="ixdEe">
							<li class="K5OFK"><a class="l93RR" href="about.do">About MoonS</a></li>
							<li class="K5OFK"><a class="l93RR" href="contact.do">오시는길</a></li>
							<li class="K5OFK"><a class="l93RR" href="privacy.do">개인정보처리방침</a></li>
						</ul>
					</nav>
					<span class="DINPA">ⓒ 2018 MoonS</span>
				</div>
			</div>
		</nav>
	</div>
</div>
<hr />