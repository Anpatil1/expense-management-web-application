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
import java.util.List;

@WebServlet("/expense/filterByDate")
public class FilterByDateServlet extends HttpServlet {
    private ExpenseController expenseController = new ExpenseController();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String dateStr = request.getParameter("date");
        if (dateStr != null && !dateStr.isEmpty()) {
            Date expenseDate = Date.valueOf(dateStr);
            List<Expense> expenses = expenseController.getExpensesByDate(expenseDate);
            request.setAttribute("expenses", expenses);
            request.setAttribute("date", expenseDate);
        }
        request.getRequestDispatcher("/viewFilteredExpenses.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response); // Handle POST requests the same way as GET
    }
}
