<%@page import ="java.sql.*"%>
<%@page import="onlineShoppingProject.ConnectionProvider"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>
<%
	String msg = request.getParameter("msg");
	if("noMatch".equals(msg)){
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<% }
	if("wrong".equals(msg)){
%>
<h3 class="alert">Your old Password is wrong!</h3>
<% }
	if("done".equals(msg)){
%>
<h3 class="alert">Password change successfully!</h3>
<% }
	if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<% } %>

<form action = "changePasswordAction.jsp" method="">
<h3>Enter Old Password</h3>
 <input class="input-style" type = "text" name="oldPassword" placeholder="enter old password" required>
  <hr>
 <h3>Enter New Password</h3>
  <input class="input-style" type = "text" name="newPassword" placeholder="enter old password" required>
  <hr>
<h3>Enter Confirm Password</h3>
 <input class="input-style" type = "text" name="confirmPassword" placeholder="enter old password" required>
<hr>
 <button class="button" type = "submit" >save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>