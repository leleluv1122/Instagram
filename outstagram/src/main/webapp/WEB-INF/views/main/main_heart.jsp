<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	var param = [];
	
	<c:forEach items="${posting}" var="item">
		var data = {
				id : ${item.id}
		};
		param.push(data);
	</c:forEach>
	

	function heartview() {
		var jsonData = JSON.stringify(param);
	    jQuery.ajaxSettings.traditional = true;
		$.ajax({
			url : '/heart/view',
			type : 'post',
			async : true,
			data: {"jsonData" : jsonData},
			dataType : "json",
			success : function(data) {
				$.each(data.pu, function(key, value){
					var a = '';
					if(value.b == false){
						a += '<a onclick="likeInsert('+ value.postid +');" style="text-decoration: none;color:red;cursor:pointer;"'
							+'class="glyphicon glyphicon-heart-empty heart" aria-hidden="true"></a>'
						a += '<a href="" class="glyphicon glyphicon-comment" aria-hidden="true"'
							+ 'style="margin-left: 15px; font-size: 18px; color: purple;cursor:pointer;" /> <br />'
						$.each(data.pst, function(key, val){
							if(val.postid == value.postid){
								a += '<span style="margin-left:45px;"><b>좋아요 ' + val.cnt + '개</b></span>'	
							}
						});
					}
					else{
						a += '<a onclick="likeDelete('+ value.postid +');" style="text-decoration: none;color:red;cursor:pointer;"'
							+ 'class="glyphicon glyphicon-heart heart" aria-hidden="true"></a>'
						a += '<span class="glyphicon glyphicon-comment" aria-hidden="true"'
							+ 'style="margin-left: 15px; font-size: 18px; color: purple;cursor:pointer;"></span> <br />'
						$.each(data.pst, function(key, val){
							if(val.postid == value.postid){
								a += '<span style="margin-left:45px;"><b>좋아요 ' + val.cnt + '개</b></span>'
							}
						});
					}
					
					$('.heart_' + value.postid).html(a);
				});
			}
		});
	}
	
	function likeInsert(pid){
		$.ajax({
			url : '/like/insert/' + pid,
			type : 'post',
			success : function(data){
				if(data == 1)
					heartview();
			}
		});
	}
	
	function likeDelete(pid){
		$.ajax({
			url : '/like/delete/' + pid,
			type : 'post',
			success : function(data){
				if(data == 1)
					heartview();
			}
		});
	}
	
	
	$(document).ready(function() {
		heartview();
	});
</script>