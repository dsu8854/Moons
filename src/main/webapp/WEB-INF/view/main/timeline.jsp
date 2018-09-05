<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src = "js/timeline2.js"></script>
<script src="js/timeline.js"></script>
<link rel="stylesheet" href="css/timeline2.css">
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
   	             		<input type="hidden" name="user_code" value="${userInfo.user_code}"/>
   	                	<div id ="user_id">${userInfo.user_id} 
   	                		<c:if test="${user_code==userInfo.user_code}">
   	                			<input type="button" value="프로필 편집" id="profileBtn"/> 
   	                		</c:if>
   	                	</div>
   	                	<div id="button-box">
   	       		         	<div><input type ="button" id="postCount" value="게시물  ${postCount} "/></div>
							<div><input type ="button" id="followListBtn" value="팔로잉  ${following}"/></div>
							<div><input type ="button" id="followerListBtn" value="팔로워  ${follower}"/></div>
						</div>
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
					<button id="scrap_review">스크랩</button>
					<button id="like_review">좋아요</button>
				</div>
					<button id="list_view" value="list"><img class = "img_1" src = "images/list_1.png" />리스트</button>
					<button id="grid_view" value="grid"><img class = "img_1" src = "images/grid_1.png" />그리드</button>				
			</div>		
  			<div class="content_h3_wrap" id="myWriteList"> 
  			<c:forEach items="${bList}" var="dto" >
					<div class="board_card">
						<div class="card_page1">
							<div class="card_head">
								<a href="작성자페이지" class="card_writer"> 
									<c:choose>
										<c:when test="${empty dto.user_photo}">
											<img src="images/basic.png" class="img_writer" alt=""/>
										</c:when>
										<c:otherwise>
											<img src="images/${dto.user_photo}" class="img_writer" alt=""/>
										</c:otherwise>
									</c:choose>
									${dto.user_nickname }
								</a>
								<!-- 작성날짜 작업을 위한 부분 -->
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="nowDate" />
								<fmt:formatDate value="${now }" pattern="HH" var="nowHour" />
								<fmt:formatDate value="${now }" pattern="mm" var="nowMin" />
								<fmt:formatDate value="${dto.board_date }" pattern="yyyy-MM-dd" var="boardDate" />
								<fmt:formatDate value="${dto.board_date }" pattern="HH" var="boardHour" />
								<fmt:formatDate value="${dto.board_date }" pattern="mm" var="boardMin" />
								<c:choose>
									<c:when test="${boardDate == nowDate }">
										<!-- 당일 작성한 글일 경우 ㅇㅇ전에 작성한 글이라고 표시함 -->
										<c:if test="${boardHour == nowHour }">
											<!-- 작성시가 현재시와 동일하면 몇분전에 작성한 글인지 표시 -->
											<span class="write_date">${nowMin-boardMin}분전</span>
										</c:if>
										<c:if test="${boardHour != nowHour }">
											<!-- 작성시가 현재시와 다를 경우 몇시간 전에 작성한 글인지 표시 -->
											<span class="write_date">${nowHour-boardHour }시간전</span>
										</c:if>
									</c:when>
									<c:otherwise>
										<!-- 하루이상 지난 글일 경우 날짜로 표시함 -->
										<span class="write_date">${boardDate }</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="content_part">
								<!-- 상세페이지로 이동할 때 해당하는 글번호를 파라미터로 넘김 -->
								<a href="timelineDetail.do?board_num=${dto.board_num }" class="link_detail">
									<div class="content_title">${dto.board_subject }</div>
									<p class="content_line">${dto.board_content}</p>
								</a> <a href="timelineDetail.do?board_num=${dto.board_num }" class="more">더보기</a>
							</div>
						</div>
						<div class="card_page2">
							<a href="timelineDetail.do?board_num=${dto.board_num }" class="detail_view">
								<c:choose>
									<c:when test="${empty dto.board_photo }">
										<img src="images/back.jpg" class="cover_img" alt="">
									</c:when>
									<c:otherwise>
										<img src="images/${dto.board_photo }" class="cover_img" alt="">
									</c:otherwise>
								</c:choose>
							</a>
						</div>
						<div class="card_page3">
							<div class="area_taging">
								<c:set var="totalTag" value="${fn:split(dto.board_hashtag,',') }" />
								<c:forEach items="${totalTag }" var="resTag" begin="0" end="${fn:length(totalTag) }">
									<span><a href="태그이동페이지" class="txt_taging">#${resTag }</a></span>
								</c:forEach>
							</div>
							<div class="content_write">
								<span class="like_icon icon_link">
									<form id="likeForm" method="post">
										<input type="hidden" id="isLike" name="isLike" value="${dto.isLike}" />
										<input type="hidden" name="board_num" value="${dto.board_num}" />
									</form>
									<c:choose>
										<c:when test="${dto.isLike}">
											<img src="images/like1.png" class="icon_img">
										</c:when>
										<c:otherwise>
											<img src="images/like2.png" class="icon_img">
										</c:otherwise>
									</c:choose>
									<span id="likecnt">${dto.board_like }</span>
								</span>
								<span class="comment_icon content_icon">
									<a href="댓글페이지이동" class="icon_link">
										<img src="images/comment1.png" class="icon_img">
										<img src="images/comment2.png" class="icon_img">${dto.board_reply }
									</a>
								</span> 
								<span class="share_icon icon_link">
									<form id="shareForm" method="post">
										<input type="hidden" id="isShare" name="isShare" value="${dto.isShare}" />
										<input type="hidden" name="board_num" value="${dto.board_num}" />
									</form>
									<c:choose>
										<c:when test="${dto.isShare}">
											<img src="images/share1.png" class="icon_img">
										</c:when>
										<c:otherwise>
											<img src="images/share2.png" class="icon_img">
										</c:otherwise>
									</c:choose>
									<span id="sharecnt">${dto.board_share }</span>
								</span>
							</div>
						</div>
					</div>
				</c:forEach>
				</div>
				<div class="content_h3_wrap" id="scrapList">
					<c:forEach items="${listScrap}" var="dto" >
					<div class="board_card">
						<div class="card_page1">
							<div class="card_head">
								<a href="작성자페이지" class="card_writer"> 
									<c:choose>
										<c:when test="${empty dto.user_photo}">
											<img src="images/basic.png" class="img_writer" alt=""/>
										</c:when>
										<c:otherwise>
											<img src="images/${dto.user_photo}" class="img_writer" alt=""/>
										</c:otherwise>
									</c:choose>
									${dto.user_nickname}
								</a>
								<!-- 작성날짜 작업을 위한 부분 -->
								<jsp:useBean id="now1" class="java.util.Date" />
								<fmt:formatDate value="${now1 }" pattern="yyyy-MM-dd" var="nowDate" />
								<fmt:formatDate value="${now1 }" pattern="HH" var="nowHour" />
								<fmt:formatDate value="${now1 }" pattern="mm" var="nowMin" />
								<fmt:formatDate value="${dto.board_date }" pattern="yyyy-MM-dd" var="boardDate" />
								<fmt:formatDate value="${dto.board_date }" pattern="HH" var="boardHour" />
								<fmt:formatDate value="${dto.board_date }" pattern="mm" var="boardMin" />
								<c:choose>
									<c:when test="${boardDate == now1Date }">
										<!-- 당일 작성한 글일 경우 ㅇㅇ전에 작성한 글이라고 표시함 -->
										<c:if test="${boardHour == now1Hour }">
											<!-- 작성시가 현재시와 동일하면 몇분전에 작성한 글인지 표시 -->
											<span class="write_date">${now1Min-boardMin}분전</span>
										</c:if>
										<c:if test="${boardHour != now1Hour }">
											<!-- 작성시가 현재시와 다를 경우 몇시간 전에 작성한 글인지 표시 -->
											<span class="write_date">${now1Hour-boardHour }시간전</span>
										</c:if>
									</c:when>
									<c:otherwise>
										<!-- 하루이상 지난 글일 경우 날짜로 표시함 -->
										<span class="write_date">${boardDate }</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="content_part">
								<!-- 상세페이지로 이동할 때 해당하는 글번호를 파라미터로 넘김 -->
								<a href="timelineDetail.do?board_num=${dto.board_num }" class="link_detail">
									<div class="content_title">${dto.board_subject }</div>
									<p class="content_line">${dto.board_content}</p>
								</a> <a href="timelineDetail.do?board_num=${dto.board_num }" class="more">더보기</a>
							</div>
						</div>
						<div class="card_page2">
							<a href="timelineDetail.do?board_num=${dto.board_num }" class="detail_view">
								<c:choose>
									<c:when test="${empty dto.board_photo }">
										<img src="images/back.jpg" class="cover_img" alt="">
									</c:when>
									<c:otherwise>
										<img src="images/${dto.board_photo }" class="cover_img" alt="">
									</c:otherwise>
								</c:choose>
							</a>
						</div>
						<div class="card_page3">
							<div class="area_taging">
								<c:set var="totalTag" value="${fn:split(dto.board_hashtag,',') }" />
								<c:forEach items="${totalTag }" var="resTag" begin="0" end="${fn:length(totalTag) }">
									<span><a href="태그이동페이지" class="txt_taging">#${resTag }</a></span>
								</c:forEach>
							</div>
							<div class="content_write">
								<span class="like_icon icon_link">
									<form id="likeForm" method="post">
										<input type="hidden" id="isLike" name="isLike" value="${dto.isLike}" />
										<input type="hidden" name="board_num" value="${dto.board_num}" />
									</form>
									<c:choose>
										<c:when test="${dto.isLike}">
											<img src="images/like1.png" class="icon_img">
										</c:when>
										<c:otherwise>
											<img src="images/like2.png" class="icon_img">
										</c:otherwise>
									</c:choose>
									<span id="likecnt">${dto.board_like }</span>
								</span>
								<span class="comment_icon content_icon">
									<a href="댓글페이지이동" class="icon_link">
										<img src="images/comment1.png" class="icon_img">
										<img src="images/comment2.png" class="icon_img">${dto.board_reply }
									</a>
								</span> 
								<span class="share_icon icon_link">
									<form id="shareForm" method="post">
										<input type="hidden" id="isShare" name="isShare" value="${dto.isShare}" />
										<input type="hidden" name="board_num" value="${dto.board_num}" />
									</form>
									<c:choose>
										<c:when test="${dto.isShare}">
											<img src="images/share1.png" class="icon_img">
										</c:when>
										<c:otherwise>
											<img src="images/share2.png" class="icon_img">
										</c:otherwise>
									</c:choose>
									<span id="sharecnt">${dto.board_share }</span>
								</span>
							</div>
						</div>
					</div>
				</c:forEach>
				
				</div>
				<div class="content_h3_wrap" id="likeList"> 
				
				<c:forEach items="${listLike}" var="dto" >
				
					<div class="board_card">
						<div class="card_page1">
							<div class="card_head">
								<a href="작성자페이지" class="card_writer"> 
									<c:choose>
										<c:when test="${empty dto.user_photo}">
											<img src="images/basic.png" class="img_writer" alt=""/>
										</c:when>
										<c:otherwise>
											<img src="images/${dto.user_photo}" class="img_writer" alt=""/>
										</c:otherwise>
									</c:choose>
									${dto.user_nickname }
								</a>
								<!-- 작성날짜 작업을 위한 부분 -->
								<jsp:useBean id="now2" class="java.util.Date" />
								<fmt:formatDate value="${now2 }" pattern="yyyy-MM-dd" var="nowDate" />
								<fmt:formatDate value="${now2 }" pattern="HH" var="nowHour" />
								<fmt:formatDate value="${now2 }" pattern="mm" var="nowMin" />
								<fmt:formatDate value="${dto.board_date }" pattern="yyyy-MM-dd" var="boardDate" />
								<fmt:formatDate value="${dto.board_date }" pattern="HH" var="boardHour" />
								<fmt:formatDate value="${dto.board_date }" pattern="mm" var="boardMin" />
								<c:choose>
									<c:when test="${boardDate == now2Date }">
										<!-- 당일 작성한 글일 경우 ㅇㅇ전에 작성한 글이라고 표시함 -->
										<c:if test="${boardHour == now2Hour }">
											<!-- 작성시가 현재시와 동일하면 몇분전에 작성한 글인지 표시 -->
											<span class="write_date">${now2Min-boardMin}분전</span>
										</c:if>
										<c:if test="${boardHour != now2Hour }">
											<!-- 작성시가 현재시와 다를 경우 몇시간 전에 작성한 글인지 표시 -->
											<span class="write_date">${now2Hour-boardHour }시간전</span>
										</c:if>
									</c:when>
									<c:otherwise>
										<!-- 하루이상 지난 글일 경우 날짜로 표시함 -->
										<span class="write_date">${boardDate }</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="content_part">
								<!-- 상세페이지로 이동할 때 해당하는 글번호를 파라미터로 넘김 -->
								<a href="timelineDetail.do?board_num=${dto.board_num }" class="link_detail">
									<div class="content_title">${dto.board_subject }</div>
									<p class="content_line">${dto.board_content}</p>
								</a> <a href="timelineDetail.do?board_num=${dto.board_num }" class="more">더보기</a>
							</div>
						</div>
						<div class="card_page2">
							<a href="timelineDetail.do?board_num=${dto.board_num }" class="detail_view">
								<c:choose>
									<c:when test="${empty dto.board_photo }">
										<img src="images/back.jpg" class="cover_img" alt="">
									</c:when>
									<c:otherwise>
										<img src="images/${dto.board_photo }" class="cover_img" alt="">
									</c:otherwise>
								</c:choose>
							</a>
						</div>
						<div class="card_page3">
							<div class="area_taging">
								<c:set var="totalTag" value="${fn:split(dto.board_hashtag,',') }" />
								<c:forEach items="${totalTag }" var="resTag" begin="0" end="${fn:length(totalTag) }">
									<span><a href="태그이동페이지" class="txt_taging">#${resTag }</a></span>
								</c:forEach>
							</div>
							<div class="content_write">
								<span class="like_icon icon_link">
									<form id="likeForm" method="post">
										<input type="hidden" id="isLike" name="isLike" value="${dto.isLike}" />
										<input type="hidden" name="board_num" value="${dto.board_num}" />
									</form>
									<c:choose>
										<c:when test="${dto.isLike}">
											<img src="images/like1.png" class="icon_img">
										</c:when>
										<c:otherwise>
											<img src="images/like2.png" class="icon_img">
										</c:otherwise>
									</c:choose>
									<span id="likecnt">${dto.board_like }</span>
								</span>
								<span class="comment_icon content_icon">
									<a href="댓글페이지이동" class="icon_link">
										<img src="images/comment1.png" class="icon_img">
										<img src="images/comment2.png" class="icon_img">${dto.board_reply }
									</a>
								</span> 
								<span class="share_icon icon_link">
									<form id="shareForm" method="post">
										<input type="hidden" id="isShare" name="isShare" value="${dto.isShare}" />
										<input type="hidden" name="board_num" value="${dto.board_num}" />
									</form>
									<c:choose>
										<c:when test="${dto.isShare}">
											<img src="images/share1.png" class="icon_img">
										</c:when>
										<c:otherwise>
											<img src="images/share2.png" class="icon_img">
										</c:otherwise>
									</c:choose>
									<span id="sharecnt">${dto.board_share }</span>
								</span>
							</div>
						</div>
					</div>
					
				</c:forEach>
				
			</div>
			
			
			
		</div>
		<!-- 리스트뷰 -->
		
		<div class="board_grid_wrap" id="myWriteGrid">
			<c:forEach items="${bGrid}" var="gridview">			<!-- 보드 값 받고 -->
				<a href="timelineDetail.do?board_num=${gridview.board_num }" class="link_detail">
					<c:choose>											
						<c:when test="${empty gridview.board_photo}">	<!--  사진값 없으면  -->
							<div class="board_grid" style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/back.jpg); background-position: center; background-repeat: no-repeat; background-size: cover;" >
								<!-- <div class="board_background"></div> -->
								<div class="board_subject">${gridview.board_subject}</div>						
							</div>
						</c:when>
						<c:otherwise>
							<div class="board_grid" style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/${gridview.board_photo}); background-position: center; background-repeat: no-repeat; background-size: cover;" >
								<div class="board_subject">${gridview.board_subject}</div>							
							</div>
						</c:otherwise>
					</c:choose>
				</a>
			</c:forEach>		
		</div>	
		<div class="board_grid_wrap" id ="scrapGrid">
			<c:forEach items="${gridScrap}" var="gridview">			<!-- 보드 값 받고 -->
				<a href="timelineDetail.do?board_num=${gridview.board_num }" class="link_detail">
					<c:choose>											
						<c:when test="${empty gridview.board_photo}">	<!--  사진값 없으면  -->
							<div class="board_grid" style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/back.jpg); background-position: center; background-repeat: no-repeat; background-size: cover;" >
								<!-- <div class="board_background"></div> -->
								<div class="board_subject">${gridview.board_subject}</div>						
							</div>
						</c:when>
						<c:otherwise>
							<div class="board_grid" style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/${gridview.board_photo}); background-position: center; background-repeat: no-repeat; background-size: cover;" >
								<div class="board_subject">${gridview.board_subject}</div>							
							</div>
						</c:otherwise>
					</c:choose>
				</a>
			</c:forEach>		
		</div>	
		<div class="board_grid_wrap" id ="likeGrid">
			<c:forEach items="${gridLike}" var="gridview">			<!-- 보드 값 받고 -->
				<a href="timelineDetail.do?board_num=${gridview.board_num }" class="link_detail">
					<c:choose>											
						<c:when test="${empty gridview.board_photo}">	<!--  사진값 없으면  -->
							<div class="board_grid" style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/back.jpg); background-position: center; background-repeat: no-repeat; background-size: cover;" >
								<!-- <div class="board_background"></div> -->
								<div class="board_subject">${gridview.board_subject}</div>						
							</div>
						</c:when>
						<c:otherwise>
							<div class="board_grid" style="background: linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.3)), url(images/${gridview.board_photo}); background-position: center; background-repeat: no-repeat; background-size: cover;" >
								<div class="board_subject">${gridview.board_subject}</div>							
							</div>
						</c:otherwise>
					</c:choose>
				</a>
			</c:forEach>		
		</div>	
			
	</div>
</div>