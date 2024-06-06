<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.example.model.Expense" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filtered Expenses</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>Filtered Expenses</h2>
    <form action="expense/filterByDate" method="get">
        <div class="form-group">
            <label for="date">Select Date:</label>
            <input type="date" id="date" name="date" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Filter</button>
    </form>
    <hr>
    <h3>Expenses for <%= request.getAttribute("date") %></h3>
    <ul class="list-group">
        <%
            List<Expense> expenses = (List<Expense>) request.getAttribute("expenses");
            if (expenses != null && !expenses.isEmpty()) {
                for (Expense expense : expenses) {
        %>
        <li class="list-group-item">
            <strong>Title:</strong> <%= expense.getTitle() %> <br>
            <strong>Amount:</strong> <%= expense.getAmount() %> <br>
            <strong>Notes:</strong> <%= expense.getNotes() %> <br>
            <strong>Date:</strong> <%= expense.getExpenseDate() %>
        </li>
        <%
            }
        } else {
        %>
        <li class="list-group-item">No expenses found for the selected date.</li>
        <%
            }
        %>
    </ul>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
