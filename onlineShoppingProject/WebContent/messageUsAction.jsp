<%@page import ="onlineShoppingProject.ConnectionProvider"%>
<%@page import ="java.sql.*"%>

<%
	String email=session.getAttribute("email").toString();
	String subject=request.getParameter("subject");
	String body=request.getParameter("body");
	
	try{
		Connection con=ConnectionProvider.getCon();
		PreparedStatement pr=con.prepareStatement("insert into message (email, subject, body) values (?,?,?)");
		pr.setString(1, email);
		pr.setString(2, subject);
		pr.setString(3, body);
		
		pr.executeUpdate();
		
		response.sendRedirect("messageUs.jsp?msg=valid");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("messageUs.jsp?msg=invalid");
	}
%>