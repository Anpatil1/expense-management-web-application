<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Expense Management App</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background-color: #2c3e50;
        }
        .navbar-brand, .nav-link {
            color: #ecf0f1 !important;
        }
        .navbar-brand:hover, .nav-link:hover {
            color: #bdc3c7 !important;
        }
        .carousel-item {
            height: 65vh;
            min-height: 300px;
            background: no-repeat center center scroll;
            background-size: cover;
        }
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            border-radius: 10px;
            height: 300px;
            margin-bottom: 20px;
        }
        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.4);
        }
        .card-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .footer {
            background-color: #2c3e50;
            color: #ecf0f1;
            padding: 20px;
            text-align: center;
            position: relative;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">Expense Management App</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Contact</a>
            </li>
        </ul>
    </div>
</nav>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active" style="background-image: url('https://via.placeholder.com/1920x600?text=Manage+Your+Expenses')">
            <div class="carousel-caption d-none d-md-block">
                <h3>Manage Your Expenses</h3>
                <p>Keep track of your spending</p>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url('https://via.placeholder.com/1920x600?text=Add+New+Expenses')">
            <div class="carousel-caption d-none d-md-block">
                <h3>Add New Expenses</h3>
                <p>Easily add and categorize your expenses</p>
            </div>
        </div>
        <div class="carousel-item" style="background-image: url('https://via.placeholder.com/1920x600?text=Review+Your+Expenses')">
            <div class="carousel-caption d-none d-md-block">
                <h3>Review Your Expenses</h3>
                <p>Analyze and manage your financials</p>
            </div>
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Add Expense</h5>
                    <p class="card-text">Add a new expense to the system.</p>
                    <a href="addExpense.jsp" class="btn btn-primary btn-block">Add Expense</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">View Filtered Expenses</h5>
                    <p class="card-text">View filtered expenses based on criteria.</p>
                    <a href="viewFilteredExpenses.jsp" class="btn btn-primary btn-block">View Filtered Expenses</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">View All Expenses</h5>
                    <p class="card-text">View all expenses in the system.</p>
                    <a href="viewAllExpenses.jsp" class="btn btn-primary btn-block">View All Expenses</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-4">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Edit Expense</h5>
                    <p class="card-text">Edit an existing expense in the system.</p>
                    <a href="editExpense.jsp" class="btn btn-primary btn-block">Edit Expense</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mt-4">
            <div class="card">
                <div class="card-body text-center">
                    <h5 class="card-title">Delete Expense</h5>
                    <p class="card-text">Delete an expense from the system.</p>
                    <a href="deleteExpense.jsp" class="btn btn-primary btn-block">Delete Expense</a>
                </div>
            </div>
        </div>
    </div>
</div>

<footer class="footer">
    <p>&copy; 2023 Expense Management App</p>
</footer>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
