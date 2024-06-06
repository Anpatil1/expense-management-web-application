package com.example.servlets;

import com.example.controller.ExpenseController;
import com.example.model.Expense;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/expenses")
public class GetAllExpensesServlet extends GenericServlet {


    @Override
    public void service(ServletRequest servletRequest, ServletResponse servletResponse) throws ServletException, IOException {
        ExpenseController expenseController = new ExpenseController();

        List<Expense> expenses = expenseController.getAllExpenses();

        Gson gson = new Gson();
        String json = gson.toJson(expenses);

        servletResponse.setContentType("application/json");
        servletResponse.setCharacterEncoding("UTF-8");
        PrintWriter writer = servletResponse.getWriter();
        writer.print(json);
        writer.flush();
    }
}
