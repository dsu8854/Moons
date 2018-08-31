$(document).ready(function(){
	var submenu1 = $("#u_0_16").next();
	var submenu2 = $("#u_0_17").next();
	var i = 0;
	
	$("#u_0_16").on('click',function(){ // 타임라인 태그
		if(i==0 || i==1){
			submenu1.slideToggle();
			i=1;
		}
		else if(i==2){
			submenu1.slideToggle();
			submenu2.slideUp();
			i=1;
		}
	});
	
	$("#u_0_17").on('click',function(){ // 더보기 태그	
		if(i==0 || i==2){
			submenu2.slideToggle();
			i=2;
		}else if(i==1){
			submenu2.slideToggle();
			submenu1.slideUp();
			i=2;
		}
	});
		
	// profile.jsp --> my_frm1버튼
	// 수정하기 버튼 클릭시 실행
	$('#my_btn1').on('click',function(){
		$('#my_frm1').attr('action','updateInfoForm.do').submit();
	});
	
	$('#my_btn2').on('click',function(){
		location.href="follow.do";
	});
	
	$('#my_btn3').on('click',function(){
		location.href="follower.do";
	});
});