<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src = "js/profile.js"></script>
<link rel="stylesheet" href="css/profile.css">
<div class = wrap >
	<div id = "main_inner">
		<div id = "content">
			<div id  ="content_width">
			<!-- 1번째 정보칸 -->
			<div id = "content_h1">
					<!-- 아이디값 적용해야함 -->
				<div id ="my_profil"><%-- "${id}"  --%>profil</div>
					<form name ="my_frm1" id="my_frm1" method="POST">
					<input type ="button" id="my_btn1" value="수정하기" />
					<input type ="button" id="my_btn2" value="팔로워"/>
					<input type ="button" id="my_btn3" value="팔로우"/>
					<!-- <input type ="button" id="back" value ="뒤로"/> -->
					</form>					
						<a href="#" id="my_profil_pic1">
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
									타임라인 <img alt="타임라인" src = "images/arrow1.png">	 	<!-- 화살표 -->
								</a>
								<ul class="list_1 _list_post">
									<li><img class = "img_1" src = "images/list_1.png" />리스트로 보기</li>
									<li><img class = "img_1" src = "images/grid_1.png" />그리드로 보기</li>
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
								<a class="_6-6"  href="#">
								<img alt="보관함" src="images/lock_1.png">
								보관함
								<span class="_513x"></span>
								</a>
								</li>
								<li>
									<div class="_6a uiPopover _6-6 _9rx _5v-0" >
										<a class="_9ry _p" href="#" id="u_0_17">
											더 보기<img alt="더보기" src = "images/arrow1.png"/> <!-- 화살표 -->
										</a>
										<ul class="list_1">
											<li><a href = "#"><img alt="동영상" class = "img_1" src = "images/movie.png"/>동영상</a></li>
											<li><a href = "#"><img alt="사진" class = "img_1" src = "images/picture.png"/>사진</a></li>
											<li><a href = "#"><img alt="리뷰" class = "img_1" src = "images/review.png"/>리뷰</a></li>
											<li><a href = "#"><img alt="평점" class = "img_1" src = "images/grade.png"/>영화평점</a></li>
										</ul>
									</div>
								</li>
								</ul>
								</div>
			</div>
					<!-- 3번째 정보칸 -->
					<div id = "content_h3">
					<!--<div id = "contentstyle="margin-top:20px;  margin-bottom:20px; text-align: center;  "> 내용 적기 </div> -->					
						
					
					</div>
			</div>
		</div>
	</div>
</div>