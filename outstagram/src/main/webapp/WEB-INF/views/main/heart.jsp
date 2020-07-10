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

.img {
	
}
</style>
</head>
<body>
	<div id="contents">
		<div class="nava">
			<span style="font-size: 18px;">좋아요 알림</span>
		</div>

		<!-- 현재시간 -->
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<c:set var="sysYear">
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" />
		</c:set>
		<c:set var="syshour">
			<fmt:formatDate value="${now}" pattern="HH" />
		</c:set>
		<fmt:parseDate value="${sysYear}" var="sysday"
			pattern="yyyy-MM-dd HH:mm:ss" />
		<fmt:parseNumber value="${sysday.time / (1000*60*60*24)}"
			integerOnly="true" var="strDate"></fmt:parseNumber>


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


				<c:set var="clickhour">
					<fmt:formatDate value="${h.clicktime}" pattern="HH" />
				</c:set>

				<fmt:parseDate value="${h.clicktime}" var="endPlanDate"
					pattern="yyyy-MM-dd HH:mm:ss" />
				<fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}"
					integerOnly="true" var="endDate"></fmt:parseNumber>

				<c:choose>
					<c:when test="${strDate - endDate == 0}">
						<!-- 몇시간전 -->
						<c:choose>
							<c:when test="${syshour - clickhour < 0}">
								${syshour+24 - clickhour} 시간전
							</c:when>
							<c:otherwise>
								${syshour - clickhour} 시간전
							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<!-- 1일전 이상 -->
						<span>${strDate - endDate} 일전</span>
					</c:otherwise>
				</c:choose>

				<%-- <span> <fmt:formatDate value="${h.clicktime}"
						pattern="yyyy-MM-dd HH:mm:ss" />
				</span> --%>
				<hr />
			</div>
		</c:forEach>
	</div>

	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
</body>
</html>