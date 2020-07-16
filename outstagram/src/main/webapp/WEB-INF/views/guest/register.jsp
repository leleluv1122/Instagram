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
<title>Outstagram 회원가입</title>
<style>
.error {
	color: red;
	font-size: 12px;
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

input.form-control {
	margin-bottom: 20px;
}

input.form-control.w300 {
	margin-left: 20%;
	width: 350px;
	font-size: 13px;
}
</style>
</head>
<body>
	<div class="container" style="position: relative;">
		<sec:authorize access="not authenticated">
			<div class="layer">
				<img src="/images/insta_register.JPG">
			</div>
			<div
				style="position: absolute; text-align: center; right: 20%; width: 450px; top: 200; font-size: 1.5em; position: absolute;">

				<form:form method="post" modelAttribute="userRegistrationModel"
					autocomplete="off">
					<div class="form-group">
						<form:input path="phone" class="form-control w300"
							placeholder="휴대폰 번호" />
						<form:errors path="phone" class="error" />
					</div>
					<div class="form-group">
						<form:input path="name" class="form-control w300" placeholder="성명" />
						<form:errors path="name" class="error" />
					</div>
					<div class="form-group">
						<form:input path="userid" class="form-control w300"
							placeholder="사용자 이름" />
						<form:errors path="userid" class="error" />
					</div>
					<div class="form-group">
						<form:password path="passwd1" class="form-control w300"
							placeholder="비밀번호" />
						<form:errors path="passwd1" class="error" />
					</div>
					<button type="submit" onclick="return confirm('회원가입 하시겠습니까?')"
						class="btn-light"
						style="margin-left: 20%; margin-top: 60px; width: 300px; background-color: #8fd3ff; border: 1px solid transparent;">가입</button>
				</form:form>


				<div style="margin-top: 217px; margin-left: 240px;">
					<a href="../login">로그인</a>
				</div>
			</div>
		</sec:authorize>
	</div>
</body>
</html>