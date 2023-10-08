package onlineShoppingProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
    public static Connection getCon() {
        try {
            // Define the database connection parameters
            String url = "jdbc:mysql://localhost:3306/ospjsp"; // JDBC URL for MySQL
            String username = "root"; // MySQL username
            String password = ""; // MySQL password (if applicable)

            // Load the MySQL JDBC driver (you should use 'com.mysql.cj.jdbc.Driver' for MySQL 8 and later)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection con = DriverManager.getConnection(url, username, password);

            // Return the established connection
            return con;
        } catch (ClassNotFoundException e) {
            // Handle ClassNotFoundException (driver not found) separately
            e.printStackTrace();
            System.err.println("MySQL JDBC driver not found");
        } catch (SQLException e) {
            // Handle SQLException (database connection error)
            e.printStackTrace();
            System.err.println("Error connecting to the database");
        }

        // Return null to indicate a failed connection
        return null;
    }
}
