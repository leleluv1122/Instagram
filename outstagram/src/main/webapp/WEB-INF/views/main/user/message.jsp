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
<style>
#msg_input {
	position: fixed;
	background-color: white; /*임의색상*/
	left: 0;
	right: 0;
	bottom: 0;
	height: 12rem;
}

#msg_view {
	margin-top: 50px;
	bottom: 6rem;
	width: 500px;
}

input.form-control.w200 {
	width: 300px;
	font-size: 13px;
	float: left;
	margin-left: 100px;
	margin-bottom: 15px;
}

.hmhm {
	margin-left: 50px;
	width: 400px;
}
</style>
</head>
<body>
	<sec:authentication property="user.id" var="currentid" />
	<sec:authentication property="user.name" var="currentname" />
	<div class="chat-page">
		<%-- <div id="msg_view">
			<c:forEach var="c" items="${chatting}">
				<div class="hmhm">
					<c:choose>
						<c:when test="${c.send.id == currentid}">
							<div class="sasa">
								<span style="float: right;">${c.content}</span>
							</div>
						</c:when>
						<c:when test="${c.receive.id == currentid}">
							<span style="float: left; margin-left: 50px;">${c.content}</span>

						</c:when>
					</c:choose>
					<br />
				</div>
			</c:forEach>
		</div> --%>
		<div class="msg_view"></div>

		<div id="msg_input">
			<form name="chatinput">
				<input type="hidden" name="sendid" value="${currentid}"> <input
					type="hidden" name="receiveid" value="${page_id}"> <input
					type="text" class="form-control w200" name="message"
					class="textiiii" placeholder="메시지 보내기..." required>
				<button type="button" name="chatbtn" class="btn btn-primary"
					style="margin-left: 20px;">보내기</button>
			</form>
		</div>
	</div>
	<div id="footer">
		<%@ include file="../../include/bottom.jsp"%>
	</div>

	<%@ include file="chat.jsp"%>
</body>
</html>