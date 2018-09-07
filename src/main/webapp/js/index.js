$(document).ready(function(){
	$('#square-box td').on('click',function(){
		var genre=$(this).text();
		console.log(genre);
		$('#searchFrm #searchLoc').val('index.do?genre='+genre);
		console.log($('#searchFrm #searchLoc').val());
		$('#searchFrm').submit();
	});
	
	$('.bottomLinkArea').children('#contents').find('img').parent().remove();
	$('.bottomLinkArea').children('#contents').find('iframe').parent().remove();	
});