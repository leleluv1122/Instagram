<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	function followrequestview(){
		$.ajax({
			url : '/follow/request/view',
			type : 'post',
			async : true,
			success : function(data){
				var a = '';
				var b = '';
				$.each(data.fr, function(key, value){
					a += '<div style="weight:500px; height:50px;">';
					a += '<div class="img" style="cursor:pointer; onclick="location.href=\'/main/user/'+
						value.request.id +'\'">';
					if(value.request.profile_photo == null){
						a += '<img src="/images/noimage.png" style="margin-left:30px;margin-right:15px;height:30px;width:30px;border-radius: 30px;float:left;">';
					}
					else{
						a += '<img src="/images/profile/' + value.request.profile_photo
							+ '" style="margin-left:30px;margin-right:15px;height:30px;width:30px;border-radius: 30px;float:left;">';
					}
					a += '<span style="font-size: 18px; margin-left: 9px; ">' + value.request.userId +'</span>';
					a += '</div>'
					a += '<a class="btn btn-default" onclick="follow_accept('+ value.request.id +');" style="margin-left:300px;">팔로우 승인</a>'; //follow_accept('+ value.request.id +');
									
					a += '</div>';
				});
				
				b += '<span style="font-size: 18px;">팔로우 요청 알림 </span><span'
					+ 'style="color: red;">'+ data.followcnt +'개</span>';
				$('.request_user').html(a);
				$('.request_alarm').html(b);
			}
		});
	}
	
	function follow_accept(id){
		$.ajax({
			url : '/follow/request/accept/' + id,
			type : 'post',
			async : true,
			success : function(data){
				alert(data.name + '님 팔로우를 승인하였습니다.');
				followrequestview();
			}
		});
	}


	$(document).ready(function() {
		followrequestview();
	});
</script>