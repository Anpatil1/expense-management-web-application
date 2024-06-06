package com.example.service;

import com.example.dao.ExpenseDao;
import com.example.model.Expense;

import java.sql.Date;
import java.util.List;

public class ExpenseService {
    ExpenseDao expenseDao = new ExpenseDao();

    public void addExpense(Expense expense) {
        expenseDao.addExpense(expense);
    }

    public void updateExpense(Expense expense) {
        expenseDao.updateExpense(expense);
    }

    public void deleteExpense(int id) {
        expenseDao.deleteExpense(id);
    }

    public List<Expense> getAllExpenses() {
        return expenseDao.getAllExpenses();
    }

    public Expense getExpenseById(int id) {
        return expenseDao.getExpenseById(id);
    }

    public List<Expense> getExpensesByDate(Date expenseDate) {
        return expenseDao.getExpensesByDate(expenseDate);
    }



    public void bulkImportExpenses(List<Expense> expenses) {
        for (Expense expense : expenses) {
            expenseDao.addExpense(expense);
        }
    }
}
