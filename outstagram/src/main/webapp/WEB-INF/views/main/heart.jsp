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
<title>하트 목록</title>
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

.request_user {
	width: 500px;
	margin-left: 50px;
}

.f {
	width: 500px;
	height: 50px;
}

.nava {
	width: 500px;
	height: 50px;
	margin-left: 70px;
	margin-top: 20px;
}

.like {
	width: 500px;
	height: 60px;
	margin-left: 70px;
	margin-top: 5px;
}

.tiny_image {
	width: 50px;
	height: 50px;
	float: left;
	margin-right: 20px;
}

.title_image {
	cursor: pointer;
}

.userid_txt {
	font-size: 18px;
	margin-left: 9px;
	cursor: pointer;
}
</style>
</head>
<body>
	<div id="contents">
		<c:if test="${followcount != 0}">
			<div class="nava">
				<div class="request_alarm"></div>
				<%-- <span style="font-size: 18px;">팔로우 요청 알림 </span><span
					style="color: red;">${followcount}개</span> --%>
			</div>
			<div class="request_user"></div>
		</c:if>

		<div class="nava">
			<span style="font-size: 18px;">좋아요 알림</span>
		</div>

		<c:forEach var="h" items="${hearts}">
			<div class="like">
				<div class="img">
					<c:forEach var="pi" items="${post_image}">
						<c:if test="${pi.postId == h.post.id}">
							<img src="/images/${h.post.user.userId}/${pi.filename}"
								class="tiny_image"
								onclick="location.href='/main/post/${h.post.id}'">
						</c:if>
					</c:forEach>
				</div>
				<a href="/main/user/${h.user.id}">${h.user.userId}</a> <span>님이
					회원님의 게시물을 좋아합니다.</span> <br />

				<c:set var="clicktime" value="${h.clicktime}" />
				<div class="time_${h.id}"></div>
				<script>
					var a = '';
					var cur = new Date();
					var c_time = cur.getTime();

					var ct = '${clicktime}';
					var cd = new Date(ct.valueOf());

					var chai = c_time - cd.getTime();

					if (chai < 1000 * 60)
						a += Math.floor(chai / 1000) + ' 초전';
					else if (chai < 1000 * 60 * 60)
						a += Math.floor(chai / (1000 * 60)) + ' 분전';
					else if (chai < 1000 * 60 * 60 * 24)
						a += Math.floor(chai / (1000 * 60 * 60)) + ' 시간전';
					else if (chai < 1000 * 60 * 60 * 24 * 30)
						a += Math.floor(chai / (1000 * 60 * 60 * 24)) + ' 일전';
					else if (chai < 1000 * 60 * 60 * 24 * 30 * 12)
						a += Math.floor(chai / (1000 * 60 * 60 * 24 * 30))
								+ ' 달전';

					$(".time_" + '${h.id}').html(a);
				</script>
				<hr />
			</div>
		</c:forEach>
		<div class="black" style="width: 500px; height: 50px;"></div>
	</div>

	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
	<%@ include file="followrequest.jsp"%>
</body>
</html>