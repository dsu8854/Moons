<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="js/adminMail.js"></script>    
<form id="mailForm" method="post">
	<input type="hidden" name="title" />
	<input type="hidden" name="content" />
</form>
<div class="mailWrap">
	<ul>
		<li><input type="text" id="mail_subject" /></li>
		<li><textarea id="mail_content"></textarea></li>
		<li><input type="button" id="sendBtn" value="보내기" />
	</ul>	
</div>