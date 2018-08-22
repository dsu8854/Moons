<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	var webSocket;
	var user_code;
	var prev_page;
	var current_page;

	$(document).ready(function() {
		webSocket = new WebSocket("ws://localhost:8090/moons/chatws.do");
		webSocket.onopen = onOpen;
		webSocket.onmessage = onMessage;
		webSocket.onclose = onClose;

		user_code = $('#user_code').val();
		prev_page = document.referrer.toString();
		current_page = window.location.href.toString();
		
		countNotice();
		countDm();

		$('#noticeBtn').on('click', function() {
			location.href = "notice.do";
		});

		$('#writeBtn').on('click', function() {
			location.href = "write.do";
		});

		$('#messageBtn').on('click', function() {
			location.href = "dmList.do";
		});

		$('#profileBtn').on('click', function() {
			location.href = "profile.do";
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
	
	/* function readDm() {
		$.ajax({
			url: 'dmRead.do?',
			type: 'POST',
			dataType: 'text',
			success: function() {
				$('.messageCount').text(0);
			}
		});
	} */
</script>
<script src="js/sidebar.js"></script>
<link rel="stylesheet" href="css/sidebar.css">
<script src="js/header.js"></script>
<link href="css/header.css" type="text/css" rel="stylesheet" />
<div class="header-box">
	<div class="menubar">
		<a href="" class="menubarBtn"><img src="images/menubar.jpg" width="30" height="30" id="menu-bar"></a>
		<a href="index.do"><img src="images/logo.JPG" width="170"
			height="50" id="logo"></a>
	</div>
	<div class="search-box">
        <input type="text" name="search" id="searchField" placeholder="검색어를 입력해 주세요." />
        <button type="button" id="searchBtn" value="검색"><img alt="" src="images/search.jpg" width="30" height="30"></button>
    </div> 
    <!-- 자동완성 -->
    <div id="suggest">
         <dl>
            <dt id="suggestMovieSubject">영화</dt>
            <dd id="suggestMovie"></dd>
            <dt id="suggsetAuthorSubject">작가</dt>
            <dd id="suggsetAuthor"></dd>
         </dl>
    </div>
	<div class="right-button">
		<div class="noticeArea">
			<input type="button" value="알림" id="noticeBtn" />
			<span class="noticeCountArea">
				<span class="noticeCount"></span>
			</span>
		</div>
		<div class="writeArea">
			<input type="button" value="글쓰기" id="writeBtn" /> 
		</div>
		<div class="messageArea">
			<input type="button" value="메세지" id="messageBtn" /> 
			<span class="messageCountArea">
				<span class="messageCount"></span>
			</span>
		</div>
		<div class="profileArea">
			<input type="button" value="마이페이지" id="profileBtn" />
		</div>
	</div>
	<div class="overlay"></div>
	<div id="sidebarWrap">
		<nav id="sidebar">
			<!-- 브런치 사이드바 따옴 -->
			<div id="wrapSideMenu" class="open">
				<div class="wrap_side_profile">
					<a href="profile.do" class="#side_my brunchHomeLink"> 
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
							<!-- <p class="text_profile_id">MoonS.co.kr/@han2233</p> -->
						</div>
					</a> <a
						class="wrap_side_ico ico_side_likeit text_hide brunchLikeLink #side_likeit"
						href="/likeit"></a> <a
						class="wrap_side_ico ico_side_history text_hide #side_history"
						href="/me/history"></a> <span class="img_side_menu ico_alim_new">NEW</span>
				</div>
				<div class="wrap_side_service_menu logout" style="height: 416px;">
					<ul>
						<li><a class="menu_word5 #side_ready" href="/ready"><span
								class="bar_left"></span>내가 쓴 리뷰<span class="bar_right"></span></a></li>
						<li class="hr"></li>
						<li class="now_page"><a class="menu_word4 #side_brunch"
							href="main.do"><span class="bar_left"></span>MoonS 홈<span
								class="bar_right"></span></a></li>
						<li><a class="menu_word5 #side_now brunchNowLink" href="/now"><span
								class="bar_left"></span>MoonS Now<span class="bar_right"></span></a>
						</li>
						<li><a class="menu_word5 #side_publish brunchPublishLink"
							href="/publish"><span class="bar_left"></span>신작영화<span
								class="bar_right"></span></a></li>
						<li><a class="menu_word2 #side_feed brunchFeedLink"
							href="list.do"><span class="bar_left"></span>피드<span
								class="bar_right"></span></a></li>
						<li><a class="menu_word6 #side_mag" href="/magazine"><span
								class="bar_left"></span>이달의 리뷰<span class="bar_right"></span></a></li>

					</ul>
					<div class="wrap_side_setting" style="position: absolute;">
						<a href="/me/settings" class="#side_settings"><button type="button">설정</button></a>
						<a id="sideMenuLogoutButton" href="exit.do"><button type="button">로그아웃</button></a>
					</div>
				</div>
				<!-- 인스타그램 따온것 -->
				<div class="   SkY6J">
					<nav class="uxKLF">
						<ul class="ixdEe">
							<li class="K5OFK"><a class="l93RR" href="about.do">MoonS
									정보</a></li>
							<li class="K5OFK"><a class="l93RR">채용 정보</a></li>
							<li class="K5OFK"><a class="l93RR">개인정보처리방침</a></li>
							<li class="K5OFK"><a class="l93RR">디렉터리</a></li>
						</ul>
					</nav>
					<span class="DINPA">ⓒ 2018 MoonS</span>
				</div>
			</div>
		</nav>
	</div>
	<input type="hidden" id="user_code"
		value='<%=session.getAttribute("user_code")%>' />
</div>
<hr />
