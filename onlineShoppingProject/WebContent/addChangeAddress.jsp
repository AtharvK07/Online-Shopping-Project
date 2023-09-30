<%@page import ="java.sql.*"%>
<%@page import="onlineShoppingProject.ConnectionProvider"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>add change address</title>
</head>
<body>
<% 
	String msg = request.getParameter("msg");
	if("valid".equals(msg)){
%>
<h3 class="alert">Address Successfully Updated !</h3>
<% 	}
	if("invalid".equals(msg)){
%>
<h3 class="alert">Some thing Went Wrong! Try Again!</h3>
<% } %>
<%
	try{
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from users where email = '"+email+"' ");
		while(rs.next()){
			
%>
<form action="addChangeAddressAction.jsp" method = "post">
<h3>Enter Address</h3>
 <input class="input-style" type = "text" name="address" value="<%=rs.getString(7) %>" placeholder="Enter Address" required>
 <hr>
 <h3>Enter city</h3>
 <input class="input-style" type = "text" name="city" value="<%=rs.getString(8) %>" placeholder="Enter city" required>
<hr>
<h3>Enter State</h3>
<input class="input-style" type = "text" name="state" value="<%=rs.getString(9) %>" placeholder="Enter State" required>
<hr>
<h3>Enter country</h3>
<input class="input-style" type = "text" name="country" value="<%=rs.getString(10) %>" placeholder="Enter country" required>
<hr>
 <button class="button" type="submit">save<i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
<%
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
</body>
<br><br><br><br>
</html>