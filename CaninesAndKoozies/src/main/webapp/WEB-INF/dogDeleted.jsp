<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirmation</title>
<%@ include file="navLoggedIn.jsp" %>


<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/deleteDogAndConfirmation.css">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">
</head>


</head>
<body>
<div class = "page">
<h4>Your pup has been deleted.</h4>


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