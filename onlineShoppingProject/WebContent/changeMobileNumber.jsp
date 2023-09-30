<%@page import ="java.sql.*"%>
<%@page import="onlineShoppingProject.ConnectionProvider"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>change mobile number</title>
</head>
<body>
<%
	String msg=request.getParameter("msg");
	if("done".equals(msg)){
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<% }
	if("wrong".equals(msg)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<%	} %>

	<form action="changeMobileNumberAction.jsp" method="post">
	 <h3>Enter Your New Mobile Number</h3>
	<input class="input-style" type = "number" name="number"  placeholder="Enter Mobile number" required>
	 <hr>
	<h3>Enter Password (For Security)</h3>
	<input class="input-style" type = "text" name="password"  placeholder="Enter password" required>
	<hr>
	<button class="button" type="submit">save <i class='far fa-arrow-alt-circle-right'></i></button>
	</form>
</body>
<br><br><br>
</html>