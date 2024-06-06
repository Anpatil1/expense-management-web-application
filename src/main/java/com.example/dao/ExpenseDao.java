package com.example.dao;

import com.example.model.Expense;
import com.example.util.ConnectionUtil;
import lombok.SneakyThrows;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Calendar;

public class ExpenseDao {

    @SneakyThrows
    public void addExpense(Expense expense) {
        Connection connection = ConnectionUtil.getConnection();
        String sqlQuery = "insert into student.expense1(id, title, amount, notes, expense_date) values(?,?,?,?,?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery)) {
            preparedStatement.setInt(1, expense.getId());
            preparedStatement.setString(2, expense.getTitle());
            preparedStatement.setDouble(3, expense.getAmount());
            preparedStatement.setString(4, expense.getNotes());

            // Set expense_date to current date
            preparedStatement.setDate(5, new Date(Calendar.getInstance().getTime().getTime()));

            preparedStatement.executeUpdate();
            System.out.println("Expense Added");
        }
    }

    @SneakyThrows
    public void updateExpense(Expense expense) {
        Connection connection = ConnectionUtil.getConnection();
        String sqlQuery = "update student.expense1 set title=?, amount=?, notes=?, expense_date=? where id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery)) {
            preparedStatement.setString(1, expense.getTitle());
            preparedStatement.setDouble(2, expense.getAmount());
            preparedStatement.setString(3, expense.getNotes());

            // Set expense_date to current date
            preparedStatement.setDate(4, new Date(Calendar.getInstance().getTime().getTime()));

            preparedStatement.setInt(5, expense.getId());

            preparedStatement.executeUpdate();
            System.out.println("Expense Updated");
        }
    }

    @SneakyThrows
    public void deleteExpense(int id) {
        Connection connection = ConnectionUtil.getConnection();
        String sqlQuery = "delete from student.expense1 where id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            System.out.println("Expense Deleted");
        }
    }

    @SneakyThrows
    public List<Expense> getAllExpenses() {
        List<Expense> expenses = new ArrayList<>();
        Connection connection = ConnectionUtil.getConnection();
        String sqlQuery = "select * from student.expense1";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int amount = resultSet.getInt("amount");
                String notes = resultSet.getString("notes");
                Date expenseDate = resultSet.getDate("expense_date");
                expenses.add(new Expense(id, title, amount, notes, expenseDate));
            }
        }
        return expenses;
    }

    @SneakyThrows
    public Expense getExpenseById(int id) {
        Expense expense = null;
        Connection connection = ConnectionUtil.getConnection();
        String sqlQuery = "select * from student.expense1 where id=?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String title = resultSet.getString("title");
                    int amount = resultSet.getInt("amount");
                    String notes = resultSet.getString("notes");
                    java.sql.Date expenseDate = resultSet.getDate("expense_date");
                    expense = new Expense(id, title, amount, notes, expenseDate);
                }
            }
        }
        return expense;
    }

    @SneakyThrows
    public List<Expense> getExpensesByDate(Date date) {
        List<Expense> expenses = new ArrayList<>();
        Connection connection = ConnectionUtil.getConnection();
        String sqlQuery = "SELECT * FROM student.expense1 WHERE expense_date = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery)) {
            preparedStatement.setDate(1, date);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String title = resultSet.getString("title");
                    double amount = resultSet.getDouble("amount");
                    String notes = resultSet.getString("notes");
                    Date expenseDate = resultSet.getDate("expense_date");
                    expenses.add(new Expense(id, title, amount, notes, expenseDate));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return expenses;
    }
}