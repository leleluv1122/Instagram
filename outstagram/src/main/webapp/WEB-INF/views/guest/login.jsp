<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Outstagram</title>
<style>
.main_img {weight ="1139.200";height ="692";
	
}

.login_img {
	
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
			style="position: absolute; text-align: center; right: 20%; width: 450px; top: 200; font-size: 1.5em; position: absolute;">
			<form method="post" action="login_processing">
				<div class="form-group">
					<label>아이디:</label> <input type="text" name="loginId"
						class="form-control w200" />
				</div>
				<div class="form-group">
					<label>비밀번호:</label> <input type="password" name="passwd"
						class="form-control w200" />
				</div>
				<div>
					<button type="submit" class="btn">
						<span class="glyphicon glyphicon-ok"></span> 로그인
					</button>
				</div>
			</form>

			<div
				style="text-align: center; right: 17%; top: 375; font-size: 1em; position: absolute;">

				<a href="/guest/register" class="btn btn-dark">가입하기</a>
			</div>
			<c:if test="${ param.error != null }">
				<div class="mt5">로그인 실패</div>
			</c:if>

		</div>

	</div>
	<%@ include file="../include/bottom.jsp"%>
</body>
</html>