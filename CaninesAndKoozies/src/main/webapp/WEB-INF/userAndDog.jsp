<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>
<jsp:include page="bootstrapHead.jsp" />
<h1>Welcome ${user.fname } and ${dog.name }!</h1>
	<c:choose>
		<c:when test="${! empty user}">
			<table>
				<tr>
					<td>Name: ${user.fname} ${user.lname }</td>
				</tr>
				<tr>
					<td>Username: ${user.username}</td>
				</tr>
				<tr>
					<td>Birthday: ${user.birthDate }</td>
				</tr>
				<tr>
					<td>Relationship Status: ${user.relationshipStatus}</td>
				</tr>
				<tr>
					<td>Alcohol Preferred: ${user.alcoholPreference }</td>
				</tr>
				<tr>
					<td>Dog Name: ${dog.name }</td>
				</tr>
				<tr>
					<td>Breed: ${dog.breed }</td>
				</tr>
				<tr>
					<td>Size: ${dog.size }</td>
				</tr>

			</table>
		</c:when>
		
	</c:choose>
	
			
	
<h2>woo!</h2>
</body>
</html>