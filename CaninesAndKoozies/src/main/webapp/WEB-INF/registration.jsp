<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
</head>
<body>
	<form action="register.do" method="POST">

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
				<td><input type="text" name="fName" size="30" /></td>
			</tr>
			<tr>
				<td>Last Name:</td>
			</tr>
			<tr>
				<td><input type="text" name="lName" size="30" /></td>
			<tr>
				<td>Birthday:</td>
			</tr>
			<tr>
				<td><input type="text" name="birthDate" size="30" /></td>
			</tr>
			<tr>
				<td>Relationship Status:</td>
			</tr>
			<tr>
				<td><input type="text" name="relationshipStatus" size="30" /></td>
			</tr>
			<tr>
				<td>Alcohol Preference:</td>
			</tr>
			<tr>
				<td><input type="text" name="alcoholPreference" size="30" /></td>
			</tr>
			<tr>
				<td>Upload Your Picture:</td>
			</tr>
			<tr>
				<td><input type="text" name="userPicture" size="30" /></td>
			</tr>

		</table>
</body>
</html>