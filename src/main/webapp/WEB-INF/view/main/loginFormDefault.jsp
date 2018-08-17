<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="js/loginFormDefault.js"></script>
	<div id="wrap">
		<h1 onclick="location.href='intro.do'">Moons</h1>
		<div id="join-box">
			<input type="button" id="join" value="회원가입" />
		</div>
		<div id="content">
			<div id="contentin">
				<p id="loginText">로그인</p>
				<div id="login-box">
					<form id="loginForm" method="post" autocomplete="off">
						<input type="text" id="id" name="user_id" placeholder="아이디" /> 
						<input type="password" id="pass" name="user_pass" placeholder="비밀번호 (6자이상)" />
						<input type="hidden" id="type" name="user_type" value="default" />
					</form>
				</div>
				<ul id="btn-box">
					<li><input type="button" id="loginBtn" value="로그인" /></li>
					<li><input type="button" id="findBtn" value="비밀번호 찾기" /></li>
				</ul>
			</div>
		</div>
	</div>