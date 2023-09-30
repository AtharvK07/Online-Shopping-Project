<%@page import ="java.sql.*"%>
<%@page import="onlineShoppingProject.ConnectionProvider"%>

<%
	String email=session.getAttribute("email").toString();
	String securityQuestion=request.getParameter("securityQuestion");
	String answer = request.getParameter("answer");
	String password = request.getParameter("password");
	int check = 0;
	
	try{
		Connection con=ConnectionProvider.getCon();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from users where  email='"+email+"' and password='"+password+"' ");
		while(rs.next()){
			check=1;
			stmt.executeUpdate("update users set securtyQuestion='"+securityQuestion+"', answer='"+answer+"'where email='"+email+"' ");
			response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
		}
		if(check==0){
			response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
		}
		
	}
	catch(Exception e){
		System.out.println(e);
	}
%>