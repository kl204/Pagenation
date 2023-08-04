/**
 * 
 */
	$(document).ready(function(){
		
		$('#go_book_list').on('click',function(){

			$('#frm').attr('action','list.do');
			$('#frm').attr('method','get');
			$('#frm').submit();
		});
		
		$('#up_image').on('change',function(){
			  if (this.files && this.files[0]) {
			    var reader = new FileReader();
			    reader.onload = function(e) {
			      document.getElementById('preview').src = e.target.result;
			      console.log(e.target)
			    };
			    reader.readAsDataURL(this.files[0]);
			  } else {
			    document.getElementById('preview').src = "";
			  }
			});

		
	});
		
