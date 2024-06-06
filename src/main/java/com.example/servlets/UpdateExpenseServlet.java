package com.example.servlets;

import com.example.controller.ExpenseController;
import com.example.model.Expense;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

@WebServlet("/expense/update")
public class UpdateExpenseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int expenseId = Integer.parseInt(request.getParameter("expense_id"));
        String title = request.getParameter("title");
        double amount = Double.parseDouble(request.getParameter("amount"));
        String notes = request.getParameter("notes");
        Date expenseDate = Date.valueOf(request.getParameter("expenseDate"));

        Expense expense = new Expense(expenseId, title, amount, notes, expenseDate);

        ExpenseController expenseController = new ExpenseController();
        try {
            expenseController.updateExpense(expense);
            response.sendRedirect(request.getContextPath() + "/viewAllExpenses.jsp?msg=success"); // Redirect to the list of expenses with a success message
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating expense: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/editExpense.jsp"); // Redirect to the edit expense page
    }
}
