<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav>
	<a href="home.do">Home</a>
	<c:choose>
		<c:when test="${not empty user}">

			<div class="navbar">
				<a href="logout.do">Logout (Search Stub)</a>
				<div class="dropdown">
					<button class="dropbtn">${user.username }
					</button>
					<div class="dropdown-content">
						<a href="viewYourProfile.do">Your Profile</a> 
						<a href="viewYourProfile.do">Create Event Stub (Create Event Stub)</a>
						<a href="viewAllEvents.do">Browse Events</a>
						<a href="logout.do">Logout</a>

					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<a href="register.do">Register</a>
			<a href="viewAllEvents.do">Browse Events</a>
		</c:otherwise>
	</c:choose>
</nav>