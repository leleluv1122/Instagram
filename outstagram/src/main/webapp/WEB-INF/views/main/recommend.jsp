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
<!-- 개발버전, 도움되는 콘솔 경고를 포함. -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
<title>팔로우 추천 & 검색</title>
<style>
#footer {
	position: fixed;
	background-color: white; /*임의색상*/
	left: 0;
	right: 0;
	bottom: 0;
	height: 6rem;
}

#contents {
	bottom: 6rem;
}

.search {
	width: 500px;
	height: 70px;
	margin-left: 100px;
}

.recommend {
	width: 500px;
	margin-left: 60px;
	margin-top: 20px;
}

.post_title {
	float: left;
	cursor: pointer;
	height: 160px;
	width: 160px;
	overflow: hidden;
	position: relative;
	height: 160px;
	width: 160px;
	width: 160px;
}

.nava {
	width: 500px;
	height: 30px;
	margin-left: 70px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div id="contents">
		<div class="search">
			<form action="/main/search" class="form-inline my-2 my-lg-0"
				autocomplete="off">
				<input class="form-control mr-sm-2" type="search" name="word"
					placeholder="Search" aria-label="Search"
					style="margin-top: 10px; width: 350px; float: left;">
				<button class="btn btn-outline-success my-2 my-sm-0"
					style="margin-top: 10px; margin-left: 5px;" type="submit">
					<span class="glyphicon glyphicon-search"
						style="margin-top: 7px; margin: 2px;"></span>
				</button>
			</form>
		</div>
		<div class="nava">
			<span style="font-size: 18px;">최근 게시물</span>
		</div>
		<div class="recommend">
			<c:forEach var="p" items="${post9}">
				<c:forEach var="pi" items="${post_image}">
					<c:if test="${p.id == pi.postId}">
						<div onclick="location.href='/main/post/${p.id}'">
							<img src="/images/${p.user.userId}/${pi.filename}"
								class="post_title">
						</div>
					</c:if>
				</c:forEach>
			</c:forEach>
		</div>
	</div>

	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
</body>
</html>