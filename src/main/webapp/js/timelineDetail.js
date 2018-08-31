$(document).ready(function(){
	$('#deleteclick').on('click',function(){
		$('#deleteForm').attr('action','deletePost.do').submit();
		return false;
	});
});