<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.main_img {weight ="1139.200";height ="692";
	
}

input.form-control.w300 {
	margin-left: 20%;
	width: 350px;
	font-size: 13px;
}

body {
	font-family: 'Poor Story', cursive;
}

.layer {
	position: absolute;
	text-align: center;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	font-size: 50px;
}

.sunwi {
	font-size: 1.5em;
	position: absolute;
	left: 980px;
	color: gray;
}
</style>
</head>
<body>
	<div class="container" style="position: relative;">
		<div class="layer">
			<img src="/images/main_insta_login.JPG" class="login_img">
		</div>
		<div
			style="position: absolute; text-align: center; right: 20%; width: 450px; top: 100; font-size: 1.5em; position: absolute;">
			<div>
				<span
					style="margin-left: 70px; font-size: 55px; font-family: 'Playfair Display', serif;"><a
					href="/" style="color: black; text-decoration: none;">Outstagram</a></span>
			</div>
			<form method="post" action="login_processing">
				<div class="form-group">
					<input type="text" name="loginId" placeholder="아이디"
						class="form-control w300" />
				</div>
				<div class="form-group">
					<input type="password" name="passwd" placeholder="비밀번호"
						class="form-control w300" />
				</div>
				<div>
					<button type="submit" class="btn"
						style="margin-left: 20%; margin-top: 15px; width: 300px; background-color: #8fd3ff; border: 1px solid transparent;">로그인</button>
				</div>
			</form>

			<div
				style="text-align: center; right: 17%; top: 475; position: absolute;">

				<a href="/guest/register" class="btn btn-dark"
					style="font-size: 15px;">가입하기</a>
			</div>
			<c:if test="${ param.error != null }">
				<div class="mt5" style="margin-left: 100px; color: red;">로그인
					실패</div>
			</c:if>

		</div>

	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>