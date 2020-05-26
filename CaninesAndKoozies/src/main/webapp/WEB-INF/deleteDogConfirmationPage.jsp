<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Remove ${dog.name} From Profile</title>
</head>
<body>
<h3>Are you sure you want to remove ${dog.name} from your profile?</h3>

<form action ="deleteDog.do" method="POST">
<input type="submit" class="button" value="Yes" />
<input type = "hidden" value = "${dog.id }" name = "id">
</form>

<form action ="home.do" method="POST">
<input type="submit" class="button" value="Nevermind take me back home" />
</form>
</body>
</html>