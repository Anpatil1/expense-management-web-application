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

@WebServlet("/expense/add")
public class AddExpenseServlet extends HttpServlet {
    private ExpenseController expenseController = new ExpenseController();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id")); // Retrieve ID
            String title = request.getParameter("title");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String notes = request.getParameter("notes");

            // Create a Date object for the current date
            Date expenseDate = Date.valueOf(LocalDate.now());

            Expense expense = Expense.builder()
                    .id(id) // Set ID
                    .title(title)
                    .amount(amount)
                    .notes(notes)
                    .expenseDate(expenseDate)
                    .build();

            expenseController.addExpense(expense);

            // Redirect to viewAllExpenses.jsp with success message
            response.sendRedirect("/Expense_mgmt1_war/viewAllExpenses.jsp?msg=success");
        } catch (Exception e) {
            // Set the exception message as a request attribute and forward to error.jsp
            request.setAttribute("javax.servlet.error.message", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}
