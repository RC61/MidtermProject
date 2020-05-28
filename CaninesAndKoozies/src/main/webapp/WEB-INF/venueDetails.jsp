<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/venueDetails.css">

<title>${venue.name }</title>
</head>
<body>
	<%@ include file="navLoggedIn.jsp"%>
	<jsp:include page="bootstrapHead.jsp" />

	<div class="page">

		<img src="${venue.pictureURL }" class="imageOfVenue">



		<p>
		<h1>${venue.name }</h1>
		</p>
		<p>
			<a href="${venue.venueLink }" target="_blank">Visit ${venue.name}</a>
		</p>
		<p>
			<c:choose>
				<c:when test="${venue.alcoholProvided == true }">
	
		This venue has partnered with us to provide alcoholic beverages at a discounted price. 
		Please do not bring your own drinks to this establishment.
	</c:when>
				<c:otherwise>
		BYOB or anything you'd like. We will provide snacks!
	</c:otherwise>
			</c:choose>
		</p>


		<div class="footer">
			<div class="footerText">
				<a class="footerText" href="about.do">About Us</a> <a
					class="footerText" href="nightCatNightCap.do">Coming soon to
					NYC</a>
				<jsp:include page="bootstrapFoot.jsp" />
			</div>
		</div>

	</div>
	<%@ include file="bootstrapFoot.jsp"%>
</body>
</html>