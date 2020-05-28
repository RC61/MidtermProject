<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Delete Confirmation</title>
<!--Headers  -->

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/deleteUserAndConfirmation.css">


<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">
<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
	<%@ include file="navLoggedIn.jsp"%>

	<div class="page">
		<h4>You Profile has been deleted</h4>

		<form action="logout.do" method="GET">
			<input type="submit" class="button"
				value="Back to Canines and Koozies">
		</form>
	</div>
	<div class="footer">
		<div class="footerText">
			<a class="footerText" href="about.do">About Us</a> <a
				class="footerText" href="nightCatNightCap.do">Coming soon to NYC</a>
			<jsp:include page="bootstrapFoot.jsp" />
		</div>
	</div>

</body>
</html>