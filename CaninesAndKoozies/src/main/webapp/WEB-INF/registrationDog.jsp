<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register your dog</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/registrationDog.css">

<!--Title  -->
<link
	href="https://fonts.googleapis.com/css2?family=Vast+Shadow&display=swap"
	rel="stylesheet">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">

<%@ include file="navLoggedIn.jsp"%>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	
		<div class="hero-image">
			<div class="hero-text">
				<h1>Canines and Koozies</h1>
			</div>
		</div>

		<div class="pageRegistration">
			<form action="registerUsersDog.do" method="POST">
				<table>
					<tr>
						<td>Dog's Name:</td>
					</tr>
					<tr>
						<td><input type="text" name="name" size="30" /></td>
					</tr>
					<tr>
						<td>Breed:</td>
					</tr>
					<tr>
						<td><input type="text" name="breed" size="30" /></td>
					</tr>
					<tr>
						<td>Size:</td>
					</tr>
					<tr>
						<td><input type="text" name="size" size="30" /></td>
					</tr>
					<tr>
						<td>Picture URL:</td>
					</tr>
					<tr>
						<td><input type="text" name="dogPicture" size="30" /></td>
					</tr>
				</table>

				<input type="submit" class="button" value="Submit" />
			</form>

		</div>

		<div class="footer">
			<div class="footerText">
				<a class="footerText" href="about.do">About Us</a> <a
					class="footerText" href="nightCatNightCap.do">Coming soon to
					NYC</a>
				<jsp:include page="bootstrapFoot.jsp" />
			</div>
		</div>

</body>
</html>