<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success!</title>


<link
	href="https://fonts.googleapis.com/css2?family=Vast+Shadow&display=swap"
	rel="stylesheet">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">

<title>${event.name }Details</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/userAndDogRegistered.css">

	<jsp:include page="bootstrapHead.jsp" />

</head>
<body>
	<%@ include file="navLoggedIn.jsp"%>
	<div class="page">


		<h1>Welcome ${user.fname } and ${dog.name }!</h1>
		<c:choose>
			<c:when test="${! empty user}">
			<div class = "tableFont">
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
				</div>
			</c:when>

		</c:choose>



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