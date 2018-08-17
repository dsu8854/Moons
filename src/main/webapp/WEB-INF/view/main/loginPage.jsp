<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form name="frm" id="frm" method="post">
	<div id="wrap">  
		<h1 onclick="location.href='intro.do'">Moons</h1>
		<div id="content"> 
			<div id="contentin"> 
				<p id="loginText">로그인</p>
				<input type="button" id="moonsid" value="Moons 계정으로 로그인" onclick="location.href='loginFormDefault.do'"/>
				<input type="button" id="naverid" value="Naver 계정으로 로그인" onclick="location.href='${url}'"/>
				<input type="button" id="kakaoid" value="Kakao 계정으로 로그인" onclick="location.href='loginFormKakao.do'"/> 
			</div>
		</div>
	</div>
</form>