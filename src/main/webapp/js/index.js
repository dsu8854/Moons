$(document).ready(function(){
	$('#square-box td').on('click',function(){
		var genre=$(this).text();
		console.log(genre);
		$('#searchFrm #searchLoc').val('index.do?genre='+genre);
		console.log($('#searchFrm #searchLoc').val());
		$('#searchFrm').submit();
	});
});


/*
<p id="keywordfont">MOONS KEYWORD</p>
	<div class="keyword-box">
		<div id="square-box">
			<table>
				<tr><td><a href="">로맨스</a></td><td><a href="">판타지</a></td><td><a href="">액션</a></td><td><a href="">코미디</a></td><td><a href="">에로</a></td><td><a href="">단편</a></td><td><a href="">다큐멘터리</a></td></tr>
				<tr><td><a href="">청춘</a></td><td><a href="">호러</a></td><td><a href="">드라마</a></td><td><a href="">SF</a></td><td><a href="">범죄</a></td><td><a href="">역사</a></td><td><a href="">뮤지컬</a></td></tr>
				<tr><td><a href="">반전</a></td><td><a href="">모험</a></td><td><a href="">애니메이션</a></td><td><a href="">미스터리</a></td><td><a href="">괴수</a></td><td><a href="">스포츠</a></td><td><a href="">예술</a></td></tr>    
			</table>
		</div> 
	</div>

*/