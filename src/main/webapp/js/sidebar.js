$(document).ready(function(){
	$('.menubarBtn').on('click', function () {
	    $('#sidebar').addClass('active');
	    $('.overlay').fadeIn();
	    return false;
	});
	$('.overlay').on('click', function () {
	    $('#sidebar').removeClass('active');
	    $('.overlay').fadeOut();
	});
});