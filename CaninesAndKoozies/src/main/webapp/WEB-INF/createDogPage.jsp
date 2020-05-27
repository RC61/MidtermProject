<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Dog</title>
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>
<form action="createDog.do" method="POST">
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
				<td><input type="text" name="size" size="30" /></td>
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
			
		

</form>

</body>
</html>