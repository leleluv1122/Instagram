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
<title>${userid}비밀번호변경</title>
<style>
body {
	font-family: 'Poor Story', cursive;
}

input.form-control.w300 {
	margin-left: 20%;
	width: 300px;
	font-size: 13px;
	background-color: #f5f2f2;
	margin-top: 10px;
}
</style>
</head>
<body>
	<h1 style="text-align: center;">비밀번호 변경</h1>
	<form action="/guest/change_pswd_correct">
		<div class="a"
			style="text-align: center; width: 500px; margin-left: 50px;">
			<input type="hidden" name="userid" value="${userid}" /> <input
				type="password" name="newpswd" class="form-control w300" required
				placeholder="새로운 비밀번호를 입력해주세요" />

			<button type="submit" class="btn btn-primary"
				style="margin-top: 10px; width: 270px; background-color: #b9def0; border: none;">비밀번호
				변경</button>
		</div>

	</form>
</body>
</html>