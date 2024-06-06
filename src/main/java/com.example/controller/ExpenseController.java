package com.example.controller;

import com.example.model.Expense;
import com.example.service.ExpenseService;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class ExpenseController {

    private final ExpenseService expenseService;



    public ExpenseController() {
        this.expenseService = new ExpenseService();
    }

    public void addExpense( Expense expense) {
        expenseService.addExpense(expense);
    }

    public void updateExpense(Expense expense) {
        expenseService.updateExpense(expense);
    }

    public void deleteExpense(int id) {
        expenseService.deleteExpense(id);
    }

    public List<Expense> getAllExpenses() {
        return expenseService.getAllExpenses();
    }


    public void bulkImportExpenses(List<Expense> expenses) {
        for (Expense expense : expenses) {
            expenseService.addExpense(expense);
        }
    }
    public Expense getExpenseById(int id) {
        return expenseService.getExpenseById(id);
    }
    public List<Expense> getExpensesByDate(Date expenseDate) {
        return expenseService.getExpensesByDate(expenseDate);
    }
}
