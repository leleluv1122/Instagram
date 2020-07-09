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

.find_user {
	width: 500px;
	margin-left: 100px;
}

.f {
	width: 500px;
	height: 100px;
}

.tiny_image {
	width: 80px;
	height: 80px;
	border-radius: 7px;
}

.nava {
	width: 500px;
	height: 50px;
	margin-left: 70px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div id="contents">
		<div class="nava">
			<span style="font-size: 20px;">팔로잉 목록</span>
		</div>
		<div class="find_user">
			<c:forEach var="f" items="${following}">
				<div class="f">
					<div class="title_image">
						<a href="/main/user/${f.follower.id}"> <c:choose>
								<c:when test="${f.follower.profile_photo == null}">
									<img src="/images/noimage.png" class="tiny_image" align="left">
								</c:when>
								<c:otherwise>
									<img src="/images/profile/${f.follower.profile_photo}"
										class="tiny_image" align="left">
								</c:otherwise>
							</c:choose>
						</a>
					</div>
					<div class="userid_txt">
						<a href="/main/user/${f.follower.id}"
							style="font-size: 18px; color: black; margin-left: 9px;">${f.follower.userId}</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div id="footer">
		<%@ include file="../../include/bottom.jsp"%>
	</div>
</body>
</html>