<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update ${user.username }'s Profile</title>
</head>
<body>
<form action ="updateUser.do" method="POST">
<input type = "hidden" value = "${user.id }" name = "id">
<table>
			<tr>
				<td>First Name:</td>
			</tr>
			<tr>
				<td><input type="text" name="fname" size="30" value = "${user.fname }" /></td>
				
			</tr>
			<tr>
				<td>Last Name:</td>
			</tr>
			<tr>
				<td><input type="text" name="lname" size="30" value = "${user.lname }" /></td>
				
			</tr>
			<tr>
				<td>Username:</td>
			</tr>
			<tr>
				<td><input type="text" name="username" size="30" value = "${user.username }" /></td>
				
			</tr>
			<tr>
				<td>Password:</td>
			</tr>
			<tr>
				<td><input type="text" name="password" size="30" value = "${user.password }" /></td>
				
			</tr>
			<tr>
				<td>Email:</td>
			</tr>
			<tr>
				<td><input type="text" name="email" size="30" value = "${user.email }" /></td>
				
			</tr>

			</table>
			<input type="submit" class="button" value="Submit" />
		</form>

</body>
</html>