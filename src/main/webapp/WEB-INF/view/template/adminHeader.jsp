<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/admin.css">
<link href="css/toastr.css" type="text/css" rel="stylesheet" />
<script src="js/toastr.js"></script> 
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
	<div class="boardArea">
		<input type="button" value="게시물관리" id="boardBtn" />
	</div>
	<div class="memberArea">
		<input type="button" value="회원관리" id="memberBtn" />
	</div>
	<div class="mailArea">
		<input type="button" value="메일발송" id="mailBtn" />
	</div>
</div>
</div>
<hr />