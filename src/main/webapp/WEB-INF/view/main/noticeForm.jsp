<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="js/notice.js"></script> 
<link rel="stylesheet" href="css/notice.css">
<div class="noticeWrap">
	<table class="notice">
		<c:forEach items="${notice_list}" var="ndto">
			<tr>
				<td>
					<img src="images/${ndto.user_photo }" />
				</td>
				<td>
					<input type="hidden" id="user_code" value="${ndto.notice_actor }" />
					<input type="hidden" id="my_code" value="${ndto.user_code }" />
					<input type="hidden" id="actor" value="${ndto.user_nickname }" />
					<input type="hidden" id="type" value="${ndto.notice_type }" />
					<input type="hidden" id="board_num" value="${ndto.board_num }" />
					<input type="hidden" id="amount" value="${ndto.notice_amount }" />
					<input type="hidden" id="read" value="${ndto.notice_read }" />
					<a href="" id="notice_content"> </a><br/>
					<fmt:formatDate value="${ndto.notice_date }" pattern="yyyy-M-dd HH:MM:SS" var="noticeDate" />
					<span id="notice_date">${noticeDate }</span>
				</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
</div>