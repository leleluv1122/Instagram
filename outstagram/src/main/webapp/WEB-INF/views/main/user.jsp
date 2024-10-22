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
<link
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.4.1/minty/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<link
	href="https://fonts.googleapis.com/css?family=Cute+Font|Poor+Story&display=swap&subset=korean"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/res/user.css" type="text/css">
<title>Outstagram</title>
<style>
.follow_d {
	height: 50px;
}
</style>
</head>
<body>
	<sec:authentication property="user.id" var="currentid" />
	<div id="contents">
		<div class="nav">
			<nav class="navbar navbar-expand-sm">
				<span class="title"> <a href="/main/user/${user.id}"
					class="title_ft" style="margin-right: 80px;">${user.userId}</a></span>
				<c:if test="${currentid == page_id}">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
								내정보 </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/main/logout_processing">로그아웃</a>
								<a class="dropdown-item" href="/main/membership_out">계정삭제</a> <a
									class="dropdown-item" href="/main/user/secret_user">계정공개범위</a>
							</div></li>
					</ul>
				</c:if>
			</nav>

		</div>

		<div class="profile">
			<div class="title_image">
				<c:choose>
					<c:when test="${user.profile_photo == null}">
						<img src="/images/noimage.png" class="profile_image"
							style="margin-right: 50px; float: left;">
					</c:when>
					<c:otherwise>
						<img src="/images/profile/${user.profile_photo}"
							class="profile_image" style="margin-right: 50px; float: left;">
					</c:otherwise>
				</c:choose>
			</div>

			<div class="txt">
				<span style="margin-left: 20px; color: gray;">${post_count}</span><br>
				<span style="margin-left: 8px;">게시물</span>
			</div>

			<div class="txt" style="cursor: pointer;"
				onclick="location.href='/main/user/follower/${page_id}'">
				<div class="follower_d"></div>
				<%-- <span style="margin-left: 20px;">${follower}</span><br> <span
					style="margin-left: 8px;">팔로워</span> --%>
			</div>

			<div class="txt" style="cursor: pointer;"
				onclick="location.href='/main/user/following/${page_id}'">
				<span style="margin-left: 20px;">${following}</span><br> <span
					style="margin-left: 8px;">팔로잉</span>
			</div>
		</div>

		<div class="_info">
			<span style="margin-left: 80px;">${user.introduce}</span><br /> <a
				href="${user.website}" style="margin-left: 80px; color: black;">${user.website}</a>
		</div>


		<c:choose>
			<c:when test="${page_id == currentid}">
				<div class="fix">
					<a href="update/${user.id}" class="btn btn-default"
						style="margin-left: 110px; width: 370px;">프로필 수정</a>
				</div>
			</c:when>

			<c:otherwise>
				<div class="follow_d"></div>
			</c:otherwise>
		</c:choose>
		<div class="posting">
			<c:choose>
				<c:when test="${currentid == page_id}">
					<c:choose>
						<c:when test="${post_count != 0}">
							<c:forEach var="p" items="${post}">
								<c:forEach var="pi" items="${post_image}">
									<c:if test="${p.id == pi.postId}">
										<div onclick="location.href='/main/post/${p.id}'">
											<img src="/images/${p.user.userId}/${pi.filename}"
												class="post_title">
										</div>
									</c:if>
								</c:forEach>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span>사진 공유</span>
							<br />
							<span>사진과 동영상을 공유하면 프로필에 표시됩니다.</span>
							<br />
							<a href="/main/upload">첫 번째 사진을 공유해보세요</a>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${user.enable == 2}">
							<c:choose>
								<c:when test="${follow == true}">
									<c:choose>
										<c:when test="${post_count != 0}">
											<c:forEach var="p" items="${post}">
												<c:forEach var="pi" items="${post_image}">
													<c:if test="${p.id == pi.postId}">
														<div onclick="location.href='/main/post/${p.id}'">
															<img src="/images/${p.user.userId}/${pi.filename}"
																class="post_title">
														</div>
													</c:if>
												</c:forEach>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<span
												style="font-size: 15px; font-weight: bold; margin-left: 5px;">게시물
												없음</span>
											<br />
											<br />
											<span>${user.userId}님이 게시하는 사진과 동영상이 여기에 표시됩니다.</span>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<span style="margin-left: 175px;"><b>비공개 계정입니다.</b></span>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${post_count != 0}">
									<c:forEach var="p" items="${post}">
										<c:forEach var="pi" items="${post_image}">
											<c:if test="${p.id == pi.postId}">
												<div onclick="location.href='/main/post/${p.id}'">
													<img src="/images/${p.user.userId}/${pi.filename}"
														class="post_title">
												</div>
											</c:if>
										</c:forEach>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<span
										style="font-size: 15px; font-weight: bold; margin-left: 5px;">게시물
										없음</span>
									<br />
									<br />
									<span>${user.userId}님이 게시하는 사진과 동영상이 여기에 표시됩니다.</span>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>

			<%-- <div class="fix">
					<c:choose>
						<c:when test="${follow == true}">
							<form action="/unfollow" name="form" method="post">
								<input type="hidden" value="${currentid}" name="user_id">
								<input type="hidden" value="${page_id}" name="page_id">
								<button class="btn btn-default" type="submit"
									style="margin-left: 110px; width: 180px; float: left;">언팔로잉</button>
							</form>
						</c:when>
						<c:otherwise>
							<form action="/follow" name="form" method="post">
								<input type="hidden" value="${currentid}" name="user_id">
								<input type="hidden" value="${page_id}" name="page_id">
								<button class="btn btn-default"
									style="margin-left: 110px; width: 180px; float: left;">팔로잉</button>
							</form>
						</c:otherwise>
					</c:choose>
					<a href="/main/user/message/${page_id}" class="btn btn-default"
						style="margin-left: 20px; width: 180px;">메시지</a>
				</div> --%>


			<%-- <c:choose>
						<c:when test="${post_count != 0}">
							<c:forEach var="p" items="${post}">
								<c:forEach var="pi" items="${post_image}">
									<c:if test="${p.id == pi.postId}">
										<div onclick="location.href='/main/post/${p.id}'">
											<img src="/images/${p.user.userId}/${pi.filename}"
												class="post_title">
										</div>
									</c:if>
								</c:forEach>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="empty" style="margin-top: 20px;">
								<c:choose>
									<c:when test="${currentid == page_id}">
										<span>사진 공유</span>
										<br />
										<span>사진과 동영상을 공유하면 프로필에 표시됩니다.</span>
										<br />
										<a href="/main/upload">첫 번째 사진을 공유해보세요</a>
									</c:when>
									<c:otherwise>
										<span
											style="font-size: 15px; font-weight: bold; margin-left: 5px;">게시물
											없음</span>
										<br />
										<br />
										<span>${page_userId}님이 게시하는 사진과 동영상이 여기에 표시됩니다.</span>
									</c:otherwise>
								</c:choose>
							</div>
						</c:otherwise>
					</c:choose> --%>
		</div>
		<div class="black" style="width: 500px; height: 600px;"></div>
	</div>

	<div id="footer">
		<%@ include file="../include/bottom.jsp"%>
	</div>
	<%@ include file="follow_s.jsp"%>
</body>
</html>