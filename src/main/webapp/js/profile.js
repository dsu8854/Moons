$(document).ready(function(){
	$('#editBtn').on('click',function(){
		$('#editform').attr('action','updateInfoPro.do').submit();
	});
	 
	$('.like_icon').on('click', function(){
		var icon = this;
		if($('.icon_img',icon).attr('src')=='images/like2.png')
			$('.icon_img',icon).attr('src','images/like1.png');
		else
			$('.icon_img',icon).attr('src','images/like2.png');
		
		var formdata = $('#likeForm',icon).serialize();
		
		$.ajax({
			url: 'likePro.do?',
			type: 'POST',
			dataType: 'text',
			data: formdata,
			success: function(res) {
				$('#likecnt',icon).text(res);
			}
		});
		
		if($('#isLike',icon).val()=='true') {
			$('#isLike',icon).val('false');
		} else if($('#isLike',icon).val()=='false'){
			$('#isLike',icon).val('true');
		}
	});
	
	$('.share_icon').on('click', function(){
		var icon = this;
		if($('.icon_img',icon).attr('src')=='images/share2.png')
			$('.icon_img',icon).attr('src','images/share1.png');
		else
			$('.icon_img',icon).attr('src','images/share2.png');
		
		var formdata = $('#shareForm',icon).serialize();
		
		$.ajax({
			url: 'sharePro.do?',
			type: 'POST',
			dataType: 'text',
			data: formdata,
			success: function(res) {
				$('#sharecnt',icon).text(res);
			}
		});
		
		if($('#isShare',icon).val()=='true') {
			$('#isShare',icon).val('false');
		} else if($('#isShare',icon).val()=='false'){
			$('#isShare',icon).val('true');
		}
	});
});


$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});