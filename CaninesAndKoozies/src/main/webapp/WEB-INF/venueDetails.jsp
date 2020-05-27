<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${venue.name }</title>
</head>
<body>
${venue.name }
<c:choose>
	<c:when test = "${venue.alcoholProvided == true }">
		We serve beer bitches
	</c:when>
	<c:otherwise>
		BYOB friendos
	</c:otherwise>
</c:choose>
<img src="${venue.pictureURL }">

<a href = "${venue.venueLink }">Visit ${venue.name}</a>

</body>
</html>