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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<title>Outstagram 비공개 계정</title>
<style>
html, body {
	display: -webkit-box;
	display: flex;
	min-height: 100%;
	/* -webkit-box-pack: center;
	justify-content: center;
	-webkit-box-align: center;
	align-items: center; */
	-webkit-box-orient: vertical;
	-webkit-box-direction: normal;
	flex-direction: column;
	font-family: sans-serif;
}

ul, li {
	list-style: none;
	margin: 0;
	padding: 0;
}

.tg-list {
	text-align: center;
	display: -webkit-box;
	display: flex;
	-webkit-box-align: center;
	align-items: center;
}

.tg-list-item {
	margin: 0 2em;
}

h2 {
	color: #777;
}

h4 {
	color: #999;
}

.tgl {
	display: none;
}

.tgl, .tgl:after, .tgl:before, .tgl *, .tgl *:after, .tgl *:before, .tgl+.tgl-btn
	{
	box-sizing: border-box;
}

.tgl::-moz-selection, .tgl:after::-moz-selection, .tgl:before::-moz-selection,
	.tgl *::-moz-selection, .tgl *:after::-moz-selection, .tgl *:before::-moz-selection,
	.tgl+.tgl-btn::-moz-selection {
	background: none;
}

.tgl::selection, .tgl:after::selection, .tgl:before::selection, .tgl *::selection,
	.tgl *:after::selection, .tgl *:before::selection, .tgl+.tgl-btn::selection
	{
	background: none;
}

.tgl+.tgl-btn {
	outline: 0;
	display: block;
	width: 4em;
	height: 2em;
	position: relative;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

.tgl+.tgl-btn:after, .tgl+.tgl-btn:before {
	position: relative;
	display: block;
	content: "";
	width: 50%;
	height: 100%;
}

.tgl+.tgl-btn:after {
	left: 0;
}

.tgl+.tgl-btn:before {
	display: none;
}

.tgl:checked+.tgl-btn:after {
	left: 50%;
}

.tgl-light+.tgl-btn {
	background: #f0f0f0;
	border-radius: 2em;
	padding: 2px;
	-webkit-transition: all .4s ease;
	transition: all .4s ease;
}

.tgl-light+.tgl-btn:after {
	border-radius: 50%;
	background: #fff;
	-webkit-transition: all .2s ease;
	transition: all .2s ease;
}

.tgl-light:checked+.tgl-btn {
	background: #9FD6AE;
}

#contents {
	margin-left: 40px;
}
</style>
</head>
<body>
	<sec:authentication property="user.id" var="currentid" />
	<div id="contents">

		<span style="float: left;margin-top:50px;">비공개 계정</span>
		<div class="secret_d"></div>
		<%-- 
				<ul class="tg-list" style="margin-top: 50px;">
			<li class="tg-list-item">
				<form name="secret"><!-- checked="checked" -->
					<input class="tgl tgl-light" id="cb1" type="checkbox" />
					<label class="tgl-btn" for="cb1" style="margin-left: 70px;"></label>
				</form>
				</li>
		</ul>
				 --%>
		<br /> <span style="color: gray;">계정이 비공개 상태인 경우 회원님이 승인한 사람만
			Outstagram에서 회원님의 사진과<br /> 동영상을 볼 수 있습니다. <br />기존 팔로워는 영향을 받지
			않습니다.
		</span>
	</div>

	<div id="footer">
		<%@ include file="../../include/bottom.jsp"%>
	</div>
	<%@ include file="secret_s.jsp"%>
</body>
</html>