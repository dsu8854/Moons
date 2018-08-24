$(document).ready(function(){
	//소메뉴
	$('li[value=on]').css({'border-bottom':'3px solid #33cccc'});
	$('li').on('click',function(){
		location.href=$(this).attr('id')+'.do';
	});
});