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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
<title>${p.description}</title>
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

.delete {
	margrin-left: 50px;
	margin-top: 10px;
}

.write {
	margin-top: 5px;
}

.commentList {
	weight: 500px;
	height: auto;
}

.comment {
	weight: 500px;
	height: 500px;
}
</style>
</head>
<body>
	<sec:authentication property="user.id" var="currentid" />
	<div id="contents">
		<div class="r" style="margin-top: 20px;">
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
								src="/images/profile/${p.user.profile_photo}" class="tiny_image"
								align="left">
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
			<div class="bar">
				<c:choose>
					<c:when test="${hcnt == 0}">
						<form action="/heart" name="form" method="post">
							<input type="hidden" name="postid" value="${p.id}"> <input
								type="hidden" name="userid" value="${currentid}">
							<button class="glyphicon glyphicon-heart-empty heart"
								aria-hidden="true"></button>
						</form>
					</c:when>
					<c:otherwise>
						<form action="/noheart" name="form" method="post">
							<input type="hidden" name="postid" value="${p.id}"> <input
								type="hidden" name="userid" value="${currentid}">
							<button class="glyphicon glyphicon-heart heart"
								aria-hidden="true"></button>
						</form>
					</c:otherwise>
				</c:choose>
				<span class="glyphicon glyphicon-comment" aria-hidden="true"
					style="margin-left: 15px; font-size: 18px; color: purple"></span> <br />
				<div class="like">
					<span style="margin-top: 3px;"><b>좋아요 ${heart_cnt}개</b></span>
				</div>

				<c:if test="${postuserid == currentid}">
					<div class="delete" style="float: right;">
						<form action="/main/delete_post">
							<input type="hidden" name="postid" value="${p.id}">
							<button class="btn btn-default" style="float: right;"
								onclick="return confirm('게시글을 삭제 하시겠습니까?')" type="submit">삭제</button>
						</form>
					</div>
				</c:if>
			</div>

			<div class="write">
				<span>${p.description}</span>
			</div>
		</div>
		<div class="comment">
			<div class="container">
				<label for="content">comment</label>
				<form name="commentInsertForm">
					<div class="input-group">
						<input type="hidden" name="pid" id="pid" value="${p.id}" /> <input
							type="text" class="form-control" id="content" name="content"
							placeholder="내용을 입력하세요."> <input type="hidden" name="uid"
							value="${currentid}" /><span class="input-group-btn">
							<button class="btn btn-default" type="button"
								name="commentInsertBtn">등록</button>
						</span>
					</div>
				</form>

			</div>
			<div class="container">
				<div class="commentList"></div>
			</div>
		</div>
	</div>
	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
	<%@ include file="comment.jsp"%>
</body>
</html>