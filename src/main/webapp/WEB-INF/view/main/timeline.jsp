<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="css/timeline.css">
<!-- 미옥추가css -->
<script src="js/timeline.js"></script>
<div class="wrap">
	<c:forEach items="${bList}" var="dto">
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
						<%-- <img src="images/${dto.user_photo }" class="img_writer" alt="">${dto.user_nickname } --%>
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
					<a href="상세글보기이동?board_num=${dto.board_num }" class="link_detail" target="_blank">
						<div class="content_title">${dto.board_subject }</div>
						<p class="content_line">${dto.board_content }</p>
					</a> <a href="상세글보기이동?board_num=${dto.board_num }" class="more">더보기</a>
				</div>
			</div>

			<div class="card_page2">
				<a href="상세글보기이동?board_num=${dto.board_num }" class="detail_view"
					target="_blank"><img src="images/cover1.jpg" class="cover_img"
					alt=""></a>
			</div>

			<div class="card_page3">
				<div class="area_taging">
					<c:set var="totalTag" value="${fn:split(dto.board_hashtag,',') }" />
					<c:forEach items="${totalTag }" var="resTag" begin="0"
						end="${fn:length(totalTag) }">
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