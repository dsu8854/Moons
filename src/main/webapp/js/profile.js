var $uploadCrop;
var upphoto;

$(document).ready(function() {
	var img = new Image();
	var i = 0;

	$('#editBtn').on('click', function() {
		$('#editform').attr('action', 'updateInfoPro.do').submit();
	});

	$('#my_profil_pic1').on('click', function() { // 프로필 사진 클릭시
		$('#upload').click();
		return false;
	});
	
	$uploadCrop = $('#upload-demo').croppie({
		
		viewport: {
			width: 200,
			height: 200,
			type: 'circle'
		},
		boundary: {
	        width: 300,
	        height: 300
	    },
	   
		enableExif: true,
		enableOrientation: true			// create 함수를 실행하기위한 조건 
		
		
		 
	});
	
	$('#upload').on('change', function () { 			// 파일 선택시 
		readFile(this);									// croppie api 사용
		
		$('.upload-msg').css({"display":"none"});		// 안보이기
		$('.col-1-2').css({"display": "block"});			// 보이기 
		
		$('#profile_upload').on('click',function(){		// 파일 선택 완료시
		
			$('#profile_upload').on('click', function (ev) {
				
				$uploadCrop.croppie('result', {
					type: 'canvas',
					size: 'viewport'
				}).then(function(resp){
					
					/*popupResult({
						src: resp
					});
					src 값을 받아서 img로 출력 
					if (result.src) {
						html = '<img src="' + result.src + '" />';
					}*/
					console.log('실행1');	// 됨
					console.log(resp);
					/*$.ajax({
						url:'uploadPhoto.do',
						type:'POST',
						dataType:'json',
						cache:false,
						contentType:false,
						enctype:'multipart/form-data',
						processData:false,
						data:'image ='+resp,
						success:function(res){
							console.log('좀');
							alert('성공');
							
						}
						
					});
					*/
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
			});
		});
		
	
	});

	$('.like_icon').on('click', function() {
		var icon = this;
		if ($('.icon_img', icon).attr('src') == 'images/like2.png')
			$('.icon_img', icon).attr('src', 'images/like1.png');
		else
			$('.icon_img', icon).attr('src', 'images/like2.png');

		var formdata = $('#likeForm', icon).serialize();

		$.ajax({
			url : 'likePro.do?',
			type : 'POST',
			dataType : 'text',
			data : formdata,
			success : function(res) {
				$('#likecnt', icon).text(res);
			}
		});

		if ($('#isLike', icon).val() == 'true') {
			$('#isLike', icon).val('false');
		} else if ($('#isLike', icon).val() == 'false') {
			$('#isLike', icon).val('true');
		}
	});

	$('.share_icon').on('click', function() {
		var icon = this;
		if ($('.icon_img', icon).attr('src') == 'images/share2.png')
			$('.icon_img', icon).attr('src', 'images/share1.png');
		else
			$('.icon_img', icon).attr('src', 'images/share2.png');

		var formdata = $('#shareForm', icon).serialize();

		$.ajax({
			url : 'sharePro.do?',
			type : 'POST',
			dataType : 'text',
			data : formdata,
			success : function(res) {
				$('#sharecnt', icon).text(res);
			}
		});

		if ($('#isShare', icon).val() == 'true') {
			$('#isShare', icon).val('false');
		} else if ($('#isShare', icon).val() == 'false') {
			$('#isShare', icon).val('true');
		}
	});
});

$(function() {

	$(".tab_content").hide();
	$(".tab_content:first").show();

	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active").css("color", "#333");
		// $(this).addClass("active").css({"color": "darkred","font-weight":
		// "bolder"});
		$(this).addClass("active").css("color", "darkred");
		$(".tab_content").hide()
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).fadeIn()
	});
});


function readFile(input) {
		if (input.files && input.files[0]) {
        var reader = new FileReader();
       
        reader.onload = function (e) {
			$('#upload-demo').addClass('ready');
			upphoto = e.target.result;
			
        	$uploadCrop.croppie('bind', {
        		url: e.target.result,
        		
        	}).then(function(){
        		// console.log(e.target.result),// --> 읽어들인 파일의 값 
        		console.log('jQuery bind complete');
        	});
        }
        reader.readAsDataURL(input.files[0]);
    }
    else {
        swal("Sorry - you're browser doesn't support the FileReader API");
    }
}