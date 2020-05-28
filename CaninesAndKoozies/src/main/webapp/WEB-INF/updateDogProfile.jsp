<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update ${dog.name }'s Profile</title>
<%@ include file="navLoggedIn.jsp"%>
<jsp:include page="bootstrapHead.jsp" />


<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/deleteDogAndConfirmation.css">

<!--Title  -->
<link
	href="https://fonts.googleapis.com/css2?family=Vast+Shadow&display=swap"
	rel="stylesheet">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">
</head>


</head>
<body>
	<div class="page">
		<h3>Update ${dog.name }'s Profile</h3>
		<form action="updateDog.do" method="POST">
			<input type="hidden" value="${dog.id }" name="id">
			<div class="tableFont">
				<table>
					<tr>
						<td>Name:</td>
					</tr>
					<tr>
						<td><input type="text" name="name" size="30"
							value="${dog.name }" /></td>
					</tr>
					<tr>
						<td>Breed:</td>
					</tr>
					<tr>
						<td><input type="text" name="breed" size="30"
							value="${dog.breed }" /></td>
					</tr>
					<tr>
						<td>Size:</td>
					</tr>
					<tr>
						<td><input type="text" name="size" size="30"
							value="${dog.size }" /></td>
					</tr>
					<tr>
						<td>Picture:</td>
					</tr>
					<tr>
						<td><input type="text" name="dogPicture" size="30"
							value="${dog.dogPicture }" /></td>
					</tr>

				</table>
				<input type="submit" class="button" value="Submit" />
			</div>
		</form>

		<div class="footer">
			<div class="footerText">
				<a class="footerText" href="about.do">About Us</a> <a
					class="footerText" href="nightCatNightCap.do">Coming soon to
					NYC</a>
				<jsp:include page="bootstrapFoot.jsp" />
			</div>
		</div>
	</div>
</body>
</html>