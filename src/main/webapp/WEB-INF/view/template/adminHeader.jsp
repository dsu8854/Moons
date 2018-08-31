<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/admin.css">
<script src="js/admin.js"></script>
<div class="header-box">
<div class="left-button">
	<a href="index.do"><img src="images/logo.JPG" width="170" height="50" id="logo"></a>
</div>
<div class="right-button">
	<div class="reportArea">
		<input type="button" value="신고관리" id="reportBtn" />
		<span class="reportCountArea">
			<span class="reportCount">0</span>
		</span>
	</div>
	<div class="withdrawArea">
		<input type="button" value="인출관리" id="withdrawBtn" /> 
		<span class="withdrawCountArea">
			<span class="withdrawCount">0</span>
		</span>
	</div>
	<div class="manageArea">
		<input type="button" value="페이지관리" id="manageBtn" />
	</div>
</div>
</div>
<hr />