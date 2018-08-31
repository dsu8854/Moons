<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" Content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<link href="css/reset.css" type="text/css" rel="stylesheet" />
<link href="css/index.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function() {
	//사용할 배너
	var $banner = $(".banner").find(".banner-images");
 
	var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
	var $bannerHeight = $banner.children().outerHeight(); // 높이
	var $bannerLength = $banner.children().length;//배너 이미지의 갯수
	var rollingId;
/* 
	//정해진 초마다 함수 실행
	rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차
   
	//마우스 오버시 롤링을 멈춘다.  
	$banner.mouseover(function(){
		//중지
		clearInterval(rollingId); 
		$(this).css("cursor", "pointer");
	});        
	//마우스 아웃되면 다시 시작 
	$banner.mouseout(function(){ 
		rollingId = setInterval(function() { rollingStart(); }, 3000);
		$(this).css("cursor", "default");     
	});  
	
	function rollingStart() {
		$banner.css("width", $bannerWidth * $bannerLength + "px");
		$banner.css("height", $bannerHeight + "px");
		//alert(bannerHeight);
		//배너의 좌측 위치를 옮겨 준다.
		$banner.animate({left: - $bannerWidth + "px"}, 2000, function() { //숫자는 롤링 진행되는 시간이다.
			//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
			$(this).append("<div>" + $(this).find("div:first").html() + "</div>");
			//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
			$(this).find("div:first").remove();
			//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
			$(this).css("left", 0);
			//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다. 
		});
	} */
}); 
</script>
	<div class="contents">
		<div class="banner">  
			<div class="banner-images">
				<div>
					<div>
						<div>
							<p class="imgtext" id="imgonetext">박건우최고</p>  
						<img alt="별빛이" src="images/a.jpg" width="340" height="175">
							<p class="imgtext" id="imgtwotext">박건우최고</p>    
							<img src="images/backa.jpg" width="340" height="175">
						</div>
					</div>  
				</div>    
				<div>  
					<div>
						<p class="imgtext" id="imgthreetext">박건우최고</p>    
						<img src="images/back.jpg" width="340" height="350">
					</div>
				</div>   
				<div> 
					<p class="imgtext" id="imgfourtext">박건우최고</p>
					<img src="images/backa.jpg" width="340" height="175">
					<p class="imgtext" id="imgfivetext">박건우최고</p>
					<img src="images/park2.jpg" width="340" height="175">
				</div>
				<div> 
					<p class="imgtext" id="imgsixtext">박건우최고</p>
					<img src="images/park.jpg" width="340" height="350">
				</div>
				<div>
					<p class="imgtext" id="imgseventext">박건우최고</p>
					<img src="images/park2.jpg" width="340" height="350">
				</div>
				<div>
					<p class="imgtext" id="imgeighttext">박건우최고</p>
					<img src="images/park3.jpg" width="340" height="350">
				</div>
				<div>
					<p class="imgtext" id="imgninetext">박건우최고</p>
					<img src="images/park4.jpg" width="340" height="350">
				</div>
			</div>
		</div>
		 <img id="button-previous" src="images/prev.jpg">
		<img id="button-next" src="images/next.jpg">  
	</div>
	 
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
	 
	
	<p id="recomarticle">RECOMENDED REVIEW</p>  
	<div id="recomen-box"> 
		<div id="imgone"> 
		<a href="#"><img src="images/park.jpg" width="200" height="200" /> </a> 
			<p id="title">박건우는 왜 잘생겼을까?</p>
			<p id="contents">CSS에서 글자 간격은 letter-spacing으로, 단어 간격은 word-spacing으로 정합니다.(글자 간격은 자간이라고도 합니다.)
				둘 다 기본값은 normal이고, 길이를 값으로 넣습니다. 값이 커지면 간격이 늘어나고, 값이 작아지면 간격이 줄어듭니다.
				특이한 점은 음수를 값으로 넣을 수 있다는 것입니다. 값이 음수일 때는 기본값인 normal보다 간격이 줄어들며, 값이 음수로서 아주 작자다면 글자들이 겹치기도 합니다.</p>   
		</div>
		<div id="imgtwo"> 
			<a href="#"><img src="images/park4.jpg" width="200" height="200" /></a> 
			<p id="title">나야 모르지</p>
			<p id="contents">산길을 등지며 시가지로 내려왔었다.열쇠고리를 산길에 버렸었지만, 마치 지니고 있는 것 같은 느낌이 들어서 호주머니 속으로 손을 넣었다. 산길을 등지며 시가지로 내려왔었다.열쇠고리를 산길에 버렸었지만,</p>
		</div>  
		<div id="imgthree"> 
			<a href="#"><img src="images/park3.jpg" width="200" height="200" />  </a>    
			<p id="title">부상당한 두산 박건우</p>
			<p id="contents">IT동아 강형석 기자] 연일 폭염이다. 8월 8일 기준, 최저 기온 25도 이상인 무더운 밤, 열대야는 서울 18일, 광주와 대전 19일, 여수 21일 연속 기록 중이다. 연일 기록되는 폭염은 2018년의 여름은 기록적인 폭염으로 남을 것으로 보인다. 기상청에 따르면, 전국 기상관측소 95곳 중 57곳(60%)이 역대 최고기온을 갈아치웠고, 폭염이 절정에 이른 지난 1일에는 28곳에서 최고기온 신기록을 세웠다.</p>
		</div>
		<div id="imgfour"> 
			<a href="#"><img src="images/park.jpg" width="200" height="200" />  </a>   
			<p id="title">유진이 최고</p>
			<p id="contents">가나다라 가나다라 가나다 가 나 다라 가나다라 가나다라 가ㅇ 다 가 나 다라 가나다라 가나다라 가ㅇ 다 가 나 다라 가나다라 가나다라 가ㅇ 다 가 나 다라 가나다라 가나다라 가ㅇ</p> 
		</div>
		<div id="imgfive"> 
			<a href="#"><img src="images/park4.jpg" width="200" height="200" /></a> 
			<p id="title">갸르르르르륵 르르르륵</p>
			<p id="contents">가나다라 가나다라 가나다 가 나 다라 가나다라 가나다라 가ㅇ 다 가 나 다라 가나다라 가나다라 가ㅇ 다 가 나 다라 가나다라 가나다라 가ㅇ 다 가 나 다라 가나다라 가나다라 가ㅇ</p>
		</div>  
		<div id="imgsix">  
			<a href="#"><img src="images/park3.jpg" width="200" height="200" /> </a> 
			<p id="title">박건우는 왜 잘생겼을까?</p>
			<p id="contents">가나다라 가나다라 가나다 가 나 다라 가나다라 가나다라 가ㅇ 다 가 나 다라 가나다라 가나다라 가ㅇ 다 가 나 다라 가나다라 가나다라 가ㅇ 다 가 나 다라 가나다라 가나다라 가ㅇ</p>    
		</div>
	</div>
	
	<p id="moviemagazines">MOVIE MAGAZINES</p> 
	<div id="movie-magazines-box">
		<div id="magazines-images">
			<div>
				<img alt="" src="images/moviemagazines1.jpg" width="180" height="200" />
			</div>
			<div>
				<img alt="" src="images/moviemagazines2.jpg" width="180" height="200" />
			</div>
			<div>
				<img alt="" src="images/moviemagazines3.jpg" width="180" height="200" />
			</div>
			<div>
				<img alt="" src="images/moviemagazines4.jpg" width="180" height="200" />
			</div>
			<div>
				<img alt="" src="images/moviemagazines5.jpg" width="180" height="200" />
			</div> 
		</div>    
	</div>
		
<footer id="dkFoot" class="foot_brunch">
		<div class="inner_foot">
			<div class="area_quotation">
				<q class="txt_quotation">A genius can't win one who does his best, a person who tries his best can't win the one who enjoys what he does.</q>
				<span class="txt_by">MoonS</span>
			</div>
			<ul class="list_info">
				<li><a href="about.do" target="_blank" class="link_info">About MoonS</a></li>
				<li><a href="privacy.do" target="_blank" class="link_info privacy">개인정보 처리방침</a></li>
				<li><a href="contact.do" target="_blank" class="link_info">오시는길</a></li>
			</ul>
			<small class="txt_copyright"><a href="about.do" class="link_corp" target="_blank">© MoonS Corp.</a></small>
		</div>
	</footer>