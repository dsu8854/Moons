<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<c:forEach items="${rList}" var="rdto" begin="0" end="4">
	<li>
		<input type="hidden" name="rnum" value="${rdto.rnum}"/>
		<p>${rdto.rwriter}&nbsp;:&nbsp;${rdto.rcontent}</p>
	</li>
</c:forEach>