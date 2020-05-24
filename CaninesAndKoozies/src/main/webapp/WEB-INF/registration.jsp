<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>
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
				<td><input type="text" name="password" size="30" /></td>
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
				<td><input type="text" name="birthDate" size="30" /></td>
			</tr>
			<tr>
				<td>Address:</td>
			</tr>
			<tr>
				<td><label><input type="text" name="street" size="30" />Street</label></td>
			</tr>
			<tr>
				<td><label><input type="text" name="city" size="30" />City</label></td>
			</tr>
			<tr>
				<td><label><input type="text" name="state" size="30" />State</label></td>
			</tr>
			<tr>
				<td><label><input type="text" name="zipCode" size="30" />Zip
						Code</label></td>
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
				<td><label><input type="checkbox"
						name="alcoholPreference" value="beer" />Beer</label> <label><input
						type="checkbox" name="alcoholPreference" value="wine" />Wine</label> <label><input
						type="checkbox" name="alcoholPreference" value="spirits" />Spirits</label>
					<label><input type="checkbox" name="alcoholPreference"
						value="no preference" />No Preference</label> <label><input
						type="checkbox" name="alcoholPreference" value="non drinker" />Non-drinker</label>
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
		<form action="registerUsersDog.do" method="POST">
			<input type="submit" class="button" value="Submit" /> <input
				type="hidden" name="user" value="${user.id}" />
		</form>
</body>
</html>