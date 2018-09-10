$(document).ready(function(){
	$('#square-box td').on('click',function(){
		var genre=$(this).text();
		$('#searchFrm #searchLoc').val('index.do?genre='+genre);
		$('#searchFrm').submit();
	});
	
	$('.bottomLinkArea').children('#contents').find('img').parent().remove();
	$('.bottomLinkArea').children('#contents').find('iframe').parent().remove();	
});