

# Expense Management Application

## Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
3. [Technologies Used](#technologies-used)
4. [Setup and Installation](#setup-and-installation)
5. [Usage](#usage)
6. [Contributing](#contributing)
7. [License](#license)

## Introduction
The Expense Management Application is a web-based tool designed to help users track and manage their expenses. It leverages JSP, Servlets, and JDBC for server-side operations, ensuring a robust and dynamic user experience.

## Features
- User authentication and authorization
- Add, view, update, and delete expenses
- Categorize expenses
- Generate expense reports
- User-friendly interface

## Technologies Used
- **Frontend**: HTML, CSS, JSP
- **Backend**: Java Servlets
- **Database**: MySQL
- **Server**: Apache Tomcat
- **JDBC**: Java Database Connectivity for database operations

## Setup and Installation

### Prerequisites
- JDK 8 or higher
- Apache Tomcat 9.0 or higher
- MySQL 5.7 or higher
- IDE (e.g., IntelliJ IDEA, Eclipse)

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Anpatil1/expense-management-web-applicationt.git
   ```

2. **Set up the database**
   - Create a MySQL database named `expense_mgmt`.
   - Run the SQL script provided in the `db` folder to create the necessary tables.

   ```sql
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
   ```

3. **Configure the application**
   - Update the `db.properties` file located in the `src/main/resources` directory with your MySQL database credentials.

   ```properties
   db.url=jdbc:mysql://localhost:3306/expense_mgmt
   db.username=root
   db.password=yourpassword
   ```

4. **Deploy the application**
   - Compile and package the application using your IDE or Maven.
   - Deploy the generated WAR file to your Apache Tomcat server.

   ```bash
   mvn clean package
   cp target/expense-management-app.war $TOMCAT_HOME/webapps/
   ```

5. **Start the server**
   - Start your Apache Tomcat server and access the application at `http://localhost:8080/expense-management-app`.

## Usage
- **Registration and Login**: Users can register a new account or log in to an existing account.
- **Manage Expenses**: After logging in, users can add new expenses, view a list of their expenses, update or delete existing expenses.
- **Reports**: Generate reports to get insights into your spending patterns.

## Contributing
Contributions are welcome! Please fork the repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

