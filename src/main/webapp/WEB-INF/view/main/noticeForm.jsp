<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="js/notice.js"></script> 
<link rel="stylesheet" href="css/notice.css">
<div id="notice_setting">
	<a href="#">설정</a>
</div>
<br/>
<div class="noticeWrap">
	<div class="notice_menu">
		<ul>
			<li>전체</li>
			<li>게시글</li>
			<li>후원</li>
		</ul>
	</div>
	<table class="notice">
	<c:forEach items="${notice_list}" var="ndto">
			<tr>
				<td>
					<img src="images/${ndto.user_photo }" />
				</td>
				<td>
					<input type="hidden" id="actor" value="${ndto.user_nickname }" />
					<input type="hidden" id="type" value="${ndto.notice_type }" />
					<input type="hidden" id="amount" value="${ndto.notice_amount }" />
					<input type="hidden" id="read" value="${ndto.notice_read }" />
					<a href="#" id="notice_content"> </a><br/>
					<span id="notice_date">${ndto.notice_date }</span>
				</td>
			</tr>
	</c:forEach>
	</table><br/>
</div>