<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${lookedUpUser.username }'s Profile</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/viewTheirProfile.css">
	
	<!--Title  -->
<link
	href="https://fonts.googleapis.com/css2?family=Vast+Shadow&display=swap"
	rel="stylesheet">

<!--Headers  -->
<link
	href="https://fonts.googleapis.com/css2?family=Sniglet&display=swap"
	rel="stylesheet">
</head>
<body class="body">
<%@ include file="navLoggedIn.jsp" %>
<jsp:include page="bootstrapHead.jsp" />
<div class="page">
<div class="row">
  <div class="column">
    <div class="card1">
    	<c:choose>
			<c:when test = "${! empty lookedUpUser.userPicture }">   	
     			 <img class="meh" src=${lookedUpUser.userPicture } alt=${lookedUpUser.fname }" width = "150" height = "200">
      		</c:when> 
      		<c:otherwise>
     			 <img src="https://i.imgur.com/IngcWEC.png" alt=${lookedUpUser.fname }">
      		</c:otherwise>
    	</c:choose>
      <div class="container">
        <h1>${lookedUpUser.fname } ${lookedUpUser.lname }</h1>
        <p>${lookedUpUser.birthDate }</p>
        <p>${lookedUpUser.relationshipStatus }</p>
        <p>${lookedUpUser.alcoholPreference }</p>
        <p>${lookedUpUser.username }</p>

      </div>
    </div>
  </div>

  <div class="column2">
   <h1>${lookedUpUser.fname }'s Dogs</h1>
    <c:choose>
		<c:when test = "${! empty dogs }">
		<c:forEach var = "dog" items = "${dogs }" >
		<c:choose>
			<c:when test = "${! empty dog.dogPicture }">
				<img class="dogImage" src=${dog.dogPicture } style="width:100%">
			</c:when>
			<c:otherwise>
				<img src="https://i.imgur.com/hhRHTjv.png" style="width:100%">			
			</c:otherwise>
		</c:choose>
      <div class="container">
        <h2>${dog.name }</h2>
        <p>${dog.breed}</p>
        <p>${dog.size}</p> 
        </c:forEach>
        </c:when>
        </c:choose>    
        </div>
    </div>

  
  <div class="eventsList">
  <h1>${lookedUpUser.fname }'s Events</h1>
     <c:choose>
		<c:when test = "${! empty events }">
		<c:forEach var = "event" items = "${events }" >
		
        <h2>${event.name }</h2>
		<c:choose>
					<c:when test="${! empty event.pictureURL}">
						<a href="searchId.do?id=${event.id}">
							<img class="eventImage" src ="${event.pictureURL}">
						</a>
					</c:when>
					<c:otherwise>
						<a href="searchId.do?id=${event.id}">
							<img src = "https://cdn.pixabay.com/photo/2017/03/24/12/58/thirst-2171119_1280.jpg">
						</a>
					</c:otherwise>
				</c:choose>	
	
        </c:forEach>
        </c:when>
        <c:otherwise>
       They do not have any events yet! 
        </c:otherwise>
        </c:choose>

  </div>
  </div>
			<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>