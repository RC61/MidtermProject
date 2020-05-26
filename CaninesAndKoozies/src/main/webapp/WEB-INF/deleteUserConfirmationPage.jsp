<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete ${user.username} Profile</title>
</head>
<body>
<h3>${user.username } Are you sure you want to delete your profile?</h3>

<form action ="deleteUser.do" method="POST">
<input type="submit" class="button" value="Yes" />
<input type = "hidden" value = "${user.id }" name = "id">
</form>

<form action ="home.do" method="POST">
<input type="submit" class="button" value="Nevermind take me back home" />
</form>
</body>
</html>