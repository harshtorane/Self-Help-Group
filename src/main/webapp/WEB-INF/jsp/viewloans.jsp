<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Active Loans</title>
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
        table {
            width: 100%; border-collapse: collapse; margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1); background: white;
            border-radius: 10px; overflow: hidden;
        }
        th, td { padding: 12px; text-align: center; }
        th { background: #34495e; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
        tr:hover { background: #ecf0f1; }
        .status-active { color: green; font-weight: bold; }
        .status-pending { color: orange; font-weight: bold; }
        .status-closed { color: red; font-weight: bold; }
    </style>
</head>
<body>

<div class="sidebar">
    <h2>SHG Portal</h2>
    <a href="<c:url value='/dashboard'/>"><i class="fas fa-house"></i> Dashboard</a>
    <a href="<c:url value='/viewProfileForm'/>"><i class="fas fa-user"></i> View Profile</a>
    <a href="<c:url value='/register'/>"><i class="fas fa-user-plus"></i> Register Member</a>
    <a href="<c:url value='/viewData'/>"><i class="fas fa-table"></i> View Data</a>
    <a href="<c:url value='/viewLoans'/>" class="active"><i class="fas fa-file-invoice-dollar"></i> Active Loans</a>
    <a href="<c:url value='/loanForm'/>"><i class="fas fa-hand-holding-dollar"></i> Issue Loan</a>
    <a href="<c:url value='/'/>"><i class="fas fa-right-from-bracket"></i> Logout</a>
</div>

<div class="main">
    <h2>📌 Active Loans</h2>
    <table>
        <tr>
            <th>ID</th><th>Member</th><th>Amount</th>
            <th>Rate</th><th>Tenure</th><th>Status</th>
        </tr>
        <c:forEach var="l" items="${loans}">
            <tr>
                <td>${l.loan_id}</td>
                <td>${l.name}</td>
                <td>₹ ${l.loan_amount}</td>
                <td>${l.interest_rate}%</td>
                <td>${l.tenure_months} months</td>
                <td>
                    <c:choose>
                        <c:when test="${l.status eq 'Active'}"><span class="status-active">${l.status}</span></c:when>
                        <c:when test="${l.status eq 'Pending'}"><span class="status-pending">${l.status}</span></c:when>
                        <c:otherwise><span class="status-closed">${l.status}</span></c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
