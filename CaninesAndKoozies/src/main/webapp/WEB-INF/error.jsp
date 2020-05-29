<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<title>ERROR</title>

<jsp:include page="navLoggedIn.jsp"></jsp:include>
<jsp:include page="bootstrapHead.jsp" />
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/error.css">
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
<p class="errorBody"> <strong>Uh Oh!</strong> Looks like there was an error</p>
<center>
<iframe width="560" height="315" src="https://www.youtube.com/embed/ST2bbvLQp6Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
<form action="home.do" method=GET>
<input class = "button" type="submit" value="Back to Homepage">
	</form>
	<div class="footer">
			<div class="footerText">
				<a class="footerText" href="about.do">About Us</a> <a
				class="footerText" href="nightCatNightCap.do">Coming soon to NYC</a>
				<jsp:include page="bootstrapFoot.jsp" />
			</div>
		</div>
</body>
</html>