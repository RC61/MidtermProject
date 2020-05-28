<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Delete Confirmation</title>
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>
<jsp:include page="bootstrapHead.jsp" />
<h4>You Profile has been deleted</h4>

		<form action = "logout.do" method = "GET">
			<input type = "submit" value = "Press me">
			</form>

</body>
</html>