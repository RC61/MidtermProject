<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/searchResults.css">
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
<jsp:include page="bootstrapHead.jsp" />

<div class = "results1">
<div class = "container-fluid">
<h1>Results:</h1>
<br>



		<!-- PUT SOME USER SHIT HERE  -->
		<c:choose>
			<c:when test = "${! empty users || ! empty events }">
				<c:forEach var="user" items="${users}">
					<h1>Username: ${user.username}</h1>
					<h3>First Name: ${user.fname}</h3>
						<c:forEach var="dogs" items="${user.dogs}">
						<h3>Pups: ${dogs.name}</h3>
						</c:forEach>
					<form action="viewTheirProfile.do" method=GET>
						<input class = "button" type="submit" value="View User Profile"> <input
							type="hidden" name="id" value="${user.id}">
					</form>
							<br>
				</c:forEach>




		<!-- PUT SOME EVENT SHIT HERE  -->


				<c:forEach var="event" items="${events}">
					<h1>Event: ${event.name}</h1>
					<h3>Event Time: ${event.eventDateTime}</h3>
			<h3>Venue: ${event.venue.name}</h3> 
					<h3>Dog Size Preference: ${event.dogSizePreference}</h3>
					<img class = "pic" src="${event.pictureURL}" width="700" height="350">
			<form action="searchId.do" method=GET>
						<input class = "button" type="submit" value="View Full Event Details"> <input
							type="hidden" name="id" value="${event.id}">
					</form>
					<br>
				</c:forEach>
			</c:when>	
			<c:otherwise>
				<h3>No results found</h3>
			</c:otherwise>
		</c:choose>		
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