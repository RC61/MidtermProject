<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
</head>
<body>


		<!-- PUT SOME USER SHIT HERE  -->

				<c:forEach var="user" items="${users}">
					<h1>Username: ${user.username}</h1>
					<h2>First Name: ${user.fname}</h2>
					<h2>Pups: ${user.dogs}</h2>
					<form action="userAndDogProfileView.do" method=GET>
						<input type="submit" value="View User Profile"> <input
							type="hidden" name="id" value="${user.id}">
					</form>
				</c:forEach>




		<!-- PUT SOME EVENT SHIT HERE  -->


				<c:forEach var="event" items="${events}">
					<h1>Event: ${event.name}</h1>
					<h2>Event Time: ${event.eventDateTime}</h2>
			<h2>Venue: ${event.venue.name}</h2> 
					<h2>Dog Size Preference: ${event.dogSizePreference}</h2>
					<img src="${event.pictureURL}">
	<form action="eventDetails.do" method=GET>
						<input type="submit" value="View Full Event Details"> <input
							type="hidden" name="id" value="${event.id}">
					</form>
				</c:forEach>

</body>
</html>