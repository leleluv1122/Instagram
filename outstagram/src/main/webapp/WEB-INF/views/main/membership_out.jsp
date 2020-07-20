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
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/minty/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/res/user.css" type="text/css">
<title>Outstagram</title>
<style>
#contents {
	margin-left: 50px;
	width: 500px;
}
</style>
</head>
<body>

	<sec:authentication property="user.name" var="username" />
	<sec:authentication property="user.id" var="currentid" />
	<div id="contents">
		<h1>계정 삭제</h1>
		<br /> <br /> <span>${username} 님, 안녕하세요!</span> <br /> <span>계정을
			삭제하려고 하신다니 아쉽습니다.</span> <br /> <span>잠시 활동을 쉬고 싶으시다면 대신 Outstagram
			계정을 </span> <a href="#">일시적으로 비활성화</a><span>할 수 있습니다.</span>
		<hr />
		<form action="/main/real_out" method="post">
			<br /> <span><b>계정을 삭제하시는 이유가 무엇인가요?</b></span> <br /> <input
				type="hidden" value="${currentid}" name="uid" />
			<div style="margin-top: 5px;">
				<select class="form-control" name="reason" style="width: 300px;">
					<option value="1">팔로우할 사람을 찾을 수 없음</option>
					<option value="2">너무 내용이 많고 산만함</option>
					<option value="3">개인 정보 보호 문제</option>
					<option value="4">삭제하고 싶은 내용이 있음</option>
					<option value="5">기타</option>
				</select>
			</div>
			<br /> <br /> <span><b>계속하려면 비밀번호를 다시 입력하세요</b></span> <br /> <input
				type="password" name="pswd" class="form-control"
				style="width: 300px;" /> <br /> <br /> <a href="#">비밀번호를
				잊으셨나요?</a> <br /> <br /> <span>아래 버튼을 누르면 사진, 댓글, 좋아요, 친구 관계를
				포함한 모든 데이터가 영구적으로 삭제되어 복구할 수 없게 됩니다.</span> <br /> <br />


			<button class="btn" style="background-color: red; color: white;">내
				계정 영구 삭제</button>
			<c:if test="${ param.error != null }">
				<div class="mt5" style="color: red;">비밀번호가 틀렸습니다.</div>
			</c:if>
		</form>
	</div>

	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
</body>
</html>