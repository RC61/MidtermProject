<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Profile</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/userAndDogProfileViewStyles.css">

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
	<jsp:include page="bootstrapHead.jsp" />
	<div class="page">


		<div class="container-fluid pt-3">
			<div class="row justify-content-center">
				<div class="column">
					<c:choose>
						<c:when test="${! empty user.userPicture }">
							<img src=${user.userPicture } alt=${user.fname }>
						</c:when>
						<c:otherwise>
							<img src="https://i.imgur.com/IngcWEC.png" alt=${user.fname }>
						</c:otherwise>
					</c:choose>

					<h3>${user.fname }</h3>
					<p>Birthday: ${user.birthDate }</p>
					<p>Status: ${user.relationshipStatus }</p>
					<p>Favorite Drink: ${user.alcoholPreference }</p>
					<p>Username: ${user.username }</p>

					<form action="userUpdatedPage.do" method="GET">
						<input type="submit" class="button" value="Update User"> <input
							type="hidden" value="${user.id }" name="id">
					</form>

					<form action="confirmDeleteUser.do" method="GET">
						<input type="submit" class="button" value="Delete User"> <input
							type="hidden" value="${user.id }" name="id">
					</form>

				</div>





				<c:choose>
					<c:when test="${! empty dogs }">

						<c:forEach var="dog" items="${dogs }">
							<div class="column">
								<c:choose>
									<c:when test="${! empty dog.dogPicture }">
										<img src=${dog.dogPicture }>
									</c:when>
									<c:otherwise>
										<img src="https://i.imgur.com/hhRHTjv.png">
									</c:otherwise>
								</c:choose>

								<h3>${dog.name }</h3>
								<p>Breed: ${dog.breed}</p>
								<p>Size: ${dog.size}</p>
								<p>
								<form action="dogUpdatedPage.do" method="GET">
									<input type="submit" class="button" value="Update Dog">
									<input type="hidden" value="${dog.id }" name="id">
								</form>


								<form action="confirmDeleteDog.do" method="GET">
									<input type="submit" class="button" value="Delete Dog">
									<input type="hidden" value="${dog.id }" name="id">
								</form>
								</div>
						</c:forEach>

					</c:when>
				</c:choose>
				
				<div class="column">
				<img src="https://i.imgur.com/tTYOVM9.png">
				<form action="createDogPage.do" method="GET">
					<input type="submit" class="button" value="Add New Dog"> <input
						type="hidden" value="${user.id }" name="id">
				</form>
				</div>
			</div>

		</div>

	



	<h3>Your Events</h3>
	<c:choose>
		<c:when test="${! empty events }">
			<div class="container">
				<div class="row">
					<c:forEach var="event" items="${events }">
						<div class="col-md-4">
							<h6>${event.name }</h6>
							<c:choose>
								<c:when test="${! empty event.pictureURL}">
									<a href="searchId.do?id=${event.id}"> <img
										src="${event.pictureURL}">
									</a>
								</c:when>
								<c:otherwise>
									<a href="searchId.do?id=${event.id}"> <img
										src="https://cdn.pixabay.com/photo/2017/03/24/12/58/thirst-2171119_1280.jpg">
									</a>
								</c:otherwise>
							</c:choose>
							<form action="removeEventFromList.do" method="GET">
								<input type="submit" class="button"
									value="Remove Event From List"> <input type="hidden"
									value="${event.id }" name="id">
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:when>
		<c:otherwise>
        You do not have any events yet! Click <a href="viewAllEvents.do">here</a> to browse.
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