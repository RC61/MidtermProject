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
	href="${pageContext.request.contextPath}/css/updateEvent.css">

<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">

<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
	<%@ include file="navLoggedIn.jsp"%>
	<div class="pageContainer">
		<form action="forwardEventForUpdate.do" method="POST">

			<input type="hidden" value="${event.id }" name="id"> <input
				type="hidden" value="${event.createDate }" name="createDateToParse">
			<input type="hidden" value="${event.userCreated.id}"
				name="userCreatedId">
			<table>
				<tr>
					<td>Event Name:</td>
				</tr>
				<tr>
					<td><input type="text" name="name" size="50"
						value="${event.name }" /></td>
				</tr>
				<tr>
					<td>Event Date and Time:</td>
				</tr>
				<tr>
					<td><input type="datetime-local" name="eventDate" size="50"
						value="${event.eventDateTime }" /></td>
				</tr>
				<tr>
					<td>Dog Size Preference:</td>
				</tr>
				<tr>
					<td><c:choose>
							<c:when test='${event.dogSizePreference == "small" }'>
								<label><input type="radio" name="dogSizePreference"
									value="small" checked>Small</label>
							</c:when>
							<c:otherwise>
								<label><input type="radio" name="dogSizePreference"
									value="small">Small</label>
							</c:otherwise>
						</c:choose> <c:choose>
							<c:when test='${event.dogSizePreference == "medium" }'>
								<label><input type="radio" name="dogSizePreference"
									value="medium" checked>Medium</label>
							</c:when>
							<c:otherwise>
								<label><input type="radio" name="dogSizePreference"
									value="medium">Medium</label>
							</c:otherwise>
						</c:choose> <c:choose>
							<c:when test='${event.dogSizePreference == "large" }'>
								<label><input type="radio" name="dogSizePreference"
									value="large" checked>Large</label>
							</c:when>
							<c:otherwise>
								<label><input type="radio" name="dogSizePreference"
									value="large">Large</label>
							</c:otherwise>
						</c:choose> <c:choose>
							<c:when test='${event.dogSizePreference == "no preference" }'>
								<label><input type="radio" name="dogSizePreference"
									value="no preference" checked>No Preference</label>
							</c:when>
							<c:otherwise>
								<label><input type="radio" name="dogSizePreference"
									value="no preference">No Preference</label>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td>Singles Only Preference:</td>
				</tr>
				<tr>
					<td><c:choose>
							<c:when test='${event.singleOnlyPreference == true }'>
								<label><input type="radio" name="singleOnlyPreference"
									value="1" checked>Singles Only</label>
							</c:when>
							<c:otherwise>
								<label><input type="radio" name="singleOnlyPreference"
									value="1">Singles Only</label>
							</c:otherwise>
						</c:choose> <c:choose>
							<c:when test='${event.singleOnlyPreference == false }'>
								<label><input type="radio" name="singleOnlyPreference"
									value="0" checked>No Preference</label>
							</c:when>
							<c:otherwise>
								<label><input type="radio" name="singleOnlyPreference"
									value="0">No Preference</label>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td>Event picture URL:</td>
				</tr>
				<tr>
					<td><input type="text" name="pictureURL" size="100"
						value="${event.pictureURL}" /></td>
				<tr>
					<td>Please select a venue:</td>
				</tr>
				<tr>
					<td><c:forEach items="${venues }" var="venue">

							<c:choose>
								<c:when test='${event.venue == venue }'>
									<label><input type="radio" name="venue.id"
										value="${venue.id }" checked>${venue.name }</label>
								</c:when>
								<c:otherwise>
									<label><input type="radio" name="venue.id"
										value="${venue.id }">${venue.name }</label>
								</c:otherwise>
							</c:choose>

						</c:forEach></td>
				</tr>
				<tr>
					<td>Please describe your event:</td>
				</tr>
				<tr>
					<td><input type="text" name="description" size="100"
						value="${event.description}"></td>
				</tr>

			</table>
			<input type="submit" class="button" value="Submit" />
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