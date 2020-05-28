<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${event.name } Details</title>
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/eventDetails.css">
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
<jsp:include page= "bootstrapHead.jsp"/>
<%@ include file="navLoggedIn.jsp" %>


<input type = "hidden" value = "${event.createDate}">

<div class = "container-fluid">

<div class = "row" id = "details">
	<div class="col-md-6">
	<table>
			<tr>
				<td ><h3>${event.name }</h3></td>
			</tr>
			<tr>
				<td ><h4>Venue:</h4></td>
			</tr>
			<tr>
				<td><a href="searchVenueId.do?id=${event.venue.id}" >${event.venue.name }</a></td>
			</tr>
			<tr>
				<td ><h4>Event Date and Time:</h4></td>
			</tr>
			<tr>
				<td>${event.eventDateTime }</td>
			</tr>
			<tr>
				<td  ><h4>Dog Size Preference:</h4></td>
			</tr>
			<tr>
				<td>
					${event.dogSizePreference}
				</td>
			</tr>
			<tr>
				<td ><h4>Is the event for singles only:</h4></td>
			</tr>
			<tr>
				<td>
				<c:choose>
					<c:when test="${event.singleOnlyPreference == true }">
						Yes
					</c:when>
					<c:otherwise>
						No
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
			<tr><td><h4>Description:</h4></td></tr>
			<tr>
				<td>
				${event.description }
				</td>
			</tr>
			<tr>
				<td ><h4>
				Organized by:
				</h4></td>
			</tr>
			<tr>
				<td>
				${event.userCreated.username}
				</td>
			</tr>
			<tr>
				<td ><h4>
				Attendees:
				</h4></td>
			</tr>
			</table>
			
			<div class="row">
			
				<c:forEach items = "${ event.userEvents}" var = "userEvent">
					<div class="column">
							<a href="viewTheirProfile.do?id=${userEvent.user.id}"><img src = "${userEvent.user.userPicture}" class="img-user"></a>
					</div>
				</c:forEach>
				
				
			
			</div>
			
			</div>
			<div class="col-md-6">
			
				<c:choose>
					<c:when test="${! empty event.pictureURL}">
			
						<img src = "${event.pictureURL }" width = "700" height = "350"/>
		
					</c:when>
					<c:otherwise>
						<img src = "https://cdn.pixabay.com/photo/2017/03/24/12/58/thirst-2171119_1280.jpg" width = "700" height = "350">
					</c:otherwise>
				</c:choose>
				<h4>Comments</h4>
			
					<c:forEach items = "${event.comments }" var = "comment">
						<p>${comment.user.username} says: ${comment.description}</p>
					</c:forEach>
					
					<c:choose>
						<c:when test="${! empty user }">
							<form action = "addComment.do" method = "POST" >
								<input type = "text" placeholder = "Add a Comment" name = "description">
								<input type = "hidden" value = "${user.id}" name = "userId">
								<input type = "hidden" value = "${event.id}" name = "eventId">
								<input type = "submit" value = "Submit">
							</form>
						</c:when>
						<c:otherwise>
							<h4><a href = "home.do">Login</a> or <a href = "register.do">Register</a> to add a comment.</h4>
						</c:otherwise>
					</c:choose>
  			
		
		
	<%-- 	<c:choose>
			<c:when test="${! empty event.pictureURL}">
						
				<img src ="${userEvent.event.pictureURL}">
					
			</c:when>
			<c:otherwise>
						
				<img src = "https://cdn.pixabay.com/photo/2017/03/24/12/58/thirst-2171119_1280.jpg">
						
			</c:otherwise>
		</c:choose> --%>	 
		
		</div>
		</div>
		
		<c:choose>
			<c:when test="${event.userCreated == user && ! empty user }">
			<h3>This is your event! Would you like to:</h3>
				<form action = "updateEvent.do" method = "GET">
					<input type = "submit" value = "Update event">
					<input type = "hidden" value = "${event.id }" name = "id">
				</form>
				<form action = "deleteEvent.do" method = "GET">
					<input type = "submit" value = "Delete event">
					<input type = "hidden" value = "${event.id }" name = "id">
					
				</form>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${! empty user &&  event.userCreated.id != user.id  && !event.containsUser(user) }">
				<form action="signUpForEvent.do" method = "POST">
					<input type="submit" value="Sign Up For Event">
					<input type = "hidden" value = "${event.id }" name = "id">
				</form>
			</c:when>
		</c:choose>
	</div>
		
		<div class="footer">
			<div class="footerText">
				<a class="footerText" href="about.do">About Us</a> <a
				class="footerText" href="nightCatNightCap.do">Coming soon to NYC</a>
				<jsp:include page="bootstrapFoot.jsp" />
			</div>
		</div>
	<%@ include file="bootstrapFoot.jsp" %>	
</body>
</html>