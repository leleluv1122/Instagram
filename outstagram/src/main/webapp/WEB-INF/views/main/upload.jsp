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
<!-- 개발버전, 도움되는 콘솔 경고를 포함. -->
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
<title>포스팅</title>
<style>
.contents {
	bottom: 6rem;
	width: 500px;
	height: 800px;
	margin: auto;
}

#footer {
	position: fixed;
	background-color: white; /*임의색상*/
	left: 0;
	right: 0;
	bottom: 0;
	height: 6rem;
}

input.form-control.w300 {
	width: 500px;
	height: 300px;
	font-size: 13px;
}

body {
	font-family: 'Poor Story', cursive;
}

.miribogi {
	width: 500px;
	height: 150px;
	border: 3px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
	display: none;
}

.miribogi span {
	font-size: 12px;
	font-weight: bold;
	display: inline-block;
	width: 90px;
}
</style>
</head>
<body>
	<div class="contents">
		<sec:authentication property="user.id" var="currentid" />
		<form action="/main/posting" method="post"
			enctype="multipart/form-data" autocomplete="off">
			<input type="hidden" id="userid" name="userid" value="${currentid}">

			<div class="form-group">
				<label for="file" style="margin-top: 50px;">파일 업로드 </label> <input
					multiple="multiple" type="file" id="gdsImg" name="files" required />
			</div>


			<div class="miribogi">
				<div class="select_img">
					<img src="">
				</div>
				<script>
					$("#gdsImg").change(
							function() {
								if (this.files && this.files[0]) {
									var reader = new FileReader;
									reader.onload = function(data) {
										$(".select_img img").attr("src",
												data.target.result).width(100);
									}
									reader.readAsDataURL(this.files[0]);
								}
							});
				</script>
				<button type="button" class="btn cancel_btn" style="float: right;">접기</button>
				<script>
					$(".cancel_btn").click(function() {
						$(".miribogi").slideUp();
						$(".orderOpne_bnt").slideDown();
					});
				</script>
			</div>

			<div class="orderOpne">
				<button type="button" class="btn orderOpne_bnt">
					<span style="margin: 4px;">업로드 메인 사진보기</span>
				</button>
				<script>
					$(".orderOpne_bnt").click(function() {
						$(".miribogi").slideDown();
						$(".orderOpne_bnt").slideUp();
					});
				</script>
			</div>

			<div class="form-group">
				<input type="text" class="form-control w300" id="description"
					style="margin-top: 5px;" name="description" placeholder="문구 입력..." />
			</div>

			<div class="form-group">
				<input type="text" class="form-control w200" id="location"
					name="location" placeholder="위치 추가" />
			</div>
			<button class="btn btn-primary" style="float: right;">완료</button>
		</form>
	</div>

	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
</body>
</html>