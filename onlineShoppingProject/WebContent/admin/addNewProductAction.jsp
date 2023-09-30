<%@page import = "onlineShoppingProject.ConnectionProvider" %>
<%@page import = "java.sql.*" %>

<% 
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String category = request.getParameter("category");
	String price = request.getParameter("price");
	String active = request.getParameter("active");
	
	try{
		Connection con = ConnectionProvider.getCon();
		
		PreparedStatement pr = con.prepareStatement("insert into product values (?,?,?,?,?)");
		pr.setString(1, id);
		pr.setString(2, name);
		pr.setString(3, category);
		pr.setString(4, price);
		pr.setString(5, active);
		
		pr.executeUpdate();
		 response.sendRedirect("addNewProduct.jsp?msg=done");
	}
	catch(Exception e){
		response.sendRedirect("addNewProduct.jsp?msg=wrong");
		System.out.println(e);
	}
%>