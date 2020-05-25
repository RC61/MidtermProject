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
<h1>woo</h1>

<div class="row">
  <div class="column">
    <div class="card">
      <img src=${user.userPicture } alt=${user.fname } style="width:100%">
      <div class="container">
        <h2>${user.fname } ${user.lname }</h2>
        <p>${user.birthDate }</p>
        <p>${user.relationshipStatus }</p>
        <p>${user.alcoholPreference }</p>
        <p>${user.username }</p>
        <p><button class="button">Stub Edit</button></p>
        <p><button class="button">Stub Delete</button></p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
    <c:choose>
		<c:when test = "${! empty dogs }">
		<c:forEach var = "dog" items = "${dogs }" >
		
		<img src=${dog.dogPicture } style="width:100%">
		
      <div class="container">
        <h2>${dog.name }</h2>
        <p>${dog.breed}</p>
        <p>${dog.size}</p>
        <p><button class="button">Stub Edit</button></p>
        <p><button class="button">Stub Delete</button></p>
        <p><button class="button">Stub Create</button></p>
        </c:forEach>
        </c:when>
        </c:choose>
      </div>
    </div>
  </div>
  
  <div class="eventsList">
  <h3>Your Events</h3>
     <c:choose>
		<c:when test = "${! empty events }">
		<c:forEach var = "event" items = "${events }" >
		
        <h2>${event.name }</h2>
		<img src=${event.pictureURL } style="width:100%">
		
        </c:forEach>
        </c:when>
        <c:otherwise>
        You do not have any events yet! Click <a href="viewAllEvents.do">here</a> to browse.
        </c:otherwise>
        </c:choose>
  
  </div>

</body>
</html>