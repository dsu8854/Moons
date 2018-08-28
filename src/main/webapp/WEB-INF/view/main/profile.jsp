<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="js/profile.js"></script>
<link rel="stylesheet" href="css/profile.css">
<script src="js/timeline.js"></script>
<div class="wrap">
	<div id="main_inner">
		<div id="content">
			<div id="content_width">
				<!-- 1번째 정보칸 -->
				<div id="content_h1">
					<div>
						<!-- 아이디값 적용해야함 -->
						<p id="my_profil">${userInfo.user_id}
							<c:choose>
								<c:when test='${userInfo.user_type=="naver"}'>
									(네이버)
								</c:when>
								<c:when test='${userInfo.user_type=="kakao"}'>
									(카카오)
								</c:when>
							</c:choose>
						</p>
						<p id="user_introduce">${userInfo.user_introduce}</p>
					</div>
					<a href="#" id="my_profil_pic1">  
						<c:choose>
							<c:when test="${empty userInfo.user_photo}">
								<img class="my_image" src="images/basic.png" />
							</c:when>
							<c:otherwise>
								<img class="my_image" src="images/${userInfo.user_photo }" />
							</c:otherwise>
						</c:choose>
					</a>
				</div>

			</div>
		</div>
	</div>
</div>

<div id="container">
	<ul class="tabs">
		<li class="active" rel="tab1">프로필</li>
		<li rel="tab2">개인정보</li>
		<li rel="tab3">비밀번호변경</li>
	</ul>
	<div class="tab_container">
		<div id="tab1" class="tab_content">
			<ul>
				<li><a href="#">이것은 두 번째 탭의</a>
			</ul>
		</div>
		<!-- #tab1 -->
		<div id="tab2" class="tab_content">
			<form method="post" id="editform">
				<div id="content_h2">
					<table id="myinformation">
						<tr>
							<td id="tdone">ID</td>
							<td>${userInfo.user_id}
								<c:choose>
								<c:when test='${userInfo.user_type=="naver"}'>
									(네이버)
								</c:when>
								<c:when test='${userInfo.user_type=="kakao"}'>
									(카카오)
								</c:when>
							</c:choose>
							</td>
						</tr>
						<tr>
							<td id="tdone">e-mail</td>
							<td>${userInfo.user_email}</td>
						</tr>
						<tr>
							<td id="tdone">닉네임</td>
							<td><input type="text" value="${userInfo.user_nickname}" /></td>
						</tr>
						<tr>
							<td id="tdone">포인트</td>
							<td>${userInfo.user_point} P<a><input
									type="button" value="Point" id="chargeBtn" /></a></td>
						</tr>
						<tr>
							<td id="tdone">자기소개</td>
							<td><textarea rows="7" cols="60" name="intro">${userInfo.user_introduce}</textarea></td>
						</tr>
					</table>
					<input type="button" value="수정하기" id="editBtn" />
				</div>
			</form>
		</div>
		<!-- #tab2 -->
		<div id="tab3" class="tab_content">
			<table id="myinformation">
				<tr>
					<td id="tdone">이전비밀번호</td>
					<td><input type="password" /></td>
				</tr>
				<tr>
					<td id="tdone">새비밀번호</td>
					<td><input type="password" /></td>
				</tr>
				<tr>
					<td id="tdone">새비밀번호확인</td>
					<td><input type="password" /></td>
				</tr>
			</table>
			<input type="button" value="완료" id="passeditBtn" />
		</div>
		<!-- #tab3 -->
	</div>
	<!-- .tab_container -->
</div>
<!-- #container -->