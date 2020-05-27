<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update ${dog.name }'s Profile</title>
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>
<form action ="updateDog.do" method="POST">
<input type = "hidden" value = "${dog.id }" name = "id">
<table>
			<tr>
				<td>Name:</td>
			</tr>
			<tr>
				<td><input type="text" name="name" size="30" value = "${dog.name }" /></td>
			</tr>
			<tr>
				<td>Breed:</td>
			</tr>
			<tr>
				<td><input type="text" name="breed" size="30" value = "${dog.breed }" /></td>
			</tr>
			<tr>
				<td>Size:</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="size" size="30" value = "${dog.size }" />
				</td>
			</tr>
			<tr>
				<td>Picture:</td>
			</tr>
			<tr>
				<td>
				<input type="text" name="dogPicture" size="30" value = "${dog.dogPicture }" />
				</td>
			</tr>
			</table>
			<input type="submit" class="button" value="Submit" />
		</form>

</body>
</html>