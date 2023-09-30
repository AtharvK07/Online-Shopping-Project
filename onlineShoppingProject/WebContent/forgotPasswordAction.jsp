<%@page import ="onlineShoppingProject.ConnectionProvider"%>
<%@page import ="java.sql.*"%>

<%
	String email = request.getParameter("email");
	String number1 = request.getParameter("number");
	String securityQuestion = request.getParameter("securtyQuestion");
	String answer = request.getParameter("answer");
	String password = request.getParameter("password");
	
	int check = 0;
	try{
		Connection con = ConnectionProvider.getCon();
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery("select * from users where email='"+email+"' and mobileNumber = '"+number1+"' and securtyQuestion = '"+securityQuestion+"' and answer = '"+answer+"' ");
		
		while(rs.next()){
			check = 1;
			stmt.executeUpdate("update users set password = '"+password+"' where email ='"+email+"' ");
			response.sendRedirect("forgatePassword.jsp?msg=done");
		}
		if(check == 0){
			response.sendRedirect("forgatePassword.jsp?msg=invalid");
		}
	}
	catch(Exception e){
		System.out.println(e);
	}
%>