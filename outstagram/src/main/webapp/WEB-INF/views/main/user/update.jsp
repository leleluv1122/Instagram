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
<title>Outstagram</title>
<style>
.title_image {
	margin-top: 20px;
	margin-left: 231px;
	height: 100px;
	width: 110px;
}

.profile_image {
	width: 90px;
	height: 90px;
	border-radius: 45px;
}

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

.img {
	width: 500px;
	height: 100px;
}

.filebox {
	width: 500px;
	height: 40px;
}

.filebox label {
	text-align: center;
	padding: .5em .75em;
	/* color: #fff; */
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	/* background-color: #5cb85c; */
	cursor: pointer;
	/* border: 1px solid #ccc; */
	border-radius: .25em;
	display: inline-block;
	/* -webkit-transition: background-color 0.2s;
	transition: background-color 0.2s; */
}

.filebox label:hover {
	background-color: #ebebeb;
}

/* .filebox label:active {
	background-color: #367c36;
} */
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.info {
	width: 500px;
	height: 200px;
	margin-left: 120px;
}

input.form-control.w200 {
	width: 300px;
	font-size: 13px;
}
</style>
</head>
<body>
	<div class="contents">
		<div class="img">
			<div class="title_image">
				<c:choose>
					<c:when test="${user.profile_photo == null}">
						<img src="/images/noimage.png" class="profile_image"
							style="margin-right: 80px;">
					</c:when>
					<c:otherwise>
						<img src="/images/profile/${user.profile_photo}"
							class="profile_image" style="margin-right: 80px;">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="filebox">
			<form action="/main/user/image_insert" id="form" name="form"
				method="post" enctype="multipart/form-data" autocomplete="off">
				<label for="ex_file" style="margin-left: 60px; width: 310px;">프로필
					사진 바꾸기</label> <input type="file" id="ex_file" name="filename" required />
				<button type="submit" class="btn btn-default">업로드</button>
			</form>
		</div>


		<div class="info">
			<form action="/main/user/info_update">
				<div class="form-group">
					<label for="name">이름</label><input type="text"
						class="form-control w200" id="name" name="name" placeholder="이름"
						value="${user.name}" />
				</div>
				<div class="form-group">
					<label for="website">웹사이트</label><input type="text"
						class="form-control w200" id="website" name="website"
						placeholder="웹사이트" value="${user.website}" />
				</div>
				<div class="form-group">
					<label for="intro">소개</label><input type="text"
						class="form-control w200" id="intro" name="intro" placeholder="소개"
						value="${user.introduce}" />
				</div>
				<button type="submit" style="margin-left: 250px;"
					class="btn btn-default">완료</button>
			</form>
		</div>
	</div>

	<div id="footer">
		<%@ include file="../../include/bottom.jsp"%>
	</div>
</body>
</html>

<!-- <label for="ex_file" style="margin-left: 90px; width: 370px;">프로필
				사진 바꾸기</label> <input type="file" id="ex_file"> -->
<%-- <form action="/main/user/image_insert" method="post"
				enctype="multipart/form-data" autocomplete="off">
				<input multiple="multiple" value="프로필 사진 바꾸기" type="file"
					name="files" required class="btn btn-default"
					style="margin-left: 90px; width: 370px;" />
			</form> --%>