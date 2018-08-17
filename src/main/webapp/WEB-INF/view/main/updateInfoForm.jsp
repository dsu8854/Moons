<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src = "js/personInfo.js"></script>
<link rel="stylesheet" href="css/profile.css">
	<%
		request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
		//치환변수 -- 엔터키 적용
		pageContext.setAttribute("cr", "\r");	// space
		pageContext.setAttribute("cn", "\n");	// enter
		pageContext.setAttribute("crcn", "\r\n");	// space,enter
		// 굳이 enter말고 space,enter만 써도된다.
		pageContext.setAttribute("br", "<br/>");	// br태그 
		// <br/>을 space,enter로 바꿔라
	%>
<div class = wrap >
	<div id = "main_inner">
		<div id = "content">
			<div id  ="content_width">
			<!-- 1번째 정보칸 -->
			<div id = "content_h1">
				<div id ="my_profil">Moon's profil</div>
					<input type ="submit" id="my_btn1" value="수정하기" />
					<!-- <input type ="button" id="my_btn2" value="팔로잉"/>
					<input type ="button" id="my_btn3" value="팔로우"/> -->
					<input type ="button" id="back" value="뒤로"/>
						<a href="/main/profile" id = "my_profil_pic1">
							<c:set var="user_photo" value='<%=session.getAttribute("user_photo")%>'/>
							<c:choose>
								<c:when test="${empty user_photo}">
									<img class = "my_image" src = "images/basic.png"/>
								</c:when>
								<c:otherwise>
									<img class = "my_image" src = "images/${user_photo}"/>
								</c:otherwise>
							</c:choose>
						</a>
					<div class="my_profil_menu">
					<ul class="my_ul1 clearfix" data-referrer="timeline_light_nav_top" >
						<li>
							<div class="_profil_display1 _6-6 _9rx _6-7" >
								<a class="_9ry _p" href="#" id="u_0_16">
									타임라인 <img alt="타임라인" src = "../images/arrow1.png">	 	<!-- 화살표 -->
								</a>
								<ul class="list_1">
									<li><img class = "img_1" src = "../images/list_1.png" />리스트로 보기</li>
									<li><img class = "img_1" src = "../images/grid_1.png" />그리드로 보기</li>
								</ul>
								</div>
								</li>
								<li>
								<a class="_6-6"  href="#">		<!-- 간단한 개인정보 보기 -->
								정보
								<span class="_513x"></span>
								</a>
								</li>
								<li>
								<a class="_6-6"  href="#">		<!-- 친구창 이동 -->
								친구
								<span class="_gs6">86</span><!-- 친구수 표시하기 -->
								<span class="_513x"></span>
								</a>
								</li>
								<li>
								<a class="_6-6"  href="#">
								사진
								<span class="_513x"></span>
								</a>
								</li>
								
								<li>
									<div class="_6a uiPopover _6-6 _9rx _5v-0" >
										<a class="_9ry _p" href="#" id="u_0_17">
											더 보기<img alt="더보기" src = "../images/arrow1.png"/> <!-- 화살표 -->
										</a>
										<ul class="list_1">
											<li><a href = "#"><img alt="동영상" class = "img_1" src = "../images/movie.png"/>동영상</a></li>
											<li><a href = "#"><img alt="사진" class = "img_1" src = "../images/picture.png"/>사진</a></li>
											<li><a href = "#"><img alt="리뷰" class = "img_1" src = "../images/review.png"/>리뷰</a></li>
											<li><a href = "#"><img alt="평점" class = "img_1" src = "../images/grade.png"/>영화평점</a></li>
										</ul>
									</div>
								</li>
								</ul>
								</div>
			</div>
		
			<!-- 3번째 정보칸 -->
			<div id = "content_h3">
				<!-- post방식으로 정보보내기 -->	<!-- dto는 maincontroller에서 dto를 서비스프로세스를 통해 적용 -->
				<form name="frm" id="frm" method="post" enctype="multipart/form-data" > 
					<!-- personinfo로 시작하는 것들은 틀보려고 한거니까 겉 테두리를 삭제해야함 -->
					<div class="personinfo_1">
						<ul class = "personinfo_2">
							<li class = "personinfo_3">&nbsp;닉&nbsp;&nbsp;네&nbsp;&nbsp;임&nbsp;&nbsp;&nbsp;: </li>
							<li class = "personinfo_4">
								<input class = "personinfo_5" placeholder = "이름을 입력해주세요." 
							id="user_name" name="user_nickname" value = "${dto.user_nickname}"/></li>
						</ul> 
					</div>
					<div class="personinfo_1"> 
						<ul class = "personinfo_2">
							<li class = "personinfo_3">비&nbsp;밀&nbsp;번&nbsp;호&nbsp;  :</li>
							<li class = "personinfo_4">
								<input type = "password" class = "personinfo_5" placeholder = "비밀번호 최소 6자,최대 14자" 
							id ="user_pass"  maxlength="14" name="user_pass" value = "${dto.user_pass}"/></li>
							
						</ul>
					</div>
					<div class="personinfo_1"> 
						<ul class = "personinfo_2">
							<li class = "personinfo_3">&nbsp;&nbsp;이&nbsp;&nbsp;메&nbsp;&nbsp;일&nbsp;&nbsp;:</li>
							<li class = "personinfo_4">
									<input class = "personinfo_5" placeholder = "이메일을 입력해주세요." 
									id ="user_email" name="user_email" value = "${dto.user_email}"/></li>
						</ul> 
					</div>
					
					<div class="personinfo_1"> 
						<ul class = "personinfo_2">
							<li class = "personinfo_3">자&nbsp;기&nbsp;소&nbsp;개 &nbsp;: </li>
							<li class = "personinfo_4">
								<input class = "personinfo_5" placeholder = "자기소개를 입력해주세요." 
								id ="user_introduce" name="user_introduce" value = "${dto.user_introduce}"/></li>
						</ul> 
					</div>
					
					<div class="personinfo_1"> 
						<ul class = "personinfo_2">
							<li class = "personinfo_3">프로필 사진 : </li>
							<li class = "personinfo_4">
								<input type = "file"  id ="user_photo" name="filename" />
								<span>${fn:substringAfter(dto.user_photo, "_") }</span>
							</li>
						</ul> 
					</div>
					<div class="personinfo_1">
						<ul class = "personinfo_2">
							<li class = "personinfo_3">알림 &nbsp;설정 &nbsp; : </li>
							<li class = "personinfo_4">
									<label class = "list_3">좋아요</label><input type ="checkbox" class = "select_info1" id="select_1" value="좋아요" >
									<label class = "list_3">리플</label><input type ="checkbox" class = "select_info1" id="select_2" value="리플" >
									<label class = "list_3">팔로잉</label><input type ="checkbox" class = "select_info1" id="select_3" value="팔로잉" />
									<label class = "list_3">후원</label><input type ="checkbox" class = "select_info1" id="select_4" value="후원" />
									<label class = "list_3">태그</label><input type ="checkbox" class = "select_info1" id="select_5" value="태그" />
								<div><label class = "list_4">모두선택</label><input type = "checkbox" class = "select_info1" value = "모두선택" id = "select_all"></div>	
							</li>
							
						</ul>
					</div>
				</form>
			</div>
			<div class="alert_1">
					이 기본 정보(이름,비밀번호,전화번호,이메일,주소)를 관리하여 다른 사용자가 나를 더 간편하게 찾고 연락할
						수 있게 합니다.	
			</div>
		</div>
	</div>
</div>
</div>