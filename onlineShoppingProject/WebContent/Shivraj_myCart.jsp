<%@page import ="onlineShoppingProject.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

<% 
	String msg = request.getParameter("msg");
	if("notPossible".equals(msg)){
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<% }
	if("inc".equals(msg)){	
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<% }
	if("dec".equals(msg)){	
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<% }
	if("removed".equals(msg)){	
%>
<h3 class="alert">Product Successfully Removed!</h3>
<% } %>
<table>
<thead>
	<%
	String email1 = session.getAttribute("email").toString();
      int total = 0;
      int sno = 0;
      
      	try{
      		Connection con = ConnectionProvider.getCon();
      		Statement stmt = con.createStatement();
      		ResultSet rs1 = stmt.executeQuery("select sum(total) from cart where email = '"+email1+"' and address is NULL"); 
      		while(rs1.next()){
      			total = rs1.getInt(1);
      		}
      		
      
      %>
          <tr>
            <th scope="col" style="background-color: yellow;">Total:<i class="fa fa-inr"></i> <% out.println(total); %> </th>
           <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th> 
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"><i class="fa fa-inr"></i> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      	ResultSet rs = stmt.executeQuery("select product.name,product.category, product.price, cart.quantity,cart.total  from product inner join cart on product.id=cart.product_id ");
      	while(rs.next()){

      %>
          <tr>
          <% sno = sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %> </td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1) %>&quantity=dec"><i class='fas fa-plus-circle'></i></a> <%=rs.getInt(3) %> <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1) %>&quantity=inc"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getInt(5) %> </td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
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

*/Working of Above Code : 

The provided code appears to be part of a Java web application, and it seems to be a web page for an online shopping cart. Here's a short description of how this project works:

1. **JSP Technology**: This project uses JavaServer Pages (JSP) technology. JSP allows developers to embed Java code within HTML to create dynamic web pages.

2. **Import Statements**: The code includes Java import statements to use Java classes for database connections and SQL operations. It also includes import statements for a custom `ConnectionProvider` class, which presumably provides database connections.

3. **HTML Structure**: The code defines an HTML page where the content is generated dynamically based on data from a database.

4. **Messages Handling**: It checks for specific messages in the URL's query parameters (e.g., `msg=inc`, `msg=dec`, `msg=removed`) to display corresponding messages to the user. These messages might indicate that a product's quantity was increased, decreased, or that a product was removed from the cart.

5. **Database Interaction**: The code interacts with a database to retrieve information about the user's shopping cart. It retrieves product information (name, category, price, quantity) and calculates the subtotal for each item. It also calculates the total cost of all items in the cart.

6. **Display**: The retrieved information is displayed in a tabular format, showing the product name, category, price, quantity, subtotal, and an option to remove the product. Users can also change the quantity of items in the cart.

7. **Proceed to Order**: Users are provided with an option to "Proceed to order" by clicking a link. This suggests that the project likely has additional pages for handling the order and payment process.

8. **Styling**: The code includes some basic CSS styles for formatting, such as centering text and setting colors.

9. **Session Handling**: The code uses session attributes to identify the user by email and to keep track of the items in their shopping cart.

10. **Error Handling**: The code includes exception handling to deal with potential errors when accessing the database.

Overall, this JSP page is part of a larger web application for online shopping, allowing users to view and manage items in their cart before proceeding to make a purchase. It communicates with a database to retrieve and update cart information. Other parts of the project, not shown here, likely handle user registration, product selection, and order processing./*
