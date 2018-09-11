<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="js/joinFormDefault.js"></script>
	<div id="wrap">
		<h1 onclick="location.href='intro.do'">Moons</h1>
		<div id="content">
			<div id="contentin">
				<p id="joinText">회원가입</p>
				<div id="login-box">
					<form id="joinForm" method="post" autocomplete="off">
						<input type="text" id="nickname" name="user_nickname" placeholder="닉네임" /> 
						<input type="text" id="id" name="user_id" placeholder="아이디(영문,숫자) 4자리이상" /> 
						<input type="password" id="pass" name="user_pass" placeholder="비밀번호(특수&영문&숫자) 6자이상" />
						<input type="text" id="email" name="user_email" placeholder="이메일" />
						<ul id="btn-box">
							<li><input type="button" id="sendBtn" value="인증코드 발송" /></li>
						</ul>
						<input type="hidden" id="type" name="user_type" value="default" />
						<!-- <input type="hidden" id="email" name="user_email" value="asd123@asd123.com" /> -->
						<table id="agree-box">  
							<tr><td><input type="checkbox" id="checkAll"/>전체약관에 동의합니다.</td></tr>
							<tr><td><input type="checkbox" id= "chk1" name="chk" />moons 서비스 약관에 동의합니다.</td></tr>
							<tr><td><input type="checkbox" id= "chk2" name="chk"/>개인정보 취급 방침에 동의합니다.</td></tr>
							<tr><td><input type="checkbox" id= "chk3" name="chk"/>로봇이 아닙니다.</td></tr>
						</table>
					</form>
				</div>
				<div id="btn-box">
					<input type="button" id="joinBtn" value="가입하기" />
				</div>
			</div>
		</div>
	</div>