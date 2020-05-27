<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<nav class="navbar sticky-top navbar-expand-lg" style="background-color: #38228c;">


    <ul class="navbar-nav">
    
      
      <li class="nav-item active">
        <a class="nav-link" href="#">
        <button type="button" class="btn btn-dark">${user.username }</button> <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="home.do">
        <button type="button" class="btn btn-secondary">Home</button> <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="createEvent.do">
        <button type="button" class="btn btn-secondary">Create Event</button></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="logout.do">
        <button type="button" class="btn btn-secondary">Logout</button></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" type="button" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <button type="button" class="btn btn-secondary">Profile</button>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="userAndDogProfileView.do">View Profile</a>
          <a class="dropdown-item" href="updateUserProfile">Update Profile</a>
          <a class="dropdown-item" href="https://www.youtube.com/watch?v=9sXlaBa75Iw">Easter Egg</a>
        </div>
      </li>
    </ul>
  </div>
</nav>