<%@page import ="onlineShoppingProject.ConnectionProvider"%>
<%@page import ="java.sql.*"%>

<%
	try{
		Connection con=ConnectionProvider.getCon();
		Statement stmt=con.createStatement();
		String q1 = "create table users(name varchar(100), email varchar(100) primary key,mobileNumber bigint, securtyQuestion varchar(200), answer varchar(200), password varchar(200),address varchar(200), city varchar(100), state varchar(100),country varchar(100) )";
		String q2 = "create table product(id int, name varchar(500), category varchar(200), price int, status varchar(100))";
		String q3 = "create table cart(email varchar(100), product_id int, quantity int, price int, total int, address varchar(500), city varchar(100), state varchar(100), country varchar(100), mobileNumber bigint, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionId varchar(100), status varchar(10) )";                     
		String q4  ="create table message(id int AUTO_INCREMENT, email varchar(100), subject varchar(200),body varchar(1000), PRIMARY KEY(id))";
		
		System.out.println(q1);
		System.out.println(q2);
		System.out.println(q3);
		System.out.println(q4);
		//stmt.execute(q1); //we have alredy created so we commented it.
		//stmt.execute(q2);	//we have alredy created so we commented it.
		//stmt.execute(q3); //we have alredy created so we commented it.
		stmt.execute(q4);
		
		System.out.println("table created");
		con.close();
	}
	catch(Exception e){
		System.out.println(e);
	}
%>