<%@page import ="onlineShoppingProject.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
	<% 
		String msg = request.getParameter("msg");
		if("added".equals(msg)){
	%>
		<h3 class="alert">Product added successfully!</h3>
	<% } %>
	<% if("exist".equals(msg)){ %>
		<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
	<% } %>
	<% if("invalid".equals(msg)){ %>
	<h3 class="alert">Something went wrong! try again!</h3>
	<% } %>
	
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
	try{
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from product");
		while(rs.next())
		{
%>
          <tr>
            <td><%= rs.getString(1) %></td>
            <td><%= rs.getString(2) %></td>
            <td><%= rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%= rs.getString(4) %></td>
            <td><a href="addToCartAction.jsp?msg=<%= rs.getString(1) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<%
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>

*/The provided code is a JavaServer Pages (JSP) web page for an online shopping website's home page. Here's a very brief explanation of how it works:

1. **Import Statements**: The code includes import statements to import necessary Java classes and custom classes for database connection.

2. **HTML Structure**: It defines the HTML structure of the page, including the page title and some inline CSS styles.

3. **Message Handling**: The code checks for messages (e.g., "added," "exist," "invalid") in the query parameters of the URL. It displays different messages to the user based on the message type. For example, it displays messages when a product is successfully added to the cart or when a product already exists in the cart.

4. **Product Listing**: The code connects to the database and retrieves a list of products. It displays these products in a table, showing product details such as ID, name, category, price, and an option to add the product to the cart. The user can click the "Add to cart" link to add a product to their shopping cart.

5. **Database Interaction**: The code uses JDBC to establish a database connection, create a statement, and execute a query to fetch product data from the database. It then iterates through the result set and displays the product details in the HTML table.

6. **Styling**: The code includes some basic CSS styles to format the text and center it on the page.

This JSP page provides the home page for an online shopping website, allowing users to view a list of products, see product details, and add products to their shopping cart. The messages inform users about the status of their actions, such as successful product additions or warnings about existing products in the cart./*
