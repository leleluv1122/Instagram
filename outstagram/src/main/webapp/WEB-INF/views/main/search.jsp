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
<title>검색어: ${word}</title>
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
	height: 90px;
	margin-left: 100px;
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

		<div class="find_user">
			<c:forEach var="u" items="${find_user}">
				<div class="f">
					<div class="title_image">
						<a href="/main/user/${u.id}"> <c:choose>
								<c:when test="${u.profile_photo != null}">
									<img src="/images/profile/${u.profile_photo}"
										class="tiny_image" align="left">
								</c:when>
								<c:otherwise>
									<img src="/images/noimage.png" class="tiny_image" align="left">
								</c:otherwise>
							</c:choose>

						</a>
					</div>
					<div class="userid_txt">
						<a href="/main/user/${u.id}"
							style="font-size: 18px; color: black; margin-left: 9px;">${u.userId}</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
</body>
</html>