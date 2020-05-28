<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>
<h1>Our Vision</h1>

	<p> A website for dog and alcohol enthusiasts to organize and attend events. 
	Starting out in the greater Denver area across five pre-approved, licensed venues. 
	With possibly more coming soon!!</p>
	
<h1>Who We Are</h1>

<table>
	<tr>
		<td><img src = "https://i.imgur.com/gQfKQiO.jpg" width="300" height="300"></td>
		<td><img src = https://i.imgur.com/0YeHTR7.png width="300" height="300"></td>
		<td><img src = "https://i.imgur.com/6Jdukdk.png" width="300" height="300"></td>
	</tr>
	
	<tr>
		<td>
			<h3>Rory Coleman</h3>
			<h5>Repo Owner</h5>
			<p>bash-4.4$ [ $[ $RANDOM % 6 ] == 0 ] && rm -rf /* || echo *click* <br>
				How programmers play Russian roulette</p>
			<a href = "https://github.com/RC61">GitHub</a>
		</td>
		<td>
			<h3>Tabatha Flores</h3>
			<h5>Database Administrator</h5>
			<p>Tabatha worked as a medical biller before starting at Skill Distillery. 
			As a newcomer to programming, she enjoys the challenges that have come with learning something new 
			and always makes sure to have fun while doing so. In her spare time, Tabatha enjoys the beach, 
			working out and organizing! 
			</p>
			<a href = "https://github.com/TFLORES318">GitHub</a>
		</td>
		<td>
			<h3>Toni Papp</h3>
			<h5>Scrum Master</h5>
			<p>After working as a teacher and medical biller, Toni now finds herself at Skill
			Distillery learning software development. What started as a bid towards an 
			exciting new career turned into a fiery enthusiasm to learn all things coding.  </p>
			<a href = "https://github.com/arpapp">GitHub</a>
		</td>
	</tr>
	

</table>

</body>
</html>