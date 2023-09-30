package onlineShoppingProject;


import java.sql.*;

public class ConnectionProvider {
	
		public static Connection getCon()
		{
			try{
				String url="jdbc:mysql://localhost:3306/ospjsp";
				String username="root";
				String password="";
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(url,username,password);
				return con;
			}
			catch(Exception e) {
				System.out.println(e);
				return null;
			}
		}

}
