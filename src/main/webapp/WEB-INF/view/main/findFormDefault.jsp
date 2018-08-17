<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="js/findFormDefault.js"></script>
	<div id="wrap">
		<h1 onclick="location.href='intro.do'">Moons</h1>
		<div id="content">
			<div id="contentin">
				<p id="findText">비밀번호 찾기</p>
				<div id="login-box">
					<form id="findForm" method="post" autocomplete="off">
						<input type="text" id="id" name="user_id" placeholder="아이디" />
						<input type="text" id="email" name="user_email" placeholder="이메일" /> 
						<input type="hidden" id="type" name="user_type" value="default" />
					</form>
				</div>
				<ul id="btn-box">
					<li><input type="button" id="sendBtn" value="인증코드 발송" /></li>
				</ul>
			</div>
		</div>
	</div>