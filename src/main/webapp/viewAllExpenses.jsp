<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Expenses</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 50px;
        }
        .table-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table-container h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-container">
        <h2>All Expenses</h2>

        <%
            String msg = request.getParameter("msg");
            if (msg != null) {
                if (msg.equals("success")) {
        %>
        <div class="alert alert-success" role="alert">
            Expense added successfully.
        </div>
        <%
        } else if (msg.equals("deleted")) {
        %>
        <div class="alert alert-success" role="alert">
            Expense deleted successfully.
        </div>
        <%
                }
            }
        %>

        <button class="btn btn-primary mb-3" onclick="createExpense()">Create New Expense</button>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Amount</th>
                <th>Notes</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="expenseTableBody">
            <!-- Data will be populated here by JavaScript -->
            </tbody>
        </table>
    </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Custom JavaScript to fetch and display data -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        fetch('expenses')
            .then(response => response.json())
            .then(data => {
                const tableBody = document.getElementById('expenseTableBody');
                data.forEach(expense => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${expense.id}</td>
                        <td>${expense.title}</td>
                        <td>${expense.amount}</td>
                        <td>${expense.notes}</td>
                        <td>${expense.expenseDate}</td>
                        <td>
                            <button class="btn btn-warning btn-sm" onclick="editExpense(${expense.id})">Edit</button>
                            <button class="btn btn-danger btn-sm" onclick="deleteExpense(${expense.id})">Delete</button>
                        </td>
                    `;
                    tableBody.appendChild(row);
                });
            })
            .catch(error => console.error('Error fetching data:', error));
    });

    function createExpense() {
        window.location.href = 'addExpense.jsp';
    }

    function editExpense(expenseId) {
        window.location.href = `editExpense.jsp?expense_id=${expenseId}`;
    }

    function deleteExpense(expenseId) {
        if (confirm('Are you sure you want to delete this expense?')) {
            fetch(`expense/delete?expense_id=${expenseId}`, { method: 'POST' })
                .then(response => {
                    if (response.ok) {
                        window.location.href = 'viewAllExpenses.jsp?msg=deleted';
                    } else {
                        response.text().then(text => alert(text));
                    }
                })
                .catch(error => console.error('Error deleting expense:', error));
        }
    }
</script>
</body>
</html>
