<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${event.name }</title>
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>


<input type = "hidden" value = "${event.createDate}">

<table>
			<tr>
				<td>Event Name:</td>
			</tr>
			<tr>
				<td>${event.name }</td>
			</tr>
			<tr>
				<td>Venue:</td>
			</tr>
			<tr>
				<td><a href="searchVenueId.do?id=${event.venue.id}" >${event.venue.name }</a></td>
			</tr>
			<tr>
				<td>Event Date and Time:</td>
			</tr>
			<tr>
				<td>${event.eventDateTime }</td>
			</tr>
			<tr>
				<td>Dog Size Preference:</td>
			</tr>
			<tr>
				<td>
					${event.dogSizePreference}
				</td>
			</tr>
			<tr>
				<td>Is the event for singles only:</td>
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
			<tr>
				<td>
				${event.description }
				</td>
			</tr>
			<tr>
				<td>
				Organized by:
				</td>
			</tr>
			<tr>
				<td>
				${event.userCreated.username}
				</td>
			</tr>
			<tr>
				<td>
				Attendees:
				</td>
			</tr>
			<tr>
				<td>
				<c:forEach items = "${ event.userEvents}" var = "userEvent">
					
							<p>${userEvent.user.username}</p>
						
				</c:forEach>
				
				
				</td>
			</tr>
			<%-- <tr>
				<td><img src = "${event.pictureURL }"/></td>
				</tr> --%>
			<tr>
				<td>Comments</td>
			</tr>
			<tr>
				<td> 
					<c:forEach items = "${event.comments }" var = "comment">
						<p>${comment.user.username} says ${comment.description}</p>
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
  				</td>
			</tr>
			
		</table>
		
		<c:choose>
			<c:when test="${! empty event.pictureURL}">
						
				<img src ="${userEvent.event.pictureURL}">
					
			</c:when>
			<c:otherwise>
						
				<img src = "https://cdn.pixabay.com/photo/2017/03/24/12/58/thirst-2171119_1280.jpg">
						
			</c:otherwise>
		</c:choose>	
		
		<c:choose>
			<c:when test="${event.userCreated == user && ! empty user }">
			<h3>CREATOR OPTIONS:</h3>
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
</body>
</html>