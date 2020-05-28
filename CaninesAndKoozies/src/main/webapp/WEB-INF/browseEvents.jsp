<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Browse Events</title>


<jsp:include page="bootstrapHead.jsp" />

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/browseEventsPage.css">

<!--Title  -->
<link
	href="https://fonts.googleapis.com/css2?family=Vast+Shadow&display=swap"
	rel="stylesheet">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">


</head>
<body>
	<%@ include file="navLoggedIn.jsp"%>


	<div class="hero-image">
		<div class="hero-text">
			<h1>Canines and Koozies</h1>
		</div>
	</div>





	<div class="browseEvents">
		<form action="viewSinglesEvents.do" method="GET">
			<input type="submit" class="button"
				value="View events for Singles only">
		</form>
		<c:choose>
			<c:when test="${! empty events }">
				<div class="container">
					<div class="row">
						<c:forEach var="event" items="${events}">

							<div class="col-sm">
								<c:choose>
									<c:when test="${! empty event.pictureURL}">

										<a href="searchId.do?id=${event.id}"> <img
											src="${event.pictureURL}">
										</a>

										<h6>${event.name}</h6>

									</c:when>
									<c:otherwise>
										<a href="searchId.do?id=${event.id}"> <img
											src="https://cdn.pixabay.com/photo/2017/03/24/12/58/thirst-2171119_1280.jpg">
										</a>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
			</c:when>

			<c:otherwise>
				<h1>No events at this time. Try creating one!</h1>
			</c:otherwise>

		</c:choose>
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