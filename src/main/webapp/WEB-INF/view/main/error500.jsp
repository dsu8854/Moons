<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wrap">
	<h1 onclick="location.href='intro.do'">Moons</h1>
	<div id="content">
		<div id="contentin">
			<p id="errorText">500 ERROR</p>
			<p>이전페이지로 돌아가세요.</p>
			<div id="btn-box">
				<input type="button" id="backBtn" value="돌아가기" onclick="history.go(-1)"/>
			</div>
		</div>
	</div>
</div>