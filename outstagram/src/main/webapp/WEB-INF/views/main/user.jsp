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
<title>Outstagram</title>
<style>
body {
	font-family: 'Poor Story', cursive;
}

.nav {
	width: 500px;
	height: 40px;
}

.title {
	margin-left: 250px;
	font-size: 30px;
	/* font-family: 'Playfair Display', serif; */
	text-decoration: none;
}

.title_image {
	margin-left: 30px;
	height: 100px;
	width: 110px;
	float: left;
}

.title_ft {
	color: black;
	text-decoration: none;
}

.profile {
	margin-top: 10px;
	margin-left: 40px;
	height: 100px;
	width: 500px;
}

.profile_image {
	width: 90px;
	height: 90px;
	border-radius: 45px;
}

.txt {
	margin-left: 30px;
	height: 100px;
	width: 80px;
	float: left;
	margin-top: 15px;
}

._info {
	height: 50px;
	width: 500px;
}

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
</head>
<body>
	<div class="contents">
		<div class="nav">
			<span class="title"> <a href="/main/user/${user.name}"
				class="title_ft">${user.userId}</a></span>
		</div>

		<div class="profile">
			<div class="title_image">
				<img src="/images/profile/sn.jpg" class="profile_image"
					style="margin-right: 50px; float: left;">
			</div>

			<div class="txt">
				<span style="margin-left: 20px;">0</span><br> <span
					style="margin-left: 8px;">게시물</span>
			</div>

			<div class="txt">
				<span style="margin-left: 20px;">0</span><br> <span
					style="margin-left: 8px;">팔로워</span>
			</div>

			<div class="txt">
				<span style="margin-left: 20px;">0</span><br> <span
					style="margin-left: 8px;">팔로잉</span>
			</div>
		</div>

		<div class="_info">
			<span style="margin-left: 80px;">${user.introduce}</span>
		</div>
		
		<div class="fix">
			<a href="" class="btn btn-default" style="margin-left:110px; width:370px;">프로필 수정</a>
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
			aria-hidden="true"></span></a><a href="/main/user/${user.name}"><span
			class="glyphicon glyphicon-user"
			style="color: black; font-size: 30px; margin-top: 13px; margin-left: 120px;"
			aria-hidden="true"></span></a>
	</div>
</body>
</html>