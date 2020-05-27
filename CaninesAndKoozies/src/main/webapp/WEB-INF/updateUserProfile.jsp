<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update ${user.username }'s Profile</title>
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>
<form action ="updateUser.do" method="POST">
<input type = "hidden" value = "${user.id }" name = "id">
<table>
			<tr>
				<td>First Name:</td>
			</tr>
			<tr>
				<td><input type="text" name="fname" size="30" value = "${user.fname }" /></td>
				
			</tr>
			<tr>
				<td>Last Name:</td>
			</tr>
			<tr>
				<td><input type="text" name="lname" size="30" value = "${user.lname }" /></td>
				
			</tr>
			<tr>
				<td>Username:</td>
			</tr>
			<tr>
				<td><input type="text" name="username" size="30" value = "${user.username }" /></td>
				
			</tr>
			<tr>
				<td>Password:</td>
			</tr>
			<tr>
				<td><input type="text" name="password" size="30" value = "${user.password }" /></td>
				
			</tr>
			<tr>
				<td>Email:</td>
			</tr>
			<tr>
				<td><input type="text" name="email" size="30" value = "${user.email }" /></td>
				
			</tr>
			<tr>
				<td>Alcohol Preference:</td>
			</tr>
			<tr>
				<td>
				
				<c:choose>
					<c:when test='${user.alcoholPreference == "beer" }'>
						<label><input type="radio"name="alcoholPreference" value="beer" checked>Beer</label> 
					</c:when>
					<c:otherwise>
						<label><input type="radio"name="alcoholPreference" value="beer">Beer</label> 
					</c:otherwise>				
				</c:choose>
				<c:choose>
					<c:when test='${user.alcoholPreference == "wine" }'>
						<label><input type="radio"name="alcoholPreference" value="wine" checked>Wine</label> 
					</c:when>
					<c:otherwise>
						<label><input type="radio"name="alcoholPreference" value="wine">Wine</label> 
					</c:otherwise>				
				</c:choose>
				<c:choose>
					<c:when test='${user.alcoholPreference == "spirits" }'>
						<label><input type="radio"name="alcoholPreference" value="spirits" checked>Spirits</label> 
					</c:when>
					<c:otherwise>
						<label><input type="radio"name="alcoholPreference" value="spirits">Spirits</label> 
					</c:otherwise>				
				</c:choose>
				<c:choose>
					<c:when test='${user.alcoholPreference == "no preference" }'>
						<label><input type="radio"name="alcoholPreference" value="no preference" checked>No Preference</label> 
					</c:when>
					<c:otherwise>
						<label><input type="radio"name="alcoholPreference" value="no preference">No Preference</label> 
					</c:otherwise>				
				</c:choose>
				<c:choose>
					<c:when test='${user.alcoholPreference == "non drinker" }'>
						<label><input type="radio"name="alcoholPreference" value="non drinker" checked>Non-drinker</label> 
					</c:when>
					<c:otherwise>
						<label><input type="radio"name="alcoholPreference" value="non drinker">Non-drinker</label> 
					</c:otherwise>				
				</c:choose>
				
				</td>
				
			</tr>
			<tr>
				<td>Relationship Status:</td>
			</tr>
			<tr>
				<td>
				<c:choose>
					<c:when test='${user.relationshipStatus == "single" }'>
						<label><input type="radio"name="relationshipStatus" value="single" checked>Single</label> 
					</c:when>
					<c:otherwise>
						<label><input type="radio"name="relationshipStatus" value="single">Single</label> 
					</c:otherwise>				
				</c:choose>
				<c:choose>
					<c:when test='${user.relationshipStatus == "in a relationship" }'>
						<label><input type="radio"name="relationshipStatus" value="in a relationship" checked>In a Relationship</label> 
					</c:when>
					<c:otherwise>
						<label><input type="radio"name="relationshipStatus" value="in a relationship">In a Relationship</label> 
					</c:otherwise>				
				</c:choose>
				<c:choose>
					<c:when test='${user.relationshipStatus == "married" }'>
						<label><input type="radio"name="relationshipStatus" value="married" checked>Married</label> 
					</c:when>
					<c:otherwise>
						<label><input type="radio"name="relationshipStatus" value="married">Married</label> 
					</c:otherwise>				
				</c:choose>
				</td>
				
			</tr>
			
			<tr>
				<td>Street:</td>
			</tr>
			<tr>
				<td><input type="text" name="street" value="${user.address.street }"> </td>
			</tr>
			<tr>
				<td>City:</td>
			</tr>
			<tr>
				<td><input type="text" name="city" value="${user.address.city }"> </td>
			</tr>
			<tr>
				<td>State:</td>
			</tr>
			<tr>
				<td><input type="text" name="state" value="${user.address.state }"> </td>
			</tr>
			<tr>
				<td>Zip Code:</td>
			</tr>
			<tr>
				<td><input type="text" name="zipCode" value="${user.address.zipCode }"> </td>
			</tr>

			</table>
			<input type="submit" class="button" value="Submit" />
		</form>

</body>
</html>