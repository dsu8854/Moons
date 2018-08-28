var fileArray = new Array();

$(document).ready(function(){
	var files;
	var count=0;
	
	$('#header_background_img').on('change',function(){
		files=this.files;
		var reader = new FileReader();
		reader.readAsDataURL(files[0]);
		sendFile(files[0],this);
		/*reader.onload=function(){
			$('.service_header').css({"background":"url('"+reader.result+"')","background-size":"100% 100%"});
			$('.glyphicon').css({"color":"white"});
			$('.cover_title').css({"color":"white"});
			$('.cover_subtitle').css({"color":"white"});
			$('.background-cover').css({"background-color":"rgba(0, 0, 0, 0.4)"});
		}*/
	});
	
	$('#btn_delete').on('click', function(){ 
		$('.service_header').removeAttr('style');		
		$('.glyphicon').css({"color":"black"});		
		$('.background-cover').css({"background-color":"rgba(0, 0, 0, 0)"});		
		$('.cover_title').css({"color":"black"});		
		$('.cover_subtitle').css({"color":"black"});		
	});
		
		
	$("#upfile1").click(function(){
   	 	$("#header_background_img").trigger('click'); 	
	});
   	 		
	$('#btn_colorChange').click(function(){
		count++;
   	 	switch(count){
   	 		case 1: $('.service_header').css({"background-color": "rgb(246, 112, 102)"});
   	 		break;
   	 		case 2: $('.service_header').css({"background-color": "rgb(248, 151, 46)"});
	 		break;
   	 		case 3: $('.service_header').css({"background-color": "rgb(250, 187, 17)"});
	 		break;
   	 		case 4: $('.service_header').css({"background-color": "rgb(35, 184, 119)"});
	 		break;
   	 		case 5: $('.service_header').css({"background-color": "rgb(0, 195, 189)"});
	 		break;
   	 		case 6: $('.service_header').css({"background-color": "white"});
 			break;
   	 		case 7: count=0;
   	 		$("#btn_colorChange").trigger("click");
   	 		break;
   	 	}
	});
		
	$('#summernote').summernote({
		lang: 'ko-KR',
		height:500,
		minheight: null,
		maxheight: null,
		focus:true,
		popover: {
			image: [['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
					['float', ['floatLeft', 'floatRight', 'floatNone']],
					['remove', ['removeMedia']]],
			link: [['link', ['linkDialogShow', 'unlink']]],
			air: [['color', ['color']],
				  ['font', ['bold', 'underline', 'clear']],
				  ['para', ['ul', 'paragraph']],
				  ['table', ['table']],
				  ['insert', ['link', 'picture']]]},
		dialogsFade: true,
		callbacks:{
			onImageUpload: function(files, editor, welEditable){
				for(var i=files.length-1;i>=0;i--){
					sendFile(files[i],this);
				}
			}
		}
	});
			
	$('#btnSave').on('click',function(){
		$('[name=board_content]').val($('#summernote').summernote('code'));
		$('[name=board_subject]').val($('#board_subject_cover').text());
		$('#board_photo').val($('#board_subject_cover').text());
		$('[name=fileArray]').val(JSON.stringify(fileArray));
		$('#board_subject_cover').attr('contenteditable','false');
		$('#cover_subtitle').attr('contenteditable','false');
		$('#board_hashtag').attr('contenteditable','false');
		$('#summernote_wrap').css('display','none');
		$('#hash_table').css('display','none');
		$('#board_content').css('display','block');
		$('#board_content').append($('#summernote').summernote('code'));
		$('.wrap_right_inner').css("display","none");
		$('#wrap_right_inner_in').css("display","inline");
		$('#background_img').css("display","none");
	});
		
	$('#btn_mody').click(function(){
		$('#wrap_right_inner_in').css("display","none");
		$('.wrap_right_inner_modi').css("display","inline");
		$('#board_subject_cover').attr('contenteditable','true');
		$('#cover_subtitle').attr('contenteditable','true');
		$('#board_hashtag').attr('contenteditable','true');
		$('#background_img').css("display","block");
		$('#summernote_wrap').css('display','block');
		$('#board_content').css('display','none');
	});
	
	$('#btn_modyc').click(function(){
		$('[name=board_content]').val($('#summernote').summernote('code'));
		$('[name=board_subject]').val($('#board_subject_cover').text());
		$('.wrap_right_inner_modi').css("display","none");
		$('#wrap_right_inner_in').css("display","inline");
		$('#board_subject_cover').attr('contenteditable','false');
		$('#cover_subtitle').attr('contenteditable','false');
		$('#board_hashtag').attr('contenteditable','false');
		$('#summernote_wrap').css('display','none');
		$('#board_content').css('display','block');
		$('#board_content').empty();
		$('#board_content').append($('#summernote').summernote('code'));
		$('.wrap_right_inner').css("display","none");
		$('#wrap_right_inner_in').css("display","inline");
		$('#background_img').css("display","none");
	});
	
	$('#btnPost').on('click',function(){
		$('#postForm').attr('action','post.do').submit();
	});
});

function sendFile(file,el){
	var form_data = new FormData();
	form_data.append('file',file);
	$.ajax({
		data: form_data,
		type: "POST",
		url:'uploadFile.do',
		cache:false,
		contentType:false,
		enctype:'multipart/form-data',
		async:false,
		processData:false,
		success:function(url){
			if($(el)[0]==$('#summernote')[0])
				$(el).summernote('editor.insertImage',"images/"+url);
			else {
				$('[name=board_photo]').val(url);
				$('.service_header').css({"background":"url('images/"+url+"')","background-size":"100% 100%"});
				$('.glyphicon').css({"color":"white"});
				$('.cover_title').css({"color":"white"});
				$('.cover_subtitle').css({"color":"white"});
				$('.background-cover').css({"background-color":"rgba(0, 0, 0, 0.4)"});
				$('#header_background_img').val("");
			}
			fileArray.push(url);
		}
	});
}