<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link href="css/bootstrap.css" rel="stylesheet">
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="css/summernote.css" rel="stylesheet">
<script src="js/summernote.js"></script>
<script src="lang/summernote-ko-KR.js"></script>
<script src="js/write.js"></script>
<link href="css/write.css" rel="stylesheet">
		<c:choose>
			<c:when test="${empty bdto.board_photo }">
				<div class="service_header" id="service_header" style="background:url('images/back.jpg') top fixed / 100% 100%;" >
			</c:when>
			<c:when test='${fn:contains(bdto.board_photo,"http")}'>
				<div class="service_header" id="service_header" style="background:url('${bdto.board_photo}') top fixed / 100% 100%;" >
			</c:when>
			<c:otherwise>
				<div class="service_header" id="service_header" style="background:url('images/${bdto.board_photo}') top fixed / 100% 100%;" >
			</c:otherwise>
		</c:choose>

	<div class="menubar">
		<a href="index.do"><img src="images/logo.png" width="170" height="50" id="logo"></a>
	</div>
	<div class="wrap_inner">
		<div class="f">
			<div class="wrap_right_inner">
				<span class="glyphicon glyphicon-floppy-disk" id="btnSave" style="cursor: pointer"></span>
			</div>
			<div class="wrap_right_inner_in" id="wrap_right_inner_in" style="display: none">
				<span class="glyphicon glyphicon-edit" id="btn_mody" style="cursor: pointer"></span> 
				<span class="glyphicon glyphicon-ok-sign" id="btnModPost" style="cursor: pointer"></span>
				<form id="postForm" method="post">
					<input type="hidden" name="board_num" value="${bdto.board_num}"/>
					<input type="hidden" name="board_subject" />
					<input type="hidden" name="board_content" />
					<input type="hidden" name="board_photo" />
					<input type="hidden" name="board_movie" id="board_movie" value="${bdto.board_movie }" />
					<input type="hidden" name="board_hashtag" />
				</form>
			</div>
				<div class="wrap_right_inner_modi" style="display: none">
				<span class="glyphicon glyphicon-floppy-saved" id="btn_modyc" style="cursor: pointer"></span>
			</div>
		</div>
		<div class="title">
			<div class="background_img" id="background_img">
				<div class="background_upload_btn">
					<span class="glyphicon glyphicon-picture" id="upfile1" style="cursor: pointer"></span>
					<input type="file" class="header_background_img" id="header_background_img" style="display: none">
				</div>
				<br />
				<span class="glyphicon glyphicon-trash" id="btn_delete" style="cursor: pointer"></span>
			</div>
			<div class="board_subject_wrapper">
				<div class="cover_item">
					<div class="cover_cell">
						<h1 class="cover_title" id="board_subject_cover" contenteditable="true">${bdto.board_subject}</h1>
						<input type="text" name="board_subject" id="board_subject" style="display: none">
						<!-- <br>
							<div class="cover_subtitle"	 id="cover_subtitle" contenteditable="true">소제목을 입력하세요.</div>
							<input type="text" name="board_subject" id="board_subject_sub" style="display:none"> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<ul class="choiceMovieBox" id="boxON">
	<li id="choiceMovie">
		<img src="images/moviechoice.png" width="120px"/>
	</li>
	<li id="choicemovieInfo">
		영화를 선택해 주세요
	</li>
</ul>
<!-- 영화선택 -->
<div id="choiceBox">
	<div id="searchBox"><input type="text" id="searchMovie" placeholder="영화제목을 입력해주세요"/></div>
	<span class="closeBox">X</span>
	<div id="resultBox"><br/><br/><br/><br/><br/><br/><br/><br/><br/>리뷰를 남기고 싶은 영화를 클릭해 주세요</div>
</div>
<div class="service_body" id="service_body">
	<div id="board_content"></div>
	<div id="summernote_wrap">
		<div id="summernote" class="summernote" name="editordate">${bdto.board_content}</div>
	</div>
</div>
<div class="service_footer" id="service_footer">
	<div id="hash_div">
		해시태그
		<div class="board_hashtag" id="board_hashtag" contenteditable="true" data-text="ex)#천만관객">${bdto.board_hashtag}</div>
	</div>
</div>