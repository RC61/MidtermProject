<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>


<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">
	
	
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/aboutPage.css">


</head>
<body>
	<%@ include file="navLoggedIn.jsp"%>
	<jsp:include page="bootstrapHead.jsp" />
	<!-- <h1>Our Vision</h1>

	<p> A website for dog and alcohol enthusiasts to organize and attend events. 
	Starting out in the greater Denver area across five pre-approved, licensed venues. 
	With possibly more coming soon!!</p> -->



	<!-- <table>
	<tr>
		<td><img src = "https://i.imgur.com/gQfKQiO.jpg" width="300" height="300"></td>
		<td><img src = https://i.imgur.com/0YeHTR7.png width="300" height="300"></td>
		<td><img src = "https://i.imgur.com/6Jdukdk.png" width="300" height="300"></td>
	</tr>
	
	<tr>
		<td>
			<h3>Rory Coleman</h3>
			<h5>Repo Owner</h5>
			<p>Rory followed in his grandfather’s footsteps and joined the Army 
			after HighSchool where he served 8 years as a combat medic. After 
			leaving active duty and entering into the reserves, Rory obtained 
			his Bachelors while playing 2 years of Division 1 football at UCF. 
			Upon finishing his bachelor’s degree, he spent the next 2 years working 
			for a congressional committee in Washington D.C. Rory is now learning to 
			code at Skill Distillery.</p>
			<a href = "https://github.com/RC61">GitHub</a>
		</td>
		<td>
			<h3>Tabatha Flores</h3>
			<h5>Database Administrator</h5>
			<p>Tabatha worked as a medical biller before starting at Skill Distillery. 
			As a newcomer to programming, she enjoys the challenges that have come with learning something new 
			and always makes sure to have fun while doing so. In her spare time, Tabatha enjoys the beach, 
			working out and organizing. 
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
	

</table> -->

	<div class="about-section">
		<h1>About Us</h1>
		<p>A website for dog and alcohol enthusiasts to organize and
			attend events. Starting out in the greater Denver area across five
			pre-approved, licensed venues. With possibly more coming soon!</p>
	</div>

	<h2 style="text-align: center">Who We Are</h2>
	<div class="row">
		<div class="column">
			<div class="card">
				<img src="https://i.imgur.com/gQfKQiO.jpg" alt="Rory"
					style="width: 100%">
				<div class="container">
					<h2>Rory Coleman</h2>
					<p class="title">Repo Owner</p>
					<p>Rory worked in Washington D.C. before attending Skill Distillery.
					 Somewhat of an adrenaline junky, Rory enjoys contact sports and two-way petting zoos.
					 He likes Dogs and thinks Cats are ok too. He has never watched Game of Thrones. </p>
					<p>


						<a href="https://github.com/RC61">
							<button class="button">GitHub</button>
						</a>
					</p>
				</div>
			</div>
		</div>

		<div class="column">
			<div class="card">
				<img src="https://i.imgur.com/0YeHTR7.png" alt="Tabatha"
					style="width: 100%">
				<div class="container">
					<h2>Tabatha Flores</h2>
					<p class="title">Database Administrator</p>
					<p>Tabatha worked as a medical biller before starting at Skill
						Distillery. As a newcomer to programming, she enjoys the
						challenges that have come with learning something new and always
						makes sure to have fun while doing so. In her spare time, Tabatha
						enjoys the beach and working out.</p>
					<p>
						<a href="https://github.com/TFLORES318">
							<button class="button">GitHub</button>
						</a>
					</p>
				</div>
			</div>
		</div>

		<div class="column">
			<div class="card">
				<img src="https://i.imgur.com/6Jdukdk.png" alt="Toni"
					style="width: 100%">
				<div class="container">
					<h2>Toni Papp</h2>
					<p class="title">Scrum Master</p>
					<p>After working as a teacher and medical biller, Toni now
						finds herself at Skill Distillery learning software development.
						What started as a bid towards an exciting new career turned into a
						fiery enthusiasm to learn all things coding.</p>
					<p>
						<a href="https://github.com/arpapp">
							<button class="button">GitHub</button>
						</a>
					</p>

				</div>
			</div>
		</div>
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