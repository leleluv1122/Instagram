<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	var id = '${id}';

	function secretview(){
		$.ajax({
			url : '/secret/view/' + id,
			type : 'post',
			dataType : "json",
			async : true,
			success : function(data){
				var a = '';
				a += '<ul class="tg-list" style="margin-top: 50px;">' +
					'<li class="tg-list-item">';
				
				if(data == true){
					a += '<input onclick="SecretInsert('+ id +')"' 
						+'class="tgl tgl-light" id="cb1" type="checkbox" />'+
						'<label class="tgl-btn" for="cb1" style="margin-left: 70px;"></label>';
				}
				else{
					a += '<input onclick="SecretDelete(' + id + ')"'
						+ 'class="tgl tgl-light" id="cb1" type="checkbox" checked="checked" />'+
					'<label class="tgl-btn" for="cb1" style="margin-left: 70px;"></label>';
				}
				a += '</li></ul>';
				$('.secret_d').html(a);
			}
		});
	}

	function SecretInsert(uid){
		$.ajax({
			url : '/secret/insert/' + uid,
			type : 'post',
			success : function(data){
				if(data == 1){
					alert("계정이 비공개 상태인 경우 회원님이 승인한 사람만 Outstagram에서 회원님의 사진, 동영상, 스토리를 볼 수 있습니다. 기존 팔로워는 영향을 받지 않습니다.");
					secretview();
				}
			}
		});
	}
	
	function SecretDelete(uid){
		$.ajax({
			url : '/secret/delete/' + uid,
			type : 'post',
			success : function(data){
				if(data == 1){
					alert("공개 계정으로 전환됩니다.");
					secretview();
				}
			}
		});
	}

	$(document).ready(function() {
		secretview();
	});
</script>