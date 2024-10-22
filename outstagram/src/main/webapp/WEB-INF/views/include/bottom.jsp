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
</head>
<body>
	<sec:authentication property="user.id" var="currentid" />
	<a href="/main"><span class="glyphicon glyphicon-home"
		style="color: #6fff59; font-size: 30px; margin-top: 13px; margin-left: 50px;"
		aria-hidden="true"></span></a>
	<a href="/main/recommend"><span class="glyphicon glyphicon-search"
		style="color: #6193ff; font-size: 30px; margin-top: 13px; margin-left: 80px;"
		aria-hidden="true"></span></a>
	<a href="/main/upload"><span class="glyphicon glyphicon-plus-sign"
		style="color: #c061ff; font-size: 30px; margin-top: 13px; margin-left: 80px;"
		aria-hidden="true"></span></a>
	<a href="/main/heart"><span class="glyphicon glyphicon-heart"
		style="color: #ff6161; font-size: 30px; margin-top: 13px; margin-left: 80px;"
		aria-hidden="true"></span></a>
	<a href="/main/user/${currentid}"><span
		class="glyphicon glyphicon-user"
		style="color: gray; font-size: 30px; margin-top: 13px; margin-left: 80px;"
		aria-hidden="true"></span></a>
</body>
</html>