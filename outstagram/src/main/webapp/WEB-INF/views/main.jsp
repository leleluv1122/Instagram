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
<link rel="stylesheet" href="/res/main.css" type="text/css">
<script src="/res/js/slidejquery.js"></script>
<script src="/res/js/jquery.bxslider.min.js"></script>
<link rel="stylesheet" href="/res/jquery.bxslider.min.css">
<title>${user.name}님의Feed</title>
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

.heart {
	margin-left: 45px;
	background-color: white;
	border: 0;
	outline: 0;
	font-size: 18px;
	float: left;
	color: red;
}

.like {
	margin-top: 10px;
	margin-left: 50px;
}

.write {
	margin-top: 5px;
}
</style>
<script>
	$(function() {
		$('.slide_gallery').bxSlider({
			// auto : true,
			autoControls : true,
			stopAutoOnClick : true,
			pager : true,
			controls : true
		});
	});
</script>
</head>
<body>
	<div id="contents">
		<div class="post">
			<div class="nav">
				<span class="title"> <a href="/main" class="title_ft"
					style="margin-right: 170px;">Outstagram</a>
				</span> <a href="/main"><span class="glyphicon glyphicon-send"
					style="color: black;" aria-hidden="true"></span></a>
			</div>
			<c:choose>
				<c:when test="${psize == 0}">
					<div class="nopost">
						<span>게시물이 없습니다.</span> <br /> <a href="/main/recommend">팔로우
							하러 가기</a>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var="p" items="${posting}">
						<div class="r">
							<div style="margin-left: 20px;">
								<div class="title_image">
									<c:choose>
										<c:when test="${p.user.profile_photo == null}">
											<a href="/main/user/${p.user.id}"> <img
												src="/images/noimage.png" class="tiny_image" align="left">
											</a>
										</c:when>
										<c:otherwise>
											<a href="/main/user/${p.user.id}"> <img
												src="/images/profile/${p.user.profile_photo}"
												class="tiny_image" align="left">
											</a>
										</c:otherwise>
									</c:choose>

								</div>
								<div class="userid_txt">
									<a href="/main/user/${p.user.id}"
										style="font-size: 18px; color: black; margin-left: 9px;">${p.user.userId}</a>
								</div>
							</div>
							<div id="gallery_wrap">
								<ul class="slide_gallery">
									<c:forEach var="img" items="${img}">
										<c:if test="${p.id == img.postId}">
											<li><img src="/images/${p.user.userId}/${img.filename}"
												class="imgg"></li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
							<sec:authentication property="user.id" var="currentid" />
							<div class="bar">
								<div class="heart_${p.id}"></div>
							</div>
							<div class="write" style="cursor: pointer;">
								<span onclick="location.href='/main/post/${p.id}'">${p.description}</span>
								<%-- <span style="color: blue">${p.tag}</span> --%>

								<div class="tag_${p.id}"></div>
								<script>
									var original = '${p.tag}';
									var url = '\'/main/search/tag/';
									var pid = '${p.id}';
									var a = '';
									var arr = original.split(', ');

									for (var i = 0; i < arr.length; i++) {
										a += '<span style="color:blue;" onclick="location.href='
												+ url
												+ arr[i].replace("#", "")
												+ '\''
												+ '">'
												+ arr[i]
												+ ' </span>';
									}
									$(".tag_" + pid).html(a);
								</script>

								<br />

								<c:forEach var="cmt" items="${cmt_cnt}">
									<c:if test="${p.id == cmt.postid && cmt.cnt > 0}">
										<span style="color: gray;"
											onclick="location.href='/main/post/${p.id}'">댓글
											${cmt.cnt}개 모두 보기</span>
									</c:if>
								</c:forEach>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div id="footer">
		<%@ include file="include/bottom.jsp"%>
	</div>
	<%@ include file="main/main_heart.jsp"%>
</body>
</html>


<%-- <c:forEach var="poco" items="${poco}">
									<c:if test="${poco.postid == p.id}">
										<c:choose>
											<c:when test="${poco.cnt == 0}">
												<form action="/heart" name="form" method="post">
													<input type="hidden" name="postid" value="${p.id}">
													<input type="hidden" name="userid" value="${currentid}">
													<button class="glyphicon glyphicon-heart-empty heart"
														aria-hidden="true"></button>
												</form>
											</c:when>
											<c:otherwise>
												<form action="/noheart" name="form" method="post">
													<input type="hidden" name="postid" value="${p.id}">
													<input type="hidden" name="userid" value="${currentid}">
													<button class="glyphicon glyphicon-heart heart"
														aria-hidden="true"></button>
												</form>
											</c:otherwise>
										</c:choose>
									</c:if>
								</c:forEach>
								<span class="glyphicon glyphicon-comment" aria-hidden="true"
									onclick="location.href='/main/post/${p.id}'"
									style="margin-left: 15px; font-size: 18px; color: purple; cursor: pointer;"></span><br />
								<div class="like">
									<c:forEach var="lc" items="${like_cnt}">
										<c:if test="${lc.postid == p.id}">
											<c:choose>
												<c:when test="${lc.cnt==0}">
												</c:when>
												<c:otherwise>
													<span style="margin-top: 3px;"><b>좋아요 ${lc.cnt}개</b></span>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</div> --%>