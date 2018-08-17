<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div id="wrap">
		<h1 onclick="location.href='intro.do'">Moons</h1>
		<div id="content">
			<div id="contentin">
				<p id="findText">비밀번호 찾기 완료</p>
				<p>고객님의 비밀번호는 ${user_pass}입니다.</p>
				<div id="btn-box">
					<input type="button" id="loginBtn" value="로그인" onclick="location.href='loginPage.do'"/>
				</div>
			</div>
		</div>
	</div>