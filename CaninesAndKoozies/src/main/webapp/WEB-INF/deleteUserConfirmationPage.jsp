<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete ${user.username} Profile</title>


<jsp:include page="bootstrapHead.jsp" />

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/createNewDogPage.css">

<!--Title  -->
<link
	href="https://fonts.googleapis.com/css2?family=Vast+Shadow&display=swap"
	rel="stylesheet">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">





</head>
<body>
<%@ include file="navLoggedIn.jsp" %>
<h3>${user.username } Are you sure you want to delete your profile?</h3>

<form action ="deleteUser.do" method="POST">
<input type="submit" class="button" value="Yes" />
<input type = "hidden" value = "${user.id }" name = "id">
</form>

<form action ="home.do" method="POST">
<input type="submit" class="button" value="Nevermind take me back home" />
</form>


<div class="footer">
		<div class="footerText">
			<a class="footerText" href="about.do">About Us</a> <a
				class="footerText" href="nightCatNightCap.do">Coming soon to NYC</a>
			<jsp:include page="bootstrapFoot.jsp" />
		</div>
	</div>


</div>


</body>
</html>