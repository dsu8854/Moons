<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="js/joinFormSns.js"></script>
	<div id="wrap">
		<h1 onclick="location.href='intro.do'">Moons</h1>
		<div id="content">
			<div id="contentin">
				<p id="joinText">회원가입</p>
				<div id="login-box">
					<form id="joinForm" method="post" autocomplete="off">
						<input type="text" id="nickname" name="user_nickname" placeholder="닉네임" /> 
						<input type="hidden" id="id" name="user_id" value="${udto.user_id}" /> 
						<input type="hidden" id="type" name="user_type" value="${udto.user_type}" />
						<input type="hidden" id="email" name="user_email" value="${udto.user_email}" />
					</form>
				</div>
				<div id="btn-box">
					<input type="button" id="joinBtn" value="가입하기" />
				</div>
			</div>
		</div>
	</div>