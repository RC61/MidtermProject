<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${! empty events }">
			<div class="column">
				<div class="card">
					<c:forEach var="event" items="${events }">
						<h1>${event.name }</h1>
						<a href="searchId.do?id=${event.id}">
						<img src=${event.pictureURL } style="width: 100%">
						</a>
					</c:forEach>
				</div>
			</div>
		</c:when>
	</c:choose>
</body>
</html>