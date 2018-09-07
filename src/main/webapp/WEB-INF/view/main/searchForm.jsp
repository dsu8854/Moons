<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/search.js"></script>
<link rel="stylesheet" href="css/search.css">
</head>
<body>
	<input type="hidden" id="searchVal" value="${search }" />
	<input type="hidden" id="typeVal" value="${type }" />
	<input type="hidden" id="prevLoc" value="${preloc }" />
	<div id="suggest">
		<dl>
			<dt id="suggestMovieSubject">영화</dt>
			<dd id="suggestMovie"></dd>
			<dt id="suggestUserSubject">유저</dt>
			<dd id="suggestUser"></dd>
		</dl>
	</div>
	
	<div class="searchMenu">
			<ul>
				<li value="movie">영화</li>
				<li value="director">감독</li>
				<li value="user">유저</li>
			</ul>
		</div>
	<div id="searchWrap">
		
	</div>
</body>
</html>