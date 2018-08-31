<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<body>
	<meta property="fb:pages" content="1641311652800771">
<meta name="google-site-verification" content="vTM0gmeRzJwn1MIM1LMSp3cxP_SaBzch1ziRY255RHw">	
	<meta name="google-site-verification" content="5yOe6b_e_3rr7vNDwgXJw_8wLZQGx4lJ_V48KNPrqkA">
	<meta name="naver-site-verification" content="c133e28e1d79a8a0065dbf85c295b46aa3148a26">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>씨네21</title>
	<link rel="stylesheet" type="text/css" media="all" href="css/ranking.css">
	<link rel="stylesheet" type="text/css" media="all" href="/inc/www/css/content.css">
	<script src="https://securepubads.g.doubleclick.net/gpt/pubads_impl_rendering_241.js"></script><script type="text/javascript" async="" src="http://www.google-analytics.com/plugins/ua/linkid.js"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script async="" charset="utf-8" src="//static.dable.io/dist/plugin.min.js"></script><script src="https://pagead2.googlesyndication.com/pagead/js/r20180820/r20180604/osd.js"></script><script src="https://pagead2.googlesyndication.com/pub-config/r20160913/ca-pub-8062917911534035.js"></script><script type="text/javascript" async="" defer="" src="//on.issue.cine21.com/piwik/piwik.js"></script><script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<meta name="keywords" content="씨네21, 영화, 전문가 평점 , 최신 영화 정보, 영화추천, 시사회, 영화제, 박스오피스, 개봉예정작, movie, 한국영화, 예매, 예스24, 잡지, 영화배우, 감독, 매거진, 리뷰, 별점, 이동진, 김혜리, 박평식, 영화순위">
	<link rel="canonical" href="http://www.cine21.com">
	<meta name="description" content="대한민국 최고 영화전문매체 씨네21은 최신영화 정보, 전문가 평점, 박스오피스 영화, 시사회 이벤트 정보 등 최다 영화 관련 기사와 정보를 제공합니다.">
	<script type="text/javascript" src="//static.criteo.net/js/ld/publishertag.js"></script>
	<meta property="og:type" content="website">
	<meta property="og:title" content="씨네21">
	<meta property="og:description" content="대한민국 최고 영화전문매체">
	<meta property="og:image" content="http://image.cine21.com/www1/common/cine21_logoicon.jpg">
	<meta property="og:url" content="http://www.cine21.com/rank/boxoffice/domestic">

	<link rel="stylesheet" href="/inc/ext/jqueryui/jquery-ui.css">
	<script type="text/javascript" src="/inc/ext/jqueryui/jquery-ui.js"></script>


	<script src="/inc/ext/placeholder/jquery.placeholder.js"></script>

	<script src="js/ranking.js"></script>
	<script src="/inc/www/js/search.js"></script>
	

<!-- Matomo -->
<script type="text/javascript">
  var _paq = _paq || [];
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//on.issue.cine21.com/piwik/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', '1']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<!-- End Matomo Code -->


<link rel="preload" href="https://adservice.google.co.kr/adsid/integrator.js?domain=www.cine21.com" as="script"><script type="text/javascript" src="https://adservice.google.co.kr/adsid/integrator.js?domain=www.cine21.com"></script><link rel="preload" href="https://adservice.google.com/adsid/integrator.js?domain=www.cine21.com" as="script"><script type="text/javascript" src="https://adservice.google.com/adsid/integrator.js?domain=www.cine21.com"></script><script src="https://www.googletagservices.com/tag/js/gpt.js"></script><script src="https://securepubads.g.doubleclick.net/gpt/pubads_impl_241.js" async=""></script><link rel="prefetch" href="http://tpc.googlesyndication.com/safeframe/1-0-29/html/container.html">
<div id="container">
				<div class="lnb_area">
			<p class="lnb_title"></p>
			<ul id="lnb">
				<li style="width:33.3%">
					<a href="/rank/boxoffice" class="on">
						<span>영화 박스오피스</span>
					</a>
				</li>
				<li style="width:33.3%">
					<a href="/rank/person" class="">
						<span>인물 랭킹</span>
					</a>
				</li>
				<li style="width:33.3%">
					<a href="/rank/news" class="">
						<span>기사 랭킹</span>
					</a>
				</li>
			</ul>
		</div>		<script>
function fetch_list(page){
	var p = {
		page : page,
		genre : $('#data_genre').find('.on').attr('data-r'),
		period : $('#data_period').find('.on').attr('data-r')
	};
	$.post('/rank/boxoffice/domestic_content', p, function(d){
		$('#boxoffice_list_content').html(d);
	});
}


$(function(){
	$('ul.search_option a').click(function(e){
		if($(this).hasClass('.on')) return;
		$(this).parent().find('.on').removeClass('on');
		$(this).addClass('on');
	});
	fetch_list(1);
});
</script>
<div id="content" class="ranking boxoffice">
						<ul id="snb_t">
				
				<li style="width:20%"><a href="/rank/boxoffice/domestic" class="on">국내개봉<span class="ico"></span></a></li>
				<li style="width:20%"><a href="/rank/boxoffice/company/?cs_type=distributor" class="">배급사<span class="ico"></span></a></li>
				<li style="width:20%"><a href="/rank/boxoffice/company/?cs_type=production" class="">제작사<span class="ico"></span></a></li>
				<li style="width:20%"><a href="/rank/boxoffice/history" class="">역대<span class="ico"></span></a></li>
				<li style="width:20%"><a href="/rank/boxoffice/foreign" class="">해외<span class="ico"></span></a></li>
			</ul>			<!-- 검색옵션 -->
			<div class="search_option_area">
				<ul class="search_option">
					<li id="data_genre">
						<span class="tit">장르</span>
						<a href="javascript:;" data-r="all" class="on">전체</a><span class="bar">|</span>
						<a href="javascript:;" data-r="action">액션/SF</a><span class="bar">|</span>
						<a href="javascript:;" data-r="drama">멜로/드라마</a><span class="bar">|</span>
						<a href="javascript:;" data-r="comedy">코미디</a><span class="bar">|</span>
						<a href="javascript:;" data-r="horror">공포/스릴러</a><span class="bar">|</span>
						<a href="javascript:;" data-r="ani">애니메이션</a><span class="bar">|</span>
						<a href="javascript:;" data-r="etc">기타</a>
					</li>
					<li id="data_period">
						<span class="tit">집계기간</span>
						<a href="javascript:;" data-r="2018-08-23">어제</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2018-08-17" class="on">일주일</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2018-07-24">1개월</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2018-06-24">2개월</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2018-02-24">6개월</a><span class="bar">|</span>
						<a href="javascript:;" data-r="2017-08-24">1년</a>						
					</li>
				</ul>
				<div class="btnArea">
					<a href="javascript:;" onclick="fetch_list(1)" class="btn_red_s">조회</a> 
				</div>
			</div>
			<!-- //검색옵션 -->
<!-- //검색옵션 -->


			<div id="boxoffice_list_content"><ul class="boxoffice_list">
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52237">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0713/11_48_16__5b4812f0f05ee[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">목격자</div>
						<div class="people_num">관객수<span class="bar">|</span>1,209,472</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>1,209,472</li>
								<li><span class="tit">누적관객수</span>1,764,355</li>


											<li><span class="tit">배급사</span>(주)NEW</li>
			
											<li><span class="tit">개봉일</span>2018-08-15</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">1</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=49799">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0730/11_03_00__5b5e71d489bf7[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">공작</div>
						<div class="people_num">관객수<span class="bar">|</span>1,084,493</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>1,084,493</li>
								<li><span class="tit">누적관객수</span>4,087,107</li>


											<li><span class="tit">배급사</span>CJ 엔터테인먼트</li>
			
											<li><span class="tit">개봉일</span>2018-08-08</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">2</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52855">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0703/11_14_03__5b3adbeb53a41[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">신과함께-인과 연</div>
						<div class="people_num">관객수<span class="bar">|</span>911,222</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>911,222</li>
								<li><span class="tit">누적관객수</span>11,362,396</li>


											<li><span class="tit">배급사</span>롯데엔터테인먼트</li>
			
											<li><span class="tit">개봉일</span>2018-08-01</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">3</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52484">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0808/13_53_22__5b6a7742c5a30[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">맘마미아!2</div>
						<div class="people_num">관객수<span class="bar">|</span>480,350</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>480,350</li>
								<li><span class="tit">누적관객수</span>1,662,751</li>


											<li><span class="tit">배급사</span>UPI KOREA</li>
			
											<li><span class="tit">개봉일</span>2018-08-08</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">4</span>
					</a>
				</li>
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52640">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0710/18_05_09__5b4476c5071c6[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">메가로돈</div>
						<div class="people_num">관객수<span class="bar">|</span>263,087</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>263,087</li>
								<li><span class="tit">누적관객수</span>476,183</li>


											<li><span class="tit">배급사</span>워너브러더스 코리아㈜</li>
			
											<li><span class="tit">개봉일</span>2018-08-15</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">5</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52294">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0725/11_33_45__5b57e189622d6[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">몬스터 호텔 3</div>
						<div class="people_num">관객수<span class="bar">|</span>191,891</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>191,891</li>
								<li><span class="tit">누적관객수</span>900,959</li>


											<li><span class="tit">배급사</span>소니 픽쳐스</li>
			
											<li><span class="tit">개봉일</span>2018-08-08</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">6</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52913">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0730/11_03_36__5b5e71f8a521f[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">너의 결혼식</div>
						<div class="people_num">관객수<span class="bar">|</span>187,599</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>187,599</li>
								<li><span class="tit">누적관객수</span>206,428</li>


											<li><span class="tit">배급사</span>메가박스중앙㈜플러스엠</li>
			
											<li><span class="tit">개봉일</span>2018-08-22</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">7</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52286">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0523/13_44_00__5b04f190e7ad6[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">미션 임파서블: 폴아웃</div>
						<div class="people_num">관객수<span class="bar">|</span>148,483</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>148,483</li>
								<li><span class="tit">누적관객수</span>6,432,596</li>


											<li><span class="tit">배급사</span>롯데엔터테인먼트</li>
			
											<li><span class="tit">개봉일</span>2018-07-25</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">8</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52534">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0801/11_03_19__5b6114e74143d[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">극장판 도라에몽: 진구의 보물섬</div>
						<div class="people_num">관객수<span class="bar">|</span>76,235</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>76,235</li>
								<li><span class="tit">누적관객수</span>154,912</li>


											<li><span class="tit">배급사</span>㈜이수C&amp;E</li>
			
											<li><span class="tit">개봉일</span>2018-08-15</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">9</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="javascript:;">
						<img src="http://image.cine21.com/resize//noimg[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">나를 차버린 스파이</div>
						<div class="people_num">관객수<span class="bar">|</span>51,726</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>51,726</li>
								<li><span class="tit">누적관객수</span>59,154</li>


			
										</ul>

										<div class="nodata">영화정보가 없습니다.</div>
			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">10</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52684">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0724/16_50_09__5b56da3111755[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">명탐정 코난 : 제로의 집행인</div>
						<div class="people_num">관객수<span class="bar">|</span>37,551</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>37,551</li>
								<li><span class="tit">누적관객수</span>365,789</li>


											<li><span class="tit">배급사</span>CJ 엔터테인먼트</li>
			
											<li><span class="tit">개봉일</span>2018-08-08</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">11</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52863">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0713/16_25_46__5b4853fa7b363[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">극장판 헬로카봇 : 백악기 시대</div>
						<div class="people_num">관객수<span class="bar">|</span>31,553</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>31,553</li>
								<li><span class="tit">누적관객수</span>852,596</li>


											<li><span class="tit">배급사</span>(주)NEW</li>
			
											<li><span class="tit">개봉일</span>2018-08-01</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">12</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52932">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0727/14_17_02__5b5aaace7dff0[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">플로이</div>
						<div class="people_num">관객수<span class="bar">|</span>19,494</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>19,494</li>
								<li><span class="tit">누적관객수</span>39,240</li>


											<li><span class="tit">배급사</span>(주)스마일이엔티</li>
			
											<li><span class="tit">개봉일</span>2018-08-15</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">13</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52771">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0702/11_02_04__5b39879c3fe7f[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">어느 가족</div>
						<div class="people_num">관객수<span class="bar">|</span>14,252</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>14,252</li>
								<li><span class="tit">누적관객수</span>147,493</li>


											<li><span class="tit">배급사</span>(주)티캐스트</li>
			
											<li><span class="tit">개봉일</span>2018-07-26</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">14</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="javascript:;">
						<img src="http://image.cine21.com/resize//noimg[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">마일22</div>
						<div class="people_num">관객수<span class="bar">|</span>12,467</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>12,467</li>
								<li><span class="tit">누적관객수</span>12,675</li>


			
										</ul>

										<div class="nodata">영화정보가 없습니다.</div>
			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">15</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52292">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0711/14_07_08__5b45907c102d1[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">인크레더블 2</div>
						<div class="people_num">관객수<span class="bar">|</span>12,017</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>12,017</li>
								<li><span class="tit">누적관객수</span>3,021,139</li>


											<li><span class="tit">배급사</span>월트디즈니컴퍼니코리아(주)</li>
			
											<li><span class="tit">개봉일</span>2018-07-18</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">16</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=21686">
						<img src="http://image.cine21.com/resize/cine21/still/2018/0716/21686_5b4bed3dda138[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">노인을 위한 나라는 없다</div>
						<div class="people_num">관객수<span class="bar">|</span>4,916</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>4,916</li>
								<li><span class="tit">누적관객수</span>86,653</li>


											<li><span class="tit">배급사</span>해리스앤컴퍼니</li>
			
											<li><span class="tit">개봉일</span>2018-08-09</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">17</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52833">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0612/10_06_39__5b1f1c9f35c5c[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">신은 죽지 않았다 3: 어둠 속의 빛</div>
						<div class="people_num">관객수<span class="bar">|</span>3,293</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>3,293</li>
								<li><span class="tit">누적관객수</span>79,060</li>


											<li><span class="tit">배급사</span>CBS,(주)영화사 그램</li>
			
											<li><span class="tit">개봉일</span>2018-07-19</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">18</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52968">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0803/16_42_11__5b640753c0fad[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">델마</div>
						<div class="people_num">관객수<span class="bar">|</span>3,251</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>3,251</li>
								<li><span class="tit">누적관객수</span>4,888</li>


											<li><span class="tit">배급사</span>그린나래미디어(주)</li>
			
											<li><span class="tit">개봉일</span>2018-08-15</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">19</span>
					</a>
				</li>


					
				
				<li class="boxoffice_li">
					<a href="/movie/info/?movie_id=52792">
						<img src="http://image.cine21.com/resize/cine21/poster/2018/0711/10_29_26__5b455d7676de0[X224,320].jpg" alt="" class="thumb">
						<div class="mov_name">신비아파트: 금빛 도깨비와 비밀의 동굴</div>
						<div class="people_num">관객수<span class="bar">|</span>3,079</div>
						<!-- 오버시 나오는 정보 -->
						<div class="over">

							<ul class="info">
								<li><span class="tit">관객수</span>3,079</li>
								<li><span class="tit">누적관객수</span>674,413</li>


											<li><span class="tit">배급사</span>CJ 엔터테인먼트</li>
			
											<li><span class="tit">개봉일</span>2018-07-25</li>
										</ul>

			
						</div>
						<!-- //오버시 나오는 정보 -->
						<!-- 순위 --><span class="grade num1">20</span>
					</a>
				</li>


					
				
				





			
				
			</ul>
							<div class="pagination"><a href="javascript:fetch_list(1)" class="btn_first"><span class="hidden">처음으로</span><span class="ico"></span></a><div class="page"><a href="javascript:;" class="on">1</a><a href="javascript:fetch_list(2)">2</a><a href="javascript:fetch_list(3)">3</a><a href="javascript:fetch_list(4)">4</a><a href="javascript:fetch_list(5)">5</a><a href="javascript:fetch_list(6)">6</a><a href="javascript:fetch_list(7)">7</a><a href="javascript:fetch_list(8)">8</a><a href="javascript:fetch_list(9)">9</a><a href="javascript:fetch_list(10)">10</a></div><a href="javascript:fetch_list(11)" class="btn_next"><span class="hidden">다음</span><span class="ico"></span></a><a href="javascript:fetch_list(16)" class="btn_end"><span class="hidden">끝으로</span><span class="ico"></span></a>				</div></div>
			<div class="from_kobis">
				<img src="http://image.cine21.com/www1/rank/from_kobis.jpg" alt="kobis"> 본 서비스는 영화진흥위원회가 제공하는 영화관입장권통합전산망(kobis.or.kr)정보를 활용하였습니다.
			</div> 
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 98aeb36bcdfc1da8895d4dfdd13318848138d6c8



			

		</div>

		<!-- 우측 배너영역 -->
		<div class="banner_right">
			<!-- 우측 정기구독&낱권구매 배너 -->
			<div class="banner_subscription">
				<img src="http://image.cine21.com/resize/cine21/movie/2018/0824/10_48_28__5b7f63ecc4cfb[F183,222].jpg" alt="">
				<div class="btn_area">
					<a class="btn" href="/subscription/apply">구독신청</a>
					<a class="btn" href="http://www.cine21store.com" target="_blank">낱권구매</a>
				</div>				
			</div>
			<!-- 우측 정기구독&낱권구매 배너 -->

<<<<<<< HEAD
=======
		</div>		
>>>>>>> 8225c35fc7c16b49d841d47c14ec3340bb2edb4c
=======
>>>>>>> 98aeb36bcdfc1da8895d4dfdd13318848138d6c8
			<!-- 우측 탭진 배너 -->
			<div class="banner_criteo" style="width:160px;height:600px;">
				<!-- // 아래 내용을 광고가 노출되는 태그 내부에 붙여 넣기 하세요. -->
				<!-- // PC 160x600 -->
				<div id="cine21-160x600" data-google-query-id="COy6x_S1hd0CFcuWvQodKrwHBg"><div id="google_ads_iframe_/21682743634/cine21_0__container__" style="border: 0pt none;"><iframe id="google_ads_iframe_/21682743634/cine21_0" title="3rd party ad content" name="google_ads_iframe_/21682743634/cine21_0" width="160" height="600" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" srcdoc="" style="border: 0px; vertical-align: bottom; display: none;"></iframe></div></div>
			</div>
			<!--//우측 탭진 배너-->
		</div>
		<!-- //우측 배너영역 -->

	</div>
	</body>
	</html>