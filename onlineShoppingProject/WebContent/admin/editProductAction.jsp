<%@page import ="onlineShoppingProject.ConnectionProvider"%>
<%@page import ="java.sql.*"%>


<% 
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String category = request.getParameter("category");
	String price = request.getParameter("price");
	String active = request.getParameter("active");
	
	try{
		Connection con = ConnectionProvider.getCon();
		Statement stmt = con.createStatement();
		
		stmt.executeUpdate("update product set name = '"+name+"', category = '"+category+"' ,price = '"+price+"', status = '"+active+"' where id = '"+id+"' ");
		
		if(active.equals("no")){
			stmt.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL ");
		}
		response.sendRedirect("allProductEditProduct.jsp?msg=done");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
	}
%>