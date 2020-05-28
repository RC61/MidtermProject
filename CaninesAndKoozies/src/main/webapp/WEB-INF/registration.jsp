<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>

<%@ include file="navLoggedIn.jsp"%>
<jsp:include page="bootstrapHead.jsp" />

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/registration.css">

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

	<div class="hero-image">
		<div class="hero-text">
			<h1>Canines and Koozies</h1>
		</div>
	</div>


	<div class="pageRegistration">
		<form action="registerUser.do" method="POST">
			<table>
				<tr>
					<td>Email:</td>
				</tr>
				<tr>
					<td><input type="text" name="email" size="30" /></td>
				</tr>
				<tr>
					<td>User name:</td>
				</tr>
				<tr>
					<td><input type="text" name="username" size="30" /></td>
				</tr>
				<tr>
					<td>Password:</td>
				</tr>
				<tr>
					<td><input type="password" name="password" size="30" /></td>
				</tr>
				<tr>
					<td>First Name:</td>
				</tr>
				<tr>
					<td><input type="text" name="fname" size="30" /></td>
				</tr>
				<tr>
					<td>Last Name:</td>
				</tr>
				<tr>
					<td><input type="text" name="lname" size="30" /></td>
				<tr>
					<td>Birthday:</td>
				</tr>
				<tr>
					<td><input type="date" name="birthday" size="30" /></td>
				</tr>
				<tr>
					<td>Address:</td>
				</tr>
				<tr>
					<td><label>Street<input type="text" name="street"
							size="30" /></label></td>
				</tr>
				<tr>
					<td><label>City<input type="text" name="city"
							size="30" /></label></td>
				</tr>
				<tr>
					<td><label>State<input type="text" name="state"
							size="30" /></label></td>
				</tr>
				<tr>
					<td><label>Zip Code<input type="text" name="zipCode"
							size="30" /></label></td>
				</tr>
				<tr>
					<td>Relationship Status:</td>
				</tr>
				<tr>
					<td><label><input type="radio"
							name="relationshipStatus" value="single">Single</label> <label><input
							type="radio" name="relationshipStatus" value="in a relationship">In
							a Relationship</label> <label><input type="radio"
							name="relationshipStatus" value="married">Married</label><br>

					</td>
				</tr>
				<tr>
					<td>Alcohol Preference:</td>
				</tr>
				<tr>
					<td><label><input type="radio"
							name="alcoholPreference" value="beer" />Beer</label> <label><input
							type="radio" name="alcoholPreference" value="wine" />Wine</label> <label><input
							type="radio" name="alcoholPreference" value="spirits" />Spirits</label>
						<label><input type="radio" name="alcoholPreference"
							value="no preference" />No Preference</label> <label><input
							type="radio" name="alcoholPreference" value="non drinker" />Non-drinker</label>
					</td>
				</tr>
				<tr>
					<td>Upload Your Picture:</td>
				</tr>
				<tr>
					<td><input type="text" name="userPicture" size="30" /></td>
				</tr>

				<input type="hidden" name="enabled" value="1" />

			</table>
			<input type="submit" class="button" value="Next" /> <input
				type="hidden" name="user" value="${user}" />
		</form>
	</div>

	<div class="footer">
		<div class="footerText">
			<a class="footerText" href="about.do">About Us</a> <a
				class="footerText" href="nightCatNightCap.do">Coming soon to NYC</a>
			<jsp:include page="bootstrapFoot.jsp" />
		</div>
	</div>
</body>
</html>