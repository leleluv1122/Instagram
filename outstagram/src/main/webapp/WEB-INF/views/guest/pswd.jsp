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
input.form-control.w300 {
	margin-left: 20%;
	width: 270px;
	font-size: 13px;
	background-color: #f5f2f2;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container" style="position: relative;">
		<sec:authorize access="not authenticated">
			<div class="layer">
				<img src="/images/insta_pswd.JPG"
					style="width: 500px; height: auto; margin-left: 30px;">
			</div>
			<div
				style="position: absolute; text-align: center; right: 20%; width: 450px; top: 45; font-size: 1.5em; position: absolute;">
				<div>
					<span
						style="margin-left: 70px; font-size: 30px; font-family: 'Playfair Display', serif;"><a
						href="/" style="color: black; text-decoration: none;">Outstagram</a></span>
				</div>
			</div>
			<div
				style="position: absolute; text-align: center; right: 14%; top: 250; width: 450px; position: absolute;">
				<span style="font-size: 12px; color: gray;">사용자 이름과 전화번호를
					입력하면 <br /> 다시 계정에 로그인 할 수 있도록 도와드리겠습니다.
				</span> <br />
				<form action="/guest/find_pswd" method="post">
					<input type="text" name="userId" placeholder="사용자 아이디"
						class="form-control w300" required /> <input type="text"
						name="phone" placeholder="전화번호 (-)포함" class="form-control w300"
						required />

					<button type="submit" class="btn btn-primary"
						style="margin-top: 10px; width: 270px; background-color: #b9def0; border: none;">비밀번호
						찾기</button>
				</form>
				<c:if test="${ param.error != null }">
					<div class="mt5" style="margin-left: 100px; color: red;">잘못된
						아이디 또는 전화번호입니다</div>
				</c:if>
			</div>
			<div
				style="position: absolute; text-align: center; right: 14%; top: 470; width: 450px; position: absolute;">
				<a href="/guest/register" style="color: black;"><b>새 계정 만들기</b></a>
			</div>
			<div
				style="position: absolute; text-align: center; right: 14%; top: 535; width: 450px; position: absolute;">
				<a href="/guest/login" style="color: black;"><b>로그인으로 돌아가기</b></a>
			</div>
		</sec:authorize>
		<sec:authorize access="authenticated">
			<span>잘못된 접근입니다</span>
			<a href="/main">피드로 가기</a>
		</sec:authorize>

	</div>
</body>
</html>