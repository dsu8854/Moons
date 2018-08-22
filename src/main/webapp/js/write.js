$(document).ready(function(){
		var files;
		var count=0;
		$('#header_background_img').on('change',function(){
			
			console.log(1);
			files=this.files;
			console.log(files[0]);
			var reader = new FileReader();
			reader.readAsDataURL(files[0]);
			reader.onload=function(){
				console.log(reader.result);
				$('.service_header').css({"background":"url('"+reader.result+"')","background-size":"100% 100%"});
				$('.glyphicon').css({"color":"white"});
				$('.cover_title').css({"color":"white"});
				$('.cover_subtitle').css({"color":"white"});
				$('.background-cover').css({"background-color":"rgba(0, 0, 0, 0.4)"});
			}
			$('#header_background_img').val("");
			console.log(files[0]);
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
			count++
   	 		console.log(count);
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
		$('#summernote').summernote(
				{
					lang: 'ko-KR',
					height:500,
					minheight: null,
					maxheight: null,
					focus:true,
					popover: {
						  image: [
						    ['imagesize', ['imageSize100', 'imageSize50', 'imageSize25']],
						    ['float', ['floatLeft', 'floatRight', 'floatNone']],
						    ['remove', ['removeMedia']]
						  ],
						  link: [
						    ['link', ['linkDialogShow', 'unlink']]
						  ],
						  air: [
						    ['color', ['color']],
						    ['font', ['bold', 'underline', 'clear']],
						    ['para', ['ul', 'paragraph']],
						    ['table', ['table']],
						    ['insert', ['link', 'picture']]
						  ]
						},
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
			var markupStr = $('#summernote').summernote('code');
			$('#board_subject_cover').attr('contenteditable','false');
			$('#cover_subtitle').attr('contenteditable','false');
			$('#board_hashtag').attr('contenteditable','false');
			$('#summernote_wrap').css('display','none');
			$('#hash_table').css('display','none');
			$('#board_content').css('display','block');
			$('#board_content').append(markupStr);
			$('.wrap_right_inner').css("display","none");
			$('#wrap_right_inner_in').css("display","inline");
			$('#background_img').css("display","none");
			
			/*		$('#board_content').val(markupStr);
			$('#board_subject').val(board_subject);*/
			/*var form_data = new FormData();
			form_data.append('board_subject',board_subject);
			form_data.append('markupStr',markupStr);
			form_data.append('board_hashtag',board_hashtag);
			console.log(form_data);
			$.ajax({
				data:form_data,
				type:"POST",
				url:'save.do',
				cache:false,
				enctype:'multipart/form-data',
				contentType:false,
				processData:false,
				success:function(res){
					$('#board_content').append(res.moonsboard[0].board_content);
					var board_content=res.moonsboard[0].board_content;
				}
			});
		*/	
			/*setTimeout(function(){ $('#frm').attr('action','write.do').submit(); 
			},5000);*/
			
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
			$('.wrap_right_inner_modi').css("display","none");
			$('#wrap_right_inner_in').css("display","inline");
			var markupStr = $('#summernote').summernote('code');
			$('#board_subject_cover').attr('contenteditable','false');
			$('#cover_subtitle').attr('contenteditable','false');
			$('#board_hashtag').attr('contenteditable','false');
			$('#summernote_wrap').css('display','none');
			$('#board_content').css('display','block');
			$('#board_content').empty();
			$('#board_content').append(markupStr);
			$('.wrap_right_inner').css("display","none");
			$('#wrap_right_inner_in').css("display","inline");
			$('#background_img').css("display","none");
			
		});
	
	});
function sendFile(file,el){
	var form_data = new FormData();
	form_data.append('file',file);
	$.ajax({
		data: form_data,
		type: "POST",
		url:'image.do',
		cache:false,
		contentType:false,
		enctype:'multipart/form-data',
		processData:false,
		success:function(url){
			console.log(url);
			$(el).summernote('editor.insertImage',"images/"+url);
		}	 	
	});
}	
	
	