Expense Management Application
Table of Contents
Introduction
Features
Technologies Used
Setup and Installation
Usage
Contributing
License
Introduction
The Expense Management Application is a web-based tool designed to help users track and manage their expenses. It leverages JSP, Servlets, and JDBC for server-side operations, ensuring a robust and dynamic user experience.

Features
User authentication and authorization
Add, view, update, and delete expenses
Categorize expenses
Generate expense reports
User-friendly interface
Technologies Used
Frontend: HTML, CSS, JSP
Backend: Java Servlets
Database: MySQL
Server: Apache Tomcat
JDBC: Java Database Connectivity for database operations
Setup and Installation
Prerequisites
JDK 8 or higher
Apache Tomcat 9.0 or higher
MySQL 5.7 or higher
IDE (e.g., IntelliJ IDEA, Eclipse)
Steps
Clone the repository

bash
Copy code
git clone https://github.com/yourusername/expense-management-app.git
Set up the database

Create a MySQL database named expense_mgmt.
Run the SQL script provided in the db folder to create the necessary tables.
sql
Copy code
CREATE DATABASE expense_mgmt;
USE expense_mgmt;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    category VARCHAR(50),
    amount DECIMAL(10, 2),
    date DATE,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
Configure the application

Update the db.properties file located in the src/main/resources directory with your MySQL database credentials.
properties
Copy code
db.url=jdbc:mysql://localhost:3306/expense_mgmt
db.username=root
db.password=yourpassword
Deploy the application

Compile and package the application using your IDE or Maven.
Deploy the generated WAR file to your Apache Tomcat server.
bash
Copy code
mvn clean package
cp target/expense-management-app.war $TOMCAT_HOME/webapps/
Start the server

Start your Apache Tomcat server and access the application at http://localhost:8080/expense-management-app.
Usage
Registration and Login: Users can register a new account or log in to an existing account.
Manage Expenses: After logging in, users can add new expenses, view a list of their expenses, update or delete existing expenses.
Reports: Generate reports to get insights into your spending patterns.
Contributing
Contributions are welcome! Please fork the repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

License
This project is licensed under the MIT License - see the LICENSE file for details.
