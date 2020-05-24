<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Event</title>
</head>
<body>

<form method="POST">

		<table>
			<tr>
				<td>Event Name:</td>
			</tr>
			<tr>
				<td><input type="text" name="name" size="30" /></td>
			</tr>
			<tr>
				<td>Event Date and Time:</td>
			</tr>
			<tr>
				<td><input type="datetime-local" name="eventDateTime" /></td>
			</tr>
			<tr>
				<td>Dog Size Preference:</td>
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
				<td>Singles Only Preference:</td>
			</tr>
			<tr>
				<td>
				<label><input type="radio"name="singleOnlyPreference" value="1">Singles only</label> 
				<label><input type="radio" name="singleOnlyPreference" value="0">No preference</label> 
				</td>
			</tr>
			<tr>
				<td>Event picture URL:</td>
			</tr>
			<tr>
				<td><input type="text" name="pictureURL" size = "100" /></td>
			<tr>
				<td>Please select a venue:</td>
			</tr>
			<tr>
				<td> 
					<c:forEach items = "${venues }" var = "venue">
					
						<label><input type="radio"name="venue" value="${venue.name }">${venue.name }</label>
						<input type="hidden" value = "${venue.id}" name = "id">
					</c:forEach>
  				</td>
			</tr>
			
		</table>
		</form>
		<form action="forwardEventForCreation.do" method="POST">
			<input type="submit" class="button" value="Submit" />
		</form>
</body>
</html>