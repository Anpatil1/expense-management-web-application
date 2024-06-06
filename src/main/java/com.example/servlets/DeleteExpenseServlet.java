package com.example.servlets;

import com.example.controller.ExpenseController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/expense/delete")
public class DeleteExpenseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int expenseId = Integer.parseInt(request.getParameter("expense_id"));

        ExpenseController expenseController = new ExpenseController();
        try {
            expenseController.deleteExpense(expenseId);
            response.sendRedirect(request.getContextPath() + "/viewAllExpenses.jsp?msg=deleted"); // Redirect to view all expenses with a success message
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting expense: " + e.getMessage());
        }
    }
}
