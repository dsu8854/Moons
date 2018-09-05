$(document).ready(function(){
	var canvas  = $("#canvas"),
    context = canvas.get(0).getContext("2d");
	var img = new Image();
	var i=0;
	
	$('#editBtn').on('click',function(){
		$('#editform').attr('action','updateInfoPro.do').submit();
	});
	 
	$('#my_profil_pic1').on('click',function(){		// 프로필 사진 클릭시 
		$('[name=file1]').click();
		
		
		return false;
	});
	


	$('[name=file1]').on('change', function(){		// 프로필 사진 선택했을때
		$('#result').css({"display":"inline-block"});
		$('#btnCrop').css({'display':'inline-block'});
		$('#btnRestore').css({'display':'inline-block'});
		i=1;
		if(i==0){
			console.log("됨");
		}
		
		if(i==1){
			console.log($('.cropper-wrap-box'));
			$('.cropper-crop-box').empty();
			$('.cropper-wrap-box').empty();
			console.log("안됨");
		}
		
		
		if (this.files && this.files[0]) {
			if ( this.files[0].type.match(/^image\//) ) {
        var reader = new FileReader();
       
        
        reader.onload = function(evt) {
        	
        	
        	
        	img.onload = function() {
        	context.canvas.height = img.height;
             context.canvas.width  = img.width;
             context.drawImage(img, 0, 0);
            var cropper = canvas.cropper({
               aspectRatio: 16 / 9 // 비율 고정  
            	});
             $('#btnCrop').click(function() {
                // Get a string base 64 data url
            	 console.log('저기');
                var croppedImageDataURL = canvas.cropper('getCroppedCanvas').toDataURL("image/png"); 
                
                canvas.cropper('getCroppedCanvas').toBlob
                (function (croppedImageDataURL) {
                	var form = new FormData(),
                    request = new XMLHttpRequest();

                	form.append("image", croppedImageDataURL, "test.png");
                	
                	request.open("POST", "/moons/uploadPhoto.do", true);
                	request.send(form);
                	
                	window.location.href="";
                     }, "image/png");	        
               
                
             });
             $('#btnRestore').click(function() {
               canvas.cropper('reset');
             });
           };
           img.src = evt.target.result;
				};
        reader.readAsDataURL(this.files[0]);
        
        
        
      }
      else {
        alert("Invalid file type! Please select an image file.");
      }
    }
    else {
      alert('No file(s) selected.');
    }
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