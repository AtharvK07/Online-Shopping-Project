<%@page import ="onlineShoppingProject.ConnectionProvider"%>
<%@page import ="java.sql.*"%>

<%
	String email = session.getAttribute("email").toString();
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String country = request.getParameter("country");
	String number = request.getParameter("mobileNumber");
	String paymentMethod = request.getParameter("paymentMethod");
	String transactionId = "";
	transactionId = request.getParameter("transactionId");
	String status = "bill";
	
	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement pr = con.prepareStatement("update users set address = ? , city=? , state=? , country=?, mobileNumber =? where email = ?");
		pr.setString(1, address);
		pr.setString(2, city);
		pr.setString(3, state);
		pr.setString(4, country);
		pr.setString(5, number);
		pr.setString(6, email);
		pr.executeUpdate();
		
		PreparedStatement pr1 = con.prepareStatement("update cart set address = ? , city=? , state=? , country=?, mobileNumber =?, orderDate=now(), deliveryDate=DATE_ADD(orderDate, INTERVAL 7 DAY), paymentMethod=?, transactionId=?, status=? where email=? and address is NULL ");                                                                 
		pr1.setString(1,address);
		pr1.setString(2, city);
		pr1.setString(3, state);
		pr1.setString(4, country);
		pr1.setString(5, number); 
		pr1.setString(6, paymentMethod); 
		pr1.setString(7, transactionId); 
		pr1.setString(8, status); 
		pr1.setString(9, email);
		pr1.executeUpdate();
		
		response.sendRedirect("bill.jsp");
		
	}
	catch(Exception e){
		System.out.println(e);
	}
%>