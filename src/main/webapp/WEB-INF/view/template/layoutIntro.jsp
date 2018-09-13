<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<link rel="shortcut icon" href="images/moons.ico">
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/commonIntro.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%-- <script src="js/socket.js"></script>
<script>
$(document).ready(function(){
	webSocket = new WebSocket("ws://localhost:8090/moons/"+<tiles:getAsString name='socket' />+".do");
}) 
</script> --%>
</head>
<body>
	<section>
		<tiles:insertAttribute name="body" />
	</section>
</body>
</html>