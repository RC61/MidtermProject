<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Canines and Koozies</title>
</head>
<body>
<h1>Canines and Koozies</h1>


<c:choose>
	<c:when test ="${! empty user}">
		<h3> Hello ${user.username}</h3>
		${user.fname}
		
		<form action = "search.do" method = "GET">
			<input type = "text" name = "keyword">
			<input type = "submit" value = "submit">
		</form>
		
		<form action = "createEvent.do" method = "GET">
			<input type = "submit" value = "Create event">
			
		</form>
		
		<form action = "logout.do" method = "GET">
			<input type = "submit" value = "Logout">
			
		</form>
		
		<c:choose>
		<c:when test = "${! empty user.userEvents }">
		
			<c:forEach var = "userEvent" items = "${user.userEvents}" >
				<h3>${userEvent.event.name}</h3>
				
				<c:choose>
					<c:when test="${! empty userEvent.event.pictureURL}">
						<a href="searchId.do?id=${userEvent.event.id}">
							<img src ="${userEvent.event.pictureURL}">
						</a>
					</c:when>
					<c:otherwise>
						<a href="searchId.do?id=${userEvent.event.id}">
							<img src = "https://cdn.pixabay.com/photo/2017/03/24/12/58/thirst-2171119_1280.jpg">
						</a>
					</c:otherwise>
				</c:choose>	
				
			</c:forEach>
		
		</c:when>
		
		<c:otherwise>
			<h1>No events at this time. Try creating one!</h1>
		</c:otherwise>
	
		</c:choose>
	</c:when>
	
	<c:otherwise>
	
	<form action = "login.do" method = "POST">
		<input type = "text" name = "username">
		<input type = "password" name = "password">
		<input type = "submit" value = "Login">
	</form>

	<form action = "register.do" method = "GET">
		<input type = "submit" value = "Register">
	</form>
	
	<form action = "search.do" method = "GET">
		<input type = "text" name = "keyword">
		<input type = "submit" value = "submit">
	</form>
	
	<c:choose>
		<c:when test = "${! empty events }">
		
			<c:forEach var = "event" items = "${events}" >
				<h3>${event.name}</h3>
				<c:choose>
					<c:when test="${! empty event.pictureURL}">
						<img src ="${event.pictureURL}">
					</c:when>
					<c:otherwise>
						No image found for event
					</c:otherwise>
				</c:choose>	
			</c:forEach>
		
		</c:when>
		
		<c:otherwise>
			<h1>No events at this time. Try creating one!</h1>
		</c:otherwise>
	
	</c:choose>

	</c:otherwise>
</c:choose> 

</body>
</html>