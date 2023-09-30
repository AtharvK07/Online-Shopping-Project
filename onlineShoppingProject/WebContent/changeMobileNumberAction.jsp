<%@page import ="java.sql.*"%>
<%@page import="onlineShoppingProject.ConnectionProvider"%>

<%
	String email = session.getAttribute("email").toString();
	String number = request.getParameter("number");
	String password = request.getParameter("password");
	int check=0;
	try{
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("select * from users where email='"+email+"' and password='"+password+"' ");
		while(rs.next()){
			check=1;
			stmt.executeUpdate("update users set mobileNumber = '"+number+"' where email='"+email+"'");
			response.sendRedirect("changeMobileNumber.jsp?msg=done");
		}
		if(check==0){
			response.sendRedirect("changeMobileNumber.jsp?msg=done");
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>