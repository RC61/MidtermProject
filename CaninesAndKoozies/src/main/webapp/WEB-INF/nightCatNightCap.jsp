<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Night Cat Night Cap</title>
<jsp:include page="bootstrapHead.jsp" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/nightCatNightCap.css">
<link href='http://fonts.googleapis.com/css?family=Lobster+Two'
	rel='stylesheet' type='text/css'>
</head>
<body>


	<h1>Night Cat</h1>
	<br></br>
	<h1>Night Cap</h1>

	<h4>Coming Soon to New York City</h4>

	<img src="https://i.imgur.com/Kyz0Jxf.png?1" class="lezlie" alt="lezlie"></img>

	<img src="https://i.imgur.com/Qroeewz.png?1" class="bubba" alt="bubba"></img>




	<form action="home.do" method="GET">
		<input type="submit" class="button" value="Back to Canines and Koozies" />
	</form>

	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>