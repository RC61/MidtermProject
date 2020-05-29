<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Event</title>
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/createEvent.css">
<!--Title  -->
<link
	href="https://fonts.googleapis.com/css2?family=Vast+Shadow&display=swap"
	rel="stylesheet">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>
<div class = "form1">
<div class = "container-fluid">
<form action ="forwardEventForCreation.do" method="POST">

		<table>
			<tr>
				<td><h4>Event Name:</h4></td>
			</tr>
			<tr>
				<td><input type="text" name="name" size="30" /></td>
			</tr>
			<tr>
				<td><h4>Event Date and Time:</h4></td>
			</tr>
			<tr>
				<td><input type="datetime-local" name="eventDate" /></td>
			</tr>
			<tr>
				<td><h4>Dog Size Preference:</h4></td>
			</tr>
			<tr>
				<td>
				<label><input type="radio"name="dogSizePreference" value="small">Small</label> 
				<label><input type="radio" name="dogSizePreference" value="medium">Medium</label> 
				<label><input type="radio" name="dogSizePreference" value="large">Large</label>
				<label><input type="radio" name="dogSizePreference" value="no preference">No preference</label>
				</td>
			</tr>
			<tr>
				<td><h4>Singles Only Preference:</h4></td>
			</tr>
			<tr>
				<td>
				<label><input type="radio"name="singleOnlyPreference" value="1">Singles only</label> 
				<label><input type="radio" name="singleOnlyPreference" value="0">No preference</label> 
				</td>
			</tr>
			<tr>
				<td><h4>Event picture URL:</h4></td>
			</tr>
			<tr>
				<td><input type="text" name="pictureURL" size = "100" /></td>
			<tr>
				<td><h4>Please select a venue:</h4></td>
			</tr>
			<tr>
				<td> 
					<c:forEach items = "${venues }" var = "venue">
					
						<label><input type="radio" name="venueName" value="${venue.name }">${venue.name }</label>
						<input type="hidden" value = "${venue.id}" name = "venueId">
					</c:forEach>
  				</td>
			</tr>
			<tr><td><h4>Please describe your event:</h4></td>
			</tr>
			<tr>
				<td>
<!-- 					<input type = "text" name = "description">-->				
				<textarea name = "description" rows = "4" cols = "30"></textarea>
				</td>
			</tr>
			
		</table>
		<input type="submit" class="button" value="Submit" />
		</form>
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