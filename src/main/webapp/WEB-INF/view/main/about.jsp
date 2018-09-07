<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="css/about.css">
<script type="text/javascript">
	$(function() {

		$(".tab_content").hide();
		$(".tab_content:first").show();

		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active").css("color", "#333");
			$(this).addClass("active").css({
				"color" : "gray",
				"font-weight" : "bolder"
			});
			//$(this).addClass("active").css("color", "darkred");
			$(".tab_content").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
	});
</script>
<div id="container">
	<ul class="tabs">
		<li class="active" rel="tab1">소개</li>
		<li rel="tab2">Moons 문화</li>
		<li rel="tab3">걸어온길</li>
	</ul>
	<div class="tab_container">
		<div id="tab1" class="tab_content">
			<ul>
				<li><strong class="tit_intro">“Connect Everything” 새로운
						연결, 더 나은 세상"</strong></li>
				<li><img src="images/introduce_vision01.jpg" class="img_thumb"
					alt=""></li>
				<li>
					<div class="wrap_cont">
						<div class="area_tit">
							<p class="tit_corp">비전</p>
						</div>
						<div class="area_cont">
							<p class="desc_info">
								카카오는 새로운 연결을 통해 더 편리하고 즐거운 세상을 꿈꿉니다. <br> 사람과 사람, 사람과 기술을
								한층 가깝게 연결함으로써 세상을 어제보다 더 나은 곳으로 만들기 위해 노력하고 있습니다.
							</p>
						</div>
					</div>
				</li>

			</ul>
		</div>
		<!-- #tab1 -->
		<div id="tab2" class="tab_content">
			<ul>
				<li><strong class="tit_intro">어제보다 더 나은 세상을 꿈꾸는 Moons
						문화를 소개합니다.</strong></li>
				<li><img src="images/kakao_ai01.jpg" class="img_thumb" alt=""></li>
				<li>
					<div class="wrap_cont">
						<div class="area_tit">
							<p class="tit_corp">Moons 문화 소개</p>
						</div>
						<div class="area_cont">
							<p class="desc_info">
								Moons는 새로운 연결을 통해 더 편리하고 즐거운 세상을 꿈꿉니다. <br> 사람과 사람, 사람과 기술을
								한층 가깝게 연결함으로써 세상을 어제보다 더 나은 곳으로 만들기 위해 노력하고 있습니다.
							</p>
						</div>
					</div>
				</li>
			</ul>

		</div>
		<!-- #tab2 -->
		<div id="tab3" class="tab_content">
			<strong class="tit_corp">2018년 3월부터 지금까지,<br>새로운
						연결, 더 나은 세상을 위해<br>Moons가 걸어온 길입니다.
				</strong>
			<ul>
				<li>
					<div class="history_info">
						<strong class="txt_year">2018년 3월</strong>
						<div class="inner_info">
							<div class="txt_info">
								<em class="txt_num">01<span class="screen_out">월</span></em> <span
									class="txt_date ">(주) 로엔엔터테인먼트(LOEN)인수</span>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="history_info">
						<strong class="txt_year">2018년 4월</strong>
						<div class="inner_info">
							<div class="txt_info">
								<em class="txt_num">01<span class="screen_out">월</span></em> <span
									class="txt_date ">(주) 로엔엔터테인먼트(LOEN)인수</span>
							</div>
						</div>
					</div>
				</li>
				<li>
				<div class="history_info">
						<strong class="txt_year">2018년 5월</strong>
						<div class="inner_info">
							<div class="txt_info">
								<em class="txt_num">01<span class="screen_out">월</span></em> <span
									class="txt_date ">(주) 로엔엔터테인먼트(LOEN)인수</span>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="history_info">
						<strong class="txt_year">2018년 6월</strong>
						<div class="inner_info">
							<div class="txt_info">
								<em class="txt_num">01<span class="screen_out">월</span></em> <span
									class="txt_date ">(주) 로엔엔터테인먼트(LOEN)인수</span>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="history_info">
						<strong class="txt_year">2018년 8월</strong>
						<div class="inner_info">
							<div class="txt_info">
								<em class="txt_num">01<span class="screen_out">월</span></em> <span
									class="txt_date ">(주) 로엔엔터테인먼트(LOEN)인수</span>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="history_info">
						<strong class="txt_year">2018년 9월</strong>
						<div class="inner_info">
							<div class="txt_info">
								<em class="txt_num">01<span class="screen_out">월</span></em> <span
									class="txt_date ">(주) 로엔엔터테인먼트(LOEN)인수</span>
							</div>
						</div>
					</div>
				</li>
				<li>
					<div class="history_info">
						<strong class="txt_year">2018년 7월</strong>
						<div class="inner_info">
							<div class="txt_info">
								<em class="txt_num">01<span class="screen_out">월</span></em> <span
									class="txt_date ">(주) 로엔엔터테인먼트(LOEN)인수</span>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<!-- #tab3 -->
	</div>
	<!-- .tab_container -->
</div>
<!-- #container -->