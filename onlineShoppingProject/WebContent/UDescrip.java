package onlineShoppingProject;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionProvider {
    private static Connection connection = null;

    public static Connection getCon() {
        if (connection != null) {
            return connection; // Return the existing connection if available
        }

        try (InputStream input = ConnectionProvider.class.getClassLoader().getResourceAsStream("db.properties")) {
            if (input == null) {
                throw new IOException("Database configuration file (db.properties) not found.");
            }

            Properties properties = new Properties();
            properties.load(input);

            String url = properties.getProperty("db.url");
            String username = properties.getProperty("db.username");
            String password = properties.getProperty("db.password");

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (IOException | ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Handle this more gracefully in a production environment
        }

        return connection;
    }
}
