<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
<title>ERROR</title>

<jsp:include page="navLoggedIn.jsp"></jsp:include>
<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
<p class="errorBody"> <strong>Uh Oh!</strong> Looks like there was an error</p>

<form action="home.do" method=GET>
<input type="submit" value="Back to Homepage">
	
</body>
</html>