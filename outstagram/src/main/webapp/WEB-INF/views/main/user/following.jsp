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
<title>팔로잉 목록</title>
<style>
#footer {
	position: fixed;
	background-color: white;
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
	<div id="contents">
		
	</div>

	<div id="footer">
		<%@ include file="../../include/bottom.jsp"%>
	</div>
</body>
</html>