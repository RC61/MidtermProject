<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Anton&display=swap"
	rel="stylesheet">
	
<title>ERROR</title>

<jsp:include page="navLoggedIn.jsp"></jsp:include>

</head>
<body>
<p class="errorBody"> <strong>Uh Oh!</strong> Looks like there was an error</p>

<form action="home.do" method=GET>
<input type="submit" value="Back to Homepage">
	
</body>
</html>