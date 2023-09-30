
<%@page import ="java.sql.*"%>
<%@page import="onlineShoppingProject.ConnectionProvider"%>

<%
	String oldPassword = request.getParameter("oldPassword");
	String newPassword = request.getParameter("newPassword");
	String confirmPassword = request.getParameter("confirmPassword");
	String email = session.getAttribute("email").toString();
	
	if(!confirmPassword.equals(newPassword)){
		response.sendRedirect("change.Password.jsp?msg=noMatch");
	}	
	else
	{
		int check = 0;
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from users where email = '"+email+"' and password='"+oldPassword+"' ");
			while(rs.next())
			{
				check = 1;
				stmt.executeUpdate("update users set password = '"+newPassword+"' where email = '"+email+"' ");
				response.sendRedirect("changePassword.jsp?msg=done");
			}
			if(check==0)
			{
				response.sendRedirect("changePassword.jsp?msg=wrong");
			}

		}
		catch(Exception e)
		{
			System.out.println(e);	
			response.sendRedirect("changePassword.jsp?msg=invalid");
		}
	}
%>