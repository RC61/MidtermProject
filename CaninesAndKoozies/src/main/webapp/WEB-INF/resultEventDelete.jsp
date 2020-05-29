<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Your Event</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/resultEventDelete.css">
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
<jsp:include page="navLoggedIn.jsp" />
<jsp:include page="bootstrapHead.jsp" />

<div class = "result1">
 <div class = "container-fluid">

	<h4>${result}</h4>
	</div>
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