<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var id = '${id}'; // postid

	$('[name=commentInsertBtn]').click(function() {
		var insertData = $('[name=commentInsertForm]').serialize();
		commentInsert(insertData);
	});

	function commentList(){
		$.ajax({
			url : '/comment/list',
			type:'get',
			data : {'id': id},
			success : function(data){
				var a = '';
				$.each(data, function(key, value){
					a += '<div class="commentArea" style="margin-bottom: 15px;">';
					a += '<div class="img"><a href="/main/user/'+ value.user.id +'"> <img src="/images/profile/'+ value.user.profile_photo 
						+'" style="margin-left:30px;margin-right:15px;height:30px;width:30px;border-radius: 30px;float:left;"></a>' + '</div>'
	                a += '<div class="commentContent'+value.id+'"> <a href="/main/user/'+ value.user.id +'"><p style="float:left;margin-right:5px;"> <b>' + value.user.userId 
	                	+ '</b></p></a>' + ' <p>' + value.content +'</p>';
	                a += '</div></div>';
				});
				$(".commentList").html(a);
			}
		});
	}
	
	//댓글 등록
	function commentInsert(insertData){
	    $.ajax({
	        url : '/comment/insert',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	                commentList();
	                $('#content').val('');
	            }
	        }
	    });
	}
	
	$(document).ready(function(){
	    commentList();
	});
</script>