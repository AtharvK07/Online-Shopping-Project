<%@page import ="java.sql.*"%>
<%@page import="onlineShoppingProject.ConnectionProvider"%>

<%
 	String email = session.getAttribute("email").toString();
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String country = request.getParameter("country");
	
	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement pr = con.prepareStatement("update users set address=?, city=?, state=?, country=? where email=?");
		pr.setString(1, address);
		pr.setString(2, city);
		pr.setString(3, state);
		pr.setString(4, country);
		pr.setString(5, email);
		
		pr.executeUpdate();
		
		response.sendRedirect("addChangeAddress.jsp?msg=valid");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("addChangeAddress.jsp?msg=invalid");
	}
%>