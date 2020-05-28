<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Dog</title>

<jsp:include page="bootstrapHead.jsp" />

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/createNewDogPage.css">

<!--Title  -->
<link
	href="https://fonts.googleapis.com/css2?family=Vast+Shadow&display=swap"
	rel="stylesheet">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">




</head>



<body>
<div class = "page">
	<%@ include file="navLoggedIn.jsp"%>
	<form action="createDog.do" method="POST">
	

	
		<h1>Your New Dog</h1>
		<div class="labelFont">
		<table>
			<tr>
				<td>Name:</td>
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
				<td>
				<label><input type="radio" name="size" value="small">Small</label> 
				<label><input type="radio" name="size" value="medium">Medium</label> 
				<label><input type="radio" name="size" value="large">Large</label></td>
			</tr>
			<tr>
				<td>Picture URL:</td>
			</tr>
			<tr>
				<td><input type="text" name="dogPicture" size="30" /></td>
			</tr>
			<tr>
		</table>
		<input type="submit" class="button" value="Submit" />
		</div>



	</form>
	
	
<div class="footer">
		<div class="footerText">
			<a class="footerText" href="about.do">About Us</a> <a
				class="footerText" href="nightCatNightCap.do">Coming soon to NYC</a>
			<jsp:include page="bootstrapFoot.jsp" />
		</div>
	</div>


</div>
</body>
</html>