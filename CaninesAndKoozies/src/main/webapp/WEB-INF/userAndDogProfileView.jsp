<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>
<%@ include file="navLoggedIn.jsp" %>
<jsp:include page="bootstrapHead.jsp" />
<h1>woo</h1>

<div class="row">
  <div class="column">
    <div class="card">
    	<c:choose>
			<c:when test = "${! empty user.userPicture }">   	
     			 <img src=${user.userPicture } alt=${user.fname } style="width:100%">
      		</c:when> 
      		<c:otherwise>
     			 <img src="https://i.imgur.com/IngcWEC.png" alt=${user.fname } style="width:100%">
      		</c:otherwise>
    	</c:choose>
      <div class="container">
        <h2>${user.fname } ${user.lname }</h2>
        <p>${user.birthDate }</p>
        <p>${user.relationshipStatus }</p>
        <p>${user.alcoholPreference }</p>
        <p>${user.username }</p>

        <form action = "userUpdatedPage.do" method = "GET">
					<input type = "submit" value = "Update User">
					<input type = "hidden" value = "${user.id }" name = "id">
				</form>
				
        <form action = "confirmDeleteUser.do" method = "GET">
					<input type = "submit" value = "Delete User">
					<input type = "hidden" value = "${user.id }" name = "id">
				</form>

      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
    <c:choose>
		<c:when test = "${! empty dogs }">
		<c:forEach var = "dog" items = "${dogs }" >
		<c:choose>
			<c:when test = "${! empty dog.dogPicture }">
				<img src=${dog.dogPicture } style="width:100%">
			</c:when>
			<c:otherwise>
				<img src="https://i.imgur.com/hhRHTjv.png" style="width:100%">			
			</c:otherwise>
		</c:choose>
      <div class="container">
        <h2>${dog.name }</h2>
        <p>${dog.breed}</p>
        <p>${dog.size}</p>
        <p><class="button">
        <form action = "dogUpdatedPage.do" method = "GET">
					<input type = "submit" value = "Update Dog">
					<input type = "hidden" value = "${dog.id }" name = "id">
				</form></class></p>
         <p><class="button">
        <form action = "confirmDeleteDog.do" method = "GET">
					<input type = "submit" value = "Delete Dog">
					<input type = "hidden" value = "${dog.id }" name = "id">
				</form></class></p>
        </c:forEach>
        </c:when>
        </c:choose>
         <p><class="button">
        <form action = "createDogPage.do" method = "GET">
					<input type = "submit" value = "Add New Dog">
					<input type = "hidden" value = "${user.id }" name = "id">
				</form></class></p>      </div>
    </div>
  </div>
  
  <div class="eventsList">
  <h3>Your Events</h3>
     <c:choose>
		<c:when test = "${! empty events }">
		<c:forEach var = "event" items = "${events }" >
		
        <h2>${event.name }</h2>
		<c:choose>
					<c:when test="${! empty event.pictureURL}">
						<a href="searchId.do?id=${event.id}">
							<img src ="${event.pictureURL}">
						</a>
					</c:when>
					<c:otherwise>
						<a href="searchId.do?id=${event.id}">
							<img src = "https://cdn.pixabay.com/photo/2017/03/24/12/58/thirst-2171119_1280.jpg">
						</a>
					</c:otherwise>
				</c:choose>	
		<form action = "removeEventFromList.do" method = "GET">
					<input type = "submit" value = "Remove Event From List">
					<input type = "hidden" value = "${event.id }" name = "id">
				</form>
        </c:forEach>
        </c:when>
        <c:otherwise>
        You do not have any events yet! Click <a href="viewAllEvents.do">here</a> to browse.
        </c:otherwise>
        </c:choose>
  
  </div>

</body>
</html>