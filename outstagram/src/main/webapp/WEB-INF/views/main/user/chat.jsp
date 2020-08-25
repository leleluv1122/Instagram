<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var id = '${id}';
	
	// chatting insert 하기남음
	
	function chatlist() {
		$.ajax({
			url: '/chat/list/' + id,
			type: 'post',
			async : true,
			data : {'id' : id},
			dataType : "json",
			success : function(data) {
				var a = '';
				$.each(data, function(key, value){
					a += '<div class="hmhm">';
					if(value.send.id == id) {
						a += '<div class="sasa">';
						a += '<span style="float: right">'+ value.content +'</span>';
						a += '</div>';
					}
					else {
						a += '<span style="float: left; margin-left: 50px;">';
						a += value.content + '</span>';
					}
					a += '<br /></div>';
				});
				$('.msg_view').html(a);
			}
		});
	}
	
	
	$(document).ready(function() {
		chatlist();
		// setInterval(chatlist, 3000); // 랙많이걸려서 일단주석처리!
	});
</script>