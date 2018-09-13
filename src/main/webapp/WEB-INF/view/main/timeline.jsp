<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src = "js/moment.js"></script>
<script src="js/timeline.js"></script>
<link rel="stylesheet" href="css/timeline.css">

<div class="timelineWrap">
	<div id = "main_inner">
		<div id = "content">
			<div id  ="content_width">
			<!-- 1번째 정보칸 -->
				<div id = "content_h1"> 
					<a href="#" id="my_profile_pic1">
   	         			<c:choose>
   	                     	<c:when test="${empty userInfo.user_photo }">
   	                        	<img class = "my_image" src = "images/basic.png"/>
   	                     	</c:when>
   	                     	<c:otherwise>
   	                        	<img class = "my_image" src = "images/${userInfo.user_photo}"/>
   	                     	</c:otherwise>
   	                  	</c:choose>
   	             	</a>
   	             	<!-- 아이디값 적용해야함 -->    
   	             	<form id="profileForm" method="post">
   	             		<c:set var="user_code" value='<%=session.getAttribute("user_code")%>' />
   	             		<input type="hidden" name="user_code" value="${userInfo.user_code }" />
   	                	<div id="user_id-box"> 
   	                		<p id ="user_id">${userInfo.user_nickname}&nbsp;@${userInfo.user_id} &nbsp;&nbsp;
   	                		<c:choose>
								<c:when test="${user_code==userInfo.user_code}">
   		                			<input type="button" value="프로필 편집" id="profileBtn"/>     
	   	                		</c:when>   	                		
	   	             			<c:otherwise>
   		             				<input type="button" value="메세지보내기" id="dmBtn" />
   		             				<c:choose>
                                    	<c:when test="${!followCheck}">
                                        	<input type="button" value="팔로우" id="followApplyBtn" />
                                     	</c:when>
                                     	<c:otherwise>
                                        	<input type="button" value="언팔로우" id="followDeleteBtn" />
                                     	</c:otherwise>
									</c:choose>
	   	             			</c:otherwise>
   	             			</c:choose>
   	                		</p>
   	                	</div>
   	                	<div id="button-box">
   	       		         	<p><input type ="button" id="postCount" value="게시물  ${userInfo.postCount} "/></p>
							<p><input type ="button" id="followListBtn" value="팔로잉  ${userInfo.followCount}"/></p>
							<p><input type ="button" id="followerListBtn" value="팔로워  ${userInfo.followerCount}"/></p>
						</div>
   	            	</form>
   	            	<form id="followForm" method="post">
						<input type="hidden" name="follow_following" value="${userInfo.user_code }" />
					</form>
   	            	<form id="dmForm" method="post">
   	            		<input type="hidden" name="dm_receiver" value="${userInfo.user_code }" />
   	            	</form>
   	             	<p id="user_introduce">${userInfo.user_introduce}</p>
   	     		</div>
			</div>
		</div>	
		<!-- 3번째 정보칸 -->
		<div id = "content_h3">
			<div class="my_profile_menu">
					<div id = "view_clear" >
						<button id="my_review">내 글</button>
						<c:if test="${userInfo.user_code==user_code}">
							<button id="scrap_review">스크랩</button>
							<button id="like_review">좋아요</button>
						</c:if>
					</div>
				<button id="list_view" value="list"><img class = "img_1" src = "images/list_1.png" />리스트</button>
				<button id="grid_view" value="grid"><img class = "img_1" src = "images/grid_1.png" />그리드</button>
			</div>				
  			<div class="content_h3_wrap"></div>
			<div class="board_grid_wrap"></div>
		</div>		
	</div>
</div>