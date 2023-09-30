<%@page import ="java.sql.*"%>
<%@page import="onlineShoppingProject.ConnectionProvider"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<% 
	String msg = request.getParameter("msg");
	if("done".equals(msg)){
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<% }
	if("wrong".equals(msg)){	
%>
<h3 class="alert">Your Password is wrong!</h3>
<% } %>
<form action = "changeSecurityQuestionAction.jsp" method = "post">
<h3>Select Your New Securtiy Question</h3>
  <select class="input-style" name="securityQuestion" required>
	<option value="What is your first car?">What is your first car?</option>
	<option value="What is name of your first pet?">What is name of your first pet?</option>
	<option value="What elementry school did you attend?">What elementry school did you attend?</option>
	<option value="What is the name of town where you were born?">What is the name of town where you were born?</option>
	</select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="answer" placeholder="Enter your answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
<input class="input-style" type="text" name="password" placeholder="Enter your password" required>
<hr>
 <button class="button" type="submit">save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>