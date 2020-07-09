<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/res/main.css" type="text/css">
<script src="/res/js/slidejquery.js"></script>
<script src="/res/js/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="/res/jquery.bxslider.min.css">
<title>${p.description}</title>
<script>
	$(function() {
		$('.slide_gallery').bxSlider({
			// auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
			controls : true
		});
	});
</script>
<style>
#footer {
	position: fixed;
	background-color: white; /*임의색상*/
	left: 0;
	right: 0;
	bottom: 0;
	height: 6rem;
}

#contents {
	bottom: 6rem;
}

.heart {
	margin-left: 45px;
	background-color: white;
	border: 0;
	outline: 0;
	font-size: 18px;
	float: left;
	color: red;
}
</style>
</head>
<body>
	<div class="contents">
		<div class="r" style="margin-top: 20px;">
			<div style="margin-left: 20px;">
				<div class="title_image">
					<a href="/main/user/${p.user.id}"> <img
						src="/images/profile/${p.user.profile_photo}" class="tiny_image"
						align="left">
					</a>
				</div>
				<div class="userid_txt">
					<a href="/main/user/${p.user.id}"
						style="font-size: 18px; color: black; margin-left: 9px;">${p.user.userId}</a>
				</div>
			</div>
			<div id="gallery_wrap">
				<ul class="slide_gallery">
					<c:forEach var="img" items="${img}">
						<c:if test="${p.id == img.postId}">
							<li><img src="/images/${p.user.userId}/${img.filename}"
								class="imgg"></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<sec:authentication property="user.id" var="currentid" />
			<div class="bar">
				<c:choose>
					<c:when test="${hcnt == 0}">
						<form action="/heart" name="form" method="post">
							<input type="hidden" name="postid" value="${p.id}"> <input
								type="hidden" name="userid" value="${currentid}">
							<button class="glyphicon glyphicon-heart-empty heart"
								aria-hidden="true"></button>
						</form>
					</c:when>
					<c:otherwise>
						<form action="/noheart" name="form" method="post">
							<input type="hidden" name="postid" value="${p.id}"> <input
								type="hidden" name="userid" value="${currentid}">
							<button class="glyphicon glyphicon-heart heart"
								aria-hidden="true"></button>
						</form>
					</c:otherwise>
				</c:choose>
				<span class="glyphicon glyphicon-comment" aria-hidden="true"
					style="margin-left: 15px; font-size: 18px; color: purple"></span>
			</div>
			<div class="write">
				<span>${p.description}</span>
			</div>
		</div>
	</div>

	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
</body>
</html>