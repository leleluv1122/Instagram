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
<link rel="stylesheet" href="/res/user.css" type="text/css">
<title>Outstagram</title>
</head>
<body>
	<div class="contents">
		<div class="nav">
			<span class="title"> <a href="/main/user/${user.id}"
				class="title_ft" style="margin-right: 80px;">${user.userId}</a></span>
		</div>

		<div class="profile">
			<div class="title_image">
				<c:choose>
					<c:when test="${user.profile_photo == null}">
						<img src="/images/noimage.png" class="profile_image"
							style="margin-right: 50px; float: left;">
					</c:when>
					<c:otherwise>
						<img src="/images/profile/${user.profile_photo}"
							class="profile_image" style="margin-right: 50px; float: left;">
					</c:otherwise>
				</c:choose>
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
			<span style="margin-left: 80px;">${user.introduce}</span><br /> <span
				style="margin-left: 80px;">${user.website}</span>
		</div>

		<div class="fix">
			<a href="update/${user.id}" class="btn btn-default"
				style="margin-left: 110px; width: 370px;">프로필 수정</a>
		</div>
	</div>

	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
</body>
</html>