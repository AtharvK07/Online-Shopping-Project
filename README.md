
# Online Shopping Project Using Java

This is a Java-based online shopping project that simulates an e-commerce platform where users can browse and purchase products.

## Features

- User registration and login
- Product catalog with categories
- Add to cart functionality
- Checkout and order processing
- User profile management
- Admin dashboard for product and user management

## Technologies Used

- Java
- MySQL (or your preferred database)
- JavaFX for the graphical user interface (GUI)

## Getting Started

### Prerequisites

Before running the project, you need to have the following installed:

- Java Development Kit (JDK)
- MySQL (or another relational database)
- MySQL JDBC Driver
- JavaFX (included with JDK)

### Database Setup

1. Create a MySQL database for the project, e.g., `online_shopping`.
2. Import the database schema from the provided `database.sql` file.

```bash
mysql -u your_username -p online_shopping < database.sql
```

### Configuration

Update the database connection details in the `config.properties` file:

```properties
db.url=jdbc:mysql://localhost:3306/online_shopping
db.username=your_username
db.password=your_password
```

### Running the Application

1. Compile the Java code:

```bash
javac Main.java
```

2. Run the application:

```bash
java Main
```

## Usage

- Launch the application.
- Register as a new user or log in with an existing account.
- Browse products by category.
- Add products to your cart.
- Proceed to checkout and complete the order.
- Admins can access the admin dashboard to manage products and users.

## Screenshots

![Screenshot 1](screenshots/screenshot1.png)

![Screenshot 2](screenshots/screenshot2.png)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Special thanks to [XYZ Online Store](https://www.xyzonlinestore.com) for inspiration.
