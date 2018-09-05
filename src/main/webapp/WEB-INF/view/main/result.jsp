<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${bList}" var="bdto">
	<div class="board">
		<input type="hidden" name="bnum" value="${bdto.bnum}" />
		<div class="writer">
			<ul>
				<li><a href=""> <img src="images/profile.png" />
				</a></li>
				<li><a href=""> <span>${bdto.writer}</span>
				</a></li>
			</ul>
		</div>
		<div class="content">${bdto.content}</div>
		<div class="reply">
			<ul>
				<c:forEach items="${bdto.rList}" var="rdto" begin="0" end="4">
					<li>
						<input type="hidden" name="rnum" value="${rdto.rnum}"/>
						<p>${rdto.rwriter}&nbsp;:&nbsp;${rdto.rcontent}</p>
					</li>
				</c:forEach>
			</ul>
			<a href=""><span class="replyAdd">+더보기</span></a>
		</div>
	</div>
</c:forEach>