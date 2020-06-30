<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>${user.name}님의  Feed</title>
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
</style>
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
</head>
<body>
	<div id="contents">
		<div class="post">
			<div class="nav">
				<span class="title"> <a href="/main" class="title_ft"
					style="margin-right: 170px;">Outstagram</a>
				</span> <a href="/main"><span class="glyphicon glyphicon-send"
					style="color: black;" aria-hidden="true"></span></a>
			</div>

			<div class="r">
				<div class="navv" style="margin-left: 20px;">
					<div class="title_image">
						<img src="/images/profile/sn.jpg" class="tiny_image" align="left">
					</div>
					<div class="userid_txt">
						<span style="font-size: 18px; margin-left: 9px;">sh_leluvv</span>
					</div>
				</div>
				<div id="gallery_wrap">
					<ul class="slide_gallery">
						<li><img src="/images/photo/p1.jpg" class="imgg"></li>
						<li><img src="/images/photo/p2.jpg" class="imgg"></li>
					</ul>
				</div>
				<div class="bar">
					<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"
						style="margin-left: 45px; font-size: 18px; color: red;"></span> <span
						class="glyphicon glyphicon-comment" aria-hidden="true"
						style="margin-left: 15px; font-size: 18px; color: purple"></span>
				</div>
				<div class="write">
					<span>찬이랑 승희사진</span>
				</div>
			</div>


			<div class="r">
				<div class="navv" style="margin-left: 20px;">
					<div class="title_image">
						<img src="/images/profile/sn.jpg" class="tiny_image" align="left">
					</div>
					<div class="userid_txt">
						<span style="font-size: 18px; margin-left: 9px;">sh_leluvv</span>
					</div>
				</div>
				<div id="gallery_wrap">
					<ul class="slide_gallery">
						<li><img src="/images/photo/p1.jpg" class="imgg"></li>
						<li><img src="/images/photo/p2.jpg" class="imgg"></li>
					</ul>
				</div>
				<div class="bar">
					<span class="glyphicon glyphicon-heart-empty" aria-hidden="true"
						style="margin-left: 45px; font-size: 18px; color: red;"></span> <span
						class="glyphicon glyphicon-comment" aria-hidden="true"
						style="margin-left: 15px; font-size: 18px; color: purple"></span>
				</div>
				<div class="write">
					<span>찬이랑 승희사진</span>
				</div>
			</div>
		</div>


	</div>

	<div id="footer">
		<a href="/main"><span class="glyphicon glyphicon-home"
			style="color: black; font-size: 30px; margin-top: 13px; margin-left: 60px;"
			aria-hidden="true"></span></a> <a href=""><span
			class="glyphicon glyphicon-search"
			style="color: black; font-size: 30px; margin-top: 13px; margin-left: 110px;"
			aria-hidden="true"></span></a> <a href=""><span
			class="glyphicon glyphicon-upload"
			style="color: black; font-size: 30px; margin-top: 13px; margin-left: 100px;"
			aria-hidden="true"></span></a><a href=""><span
			class="glyphicon glyphicon-user"
			style="color: black; font-size: 30px; margin-top: 13px; margin-left: 120px;"
			aria-hidden="true"></span></a>
	</div>
</body>
</html>