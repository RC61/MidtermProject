<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Browse Events</title>
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>

<form action = "viewSinglesEvents.do" method = "GET">
	<input type = "submit" value = "View events for Singles only">
</form>
	<c:choose>
		<c:when test = "${! empty events }">
		
			<c:forEach var = "event" items = "${events}" >
				<h3>${event.name}</h3>
				
				<c:choose>
					<c:when test="${! empty event.pictureURL}">
						<a href="searchId.do?id=${event.id}">
							<img src ="${event.pictureURL}">
						</a>
					</c:when>
					<c:otherwise>
						<a href="searchId.do?id=${event.id}">
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
</body>
</html>