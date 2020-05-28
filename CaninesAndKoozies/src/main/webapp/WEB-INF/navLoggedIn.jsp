<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//netdna.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<nav class="navbar sticky-top navbar-toggleable-md "
	style="background-color: #6B7A8F;">
	<div>

		<div class="float-left">
			<a class="nav-link" href="home.do">
				<button type="button" class="btn btn-outline-light">Home</button>
			</a>
		</div>
		<div>
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" role="button"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">
						<button type="button" class="btn btn-outline-light">${user.username }</button>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item btn btn-primary" href="viewYourProfile.do">View Profile</a>
							<a class="dropdown-item btn btn-primary" href="userUpdatedPage.do">Update Profile</a> 
							<a class="dropdown-item btn btn-primary" href="https://www.youtube.com/watch?v=9sXlaBa75Iw">Easter Egg</a>
						<a class="dropdown-item btn btn-primary" href="createEvent.do">Create Event</a> 
						<a class="dropdown-item btn btn-outline-warning" href="logout.do">Logout</a>
      					

					</div></li>
			</ul>

		</div>

	</div>

	<div>
		<form class="form-inline" action = "search.do" method = "GET">
			<input class="form-control mr-sm-2" type="search" name="keyword"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>

</nav>


