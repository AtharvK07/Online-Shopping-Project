<%@page import ="onlineShoppingProject.ConnectionProvider"%>
<%@page import ="java.sql.*"%>

<%
	String email = session.getAttribute("email").toString();
	String id = request.getParameter("id");
	try{
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		
		stmt.executeUpdate(" delete from cart where email = '"+email+"'  and product_id = '"+id+"' and address is NULL ");
		response.sendRedirect("myCart.jsp?msg=removed");
	}
	catch(Exception e){
		System.out.println(e);
	}
%>