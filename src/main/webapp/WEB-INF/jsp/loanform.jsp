<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Issue New Loan</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body { font-family: Arial, sans-serif; margin: 0; display: flex; }
        .sidebar {
            width: 220px; height: 100vh; background: #2c3e50; color: white;
            padding-top: 20px; position: fixed;
        }
        .sidebar h2 { text-align: center; margin-bottom: 20px; }
        .sidebar a {
            display: block; color: white; padding: 12px 20px;
            text-decoration: none; transition: 0.3s;
        }
        .sidebar a:hover, .sidebar a.active { background: #34495e; }
        .main { margin-left: 220px; padding: 20px; background: #f5f7fa; width: 100%; }
        h2 { color: #2c3e50; text-align: center; }
        .form-container {
            width: 450px; margin: auto; background: white;
            padding: 25px; border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        label { display:block; margin:10px 0 5px; font-weight:bold; color:#34495e; }
        input, select {
            width:100%; padding:10px; border:1px solid #ccc;
            border-radius:6px; margin-bottom:15px;
        }
        input:focus, select:focus {
            border-color:#2980b9; outline:none;
            box-shadow:0 0 5px rgba(41,128,185,0.5);
        }
        button {
            width:100%; padding:12px; border:none; border-radius:6px;
            background:#27ae60; color:white; font-size:16px; cursor:pointer;
        }
        button:hover { background:#219150; }
    </style>
</head>
<body>

<div class="sidebar">
    <h2>SHG Portal</h2>
    <a href="<c:url value='/dashboard'/>"><i class="fas fa-house"></i> Dashboard</a>
    <a href="<c:url value='/viewProfileForm'/>"><i class="fas fa-user"></i> View Profile</a>
    <a href="<c:url value='/register'/>"><i class="fas fa-user-plus"></i> Register Member</a>
    <a href="<c:url value='/viewData'/>"><i class="fas fa-table"></i> View Data</a>
    <a href="<c:url value='/viewLoans'/>"><i class="fas fa-file-invoice-dollar"></i> Active Loans</a>
    <a href="<c:url value='/loanForm'/>" class="active"><i class="fas fa-hand-holding-dollar"></i> Issue Loan</a>
    <a href="<c:url value='/'/>"><i class="fas fa-right-from-bracket"></i> Logout</a>
</div>

<div class="main">
    <h2>💰 Issue New Loan</h2>
    <div class="form-container">
        <form action="issueLoan" method="post">
            <label>Member:</label>
            <select name="memberId" required>
                <c:forEach var="m" items="${members}">
                    <option value="${m.id}">${m.name}</option>
                </c:forEach>
            </select>

            <label>Amount:</label>
            <input type="number" name="amount" min="1" required>

            <label>Interest Rate (%):</label>
            <input type="number" step="0.1" name="rate" min="0" required>

            <label>Tenure (months):</label>
            <input type="number" name="tenure" min="1" required>

            <button type="submit">✅ Issue Loan</button>
        </form>
    </div>
</div>
</body>
</html>
