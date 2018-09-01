<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<div class="service_header" id="service_header">
	<div class="menubar">
		<a href="index.do"><img src="images/logo.JPG" width="170" height="50" id="logo"></a>
	</div>
	<div class="wrap_inner">
		<div class="f">
			<div class="wrap_right_inner">
				<span class="glyphicon glyphicon-floppy-disk" id="btnSave" style="cursor: pointer"></span>
			</div>
			<div class="wrap_right_inner_in" id="wrap_right_inner_in" style="display: none">
				<span class="glyphicon glyphicon-edit" id="btn_mody" style="cursor: pointer"></span> 
				<span class="glyphicon glyphicon-ok-sign" id="btnPost" style="cursor: pointer"></span>
				<form id="postForm" method="post">
					<input type="hidden" name="board_subject" />
					<input type="hidden" name="board_content" />
					<input type="hidden" name="board_photo" />
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
					<input type="hidden" name="fileArray" />
=======
>>>>>>> 6d40ef6e12960486959e87119ec9efa6240147e9
=======
					<input type="hidden" name="fileArray" />
>>>>>>> 8225c35fc7c16b49d841d47c14ec3340bb2edb4c
=======
>>>>>>> 98aeb36bcdfc1da8895d4dfdd13318848138d6c8
=======
>>>>>>> fa720e9f01bd055e3c48ed3cb2d146aeea95247e
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
				<br /> <span class="glyphicon glyphicon-text-background" id="btn_colorChange" style="cursor: pointer"></span> 
				<br />
				<br />
				<span class="glyphicon glyphicon-trash" id="btn_delete" style="cursor: pointer"></span>
			</div>
			<div class="board_subject_wrapper">
				<div class="cover_item">
					<div class="cover_cell">
						<h1 class="cover_title" id="board_subject_cover" contenteditable="true"></h1>
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
<div class="service_body" id="service_body">
	<div id="board_content"></div>
	<div id="summernote_wrap">
		<div id="summernote" class="summernote" name="editordate"></div>
	</div>
</div>
<div class="service_footer" id="service_footer">
	<div id="hash_div">
		<!--<td><input type="text" name="board_hashtag" id="board_hashtag" size="30" maxlength=30/></td> -->
		<div class="board_hashtag" id="board_hashtag" contenteditable="true">Hashtag #moons~ #오늘의 띵작</div>
	</div>
</div>