<%@page import ="onlineShoppingProject.ConnectionProvider"%>
<%@page import ="java.sql.*"%>

<%
	String email = session.getAttribute("email").toString();
	String status = "processing";
	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement pr = con.prepareStatement("update cart set status = ? where email = ? and status = 'bill'  ");
		pr.setString(1,status);
		pr.setString(2,email);
		pr.executeUpdate();
		response.sendRedirect("home.jsp");
	}
	catch(Exception e){
		System.out.println(e);
	}
%>