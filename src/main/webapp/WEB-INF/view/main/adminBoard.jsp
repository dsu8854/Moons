<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src = "js/moment.js"></script>
<script src="js/adminBoard.js"></script>    
<div class="tab">
	<input type="button" value="좋아요순" id="boardLikeBtn" />
	<input type="button" value="공유순" id="boardShareBtn" />
	<input type="button" value="댓글순" id="boardReplyBtn" />
	<input type="button" value="작성일자순" id="boardDateBtn" />
</div>
<div class="boardWrap"></div>