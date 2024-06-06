<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, com.example.model.Expense" %>
<%@ page import="com.example.controller.ExpenseController" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Expense</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="table-container">
        <h2>Edit Expense</h2>
        <!-- Form for entering the expense ID -->
        <form action="" method="GET">
            <div class="form-group">
                <label for="expenseId">Enter Expense ID to Edit:</label>
                <input type="text" class="form-control" id="expenseId" name="expense_id" required>
            </div>
            <button type="submit" class="btn btn-primary">Fetch Expense</button>
        </form>

        <!-- Display expense details for editing -->
        <%
            if (request.getParameter("expense_id") != null) {
                String expenseId = request.getParameter("expense_id");
                Expense expense = null;

                try {
                    int id = Integer.parseInt(expenseId);
                    ExpenseController expenseController = new ExpenseController();
                    expense = expenseController.getExpenseById(id);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (expense != null) {
        %>
        <form action="expense/update" method="POST">
            <input type="hidden" name="expense_id" value="<%= expense.getId() %>">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" name="title" value="<%= expense.getTitle() %>" required>
            </div>
            <div class="form-group">
                <label for="amount">Amount</label>
                <input type="number" class="form-control" id="amount" name="amount" value="<%= expense.getAmount() %>" required>
            </div>
            <div class="form-group">
                <label for="notes">Notes</label>
                <textarea class="form-control" id="notes" name="notes" rows="3" required><%= expense.getNotes() %></textarea>
            </div>
            <div class="form-group">
                <label for="expenseDate">Date</label>
                <input type="date" class="form-control" id="expenseDate" name="expenseDate" value="<%= expense.getExpenseDate() %>" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Changes</button>
        </form>
        <%
                } else {
                    out.println("Expense not found.");
                }
            }
        %>
    </div>
</div>
</body>
</html>
