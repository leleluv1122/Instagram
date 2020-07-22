<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var id = '${id}';
	
	function likeview() {
		$.ajax({
			url : '/like/view',
			type : 'post',
			async : true,
			data : {'id' : id},
			dataType : "json",
			success : function(data) {
				var a = '';
				if (data.cnt == 1) {
					a += '<a onclick="likeDelete('+ id +');" style="text-decoration: none;color:red;"'
						+ 'class="glyphicon glyphicon-heart heart" aria-hidden="true"></a>'
					a += '<span class="glyphicon glyphicon-comment" aria-hidden="true"'
						+ 'style="margin-left: 15px; font-size: 18px; color: purple"></span> <br />'
					a += '<span><b>좋아요 ' + data.total_cnt + '개</b></span>'
				} else if (data.cnt == 0) {
					a += '<a onclick="likeInsert('+ id +');" style="text-decoration: none;color:red;"'
						+'class="glyphicon glyphicon-heart-empty heart" aria-hidden="true"></a>'
					a += '<span class="glyphicon glyphicon-comment" aria-hidden="true"'
							+ 'style="margin-left: 15px; font-size: 18px; color: purple"></span> <br />'
					a += '<span><b>좋아요 ' + data.total_cnt + '개</b></span>'		
				}
				$('.like').html(a);
			}
		});
	}
	
 	/* function likeCnt(pid){
		$.ajax({
			url : 'like/cnt/' + pid,
			type : 'post',
			success : function(data){
				alert(data);
			}
		});
	} */
	
	function likeInsert(pid){
		$.ajax({
			url : '/like/insert/' + pid,
			type : 'post',
			success : function(data){
				if(data == 1)
					likeview();
			}
		});
	}
	
	function likeDelete(pid){
		$.ajax({
			url : '/like/delete/' + pid,
			type : 'post',
			success : function(data){
				if(data == 1)
					likeview();
			}
		});
	}

	$(document).ready(function() {
		likeview();
	});
</script>