<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SHG Member Data</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
    .profile {
    text-align: center;
    padding: 15px;
    border-bottom: 1px solid #34495e;
}
.profile img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-bottom: 10px;
}
.profile p {
    margin: 5px 0;
    font-weight: bold;
    color: #ecf0f1;
}
.profile span {
    font-size: 13px;
    color: #bdc3c7;
}
    
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
        }
        /* Sidebar */
        .sidebar {
            width: 220px;
            height: 100vh;
            background: #2c3e50;
            color: white;
            padding-top: 20px;
            position: fixed;
        }
        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .sidebar a {
            display: block;
            color: white;
            padding: 12px 20px;
            text-decoration: none;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background: #34495e;
        }
        /* Main content */
        .main {
            margin-left: 220px;
            padding: 20px;
            background: #f5f7fa;
            min-height: 100vh;
            width: 100%;
        }
        h2, h3 { color: #2c3e50; text-align: center; }
        .msg { color: green; font-weight: bold; text-align:center; }
        .error { color: red; font-weight: bold; text-align:center; }
        hr { margin: 20px 0; }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }
        th, td { padding: 12px; text-align: center; }
        th { background: #34495e; color: white; }
        tr:nth-child(even) { background: #f9f9f9; }
        tr:hover { background: #ecf0f1; }
        .action-icons a { margin: 0 6px; font-size: 18px; color: #2980b9; }
        .action-icons a:hover { color: #c0392b; }
        .muted { color:#666; font-size: 13px; }

        #updateForm {
            background-color: #fff;
            padding: 20px;
            width: 40%;
            border: 1px solid #ddd;
            margin: 30px auto;
            border-radius: 10px;
            box-shadow: 0 3px 6px rgba(0,0,0,0.15);
            display: none;
        }
        #updateForm h2 { color: #2c3e50; margin-bottom: 15px; text-align:center; }
        #updateForm input[type="text"], 
        #updateForm input[type="submit"] {
            padding: 10px;
            margin: 8px 0;
            width: 95%;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        #updateForm input[type="submit"] {
            background-color: #27ae60;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border: none;
        }
        #updateForm input[type="submit"]:hover { background-color: #219150; }
    </style>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" >

<!-- Sidebar -->
<div class="sidebar">
      <h2>SHG Portal</h2>
       
        <a href="<c:url value='/dashboard'/>"><i class="fas fa-house"></i> Dashboard</a>
        <a href="<c:url value='/viewProfileForm'/>" class="active"><i class="fas fa-user"></i> View Profile</a>
        <a href="<c:url value='/register'/>"><i class="fas fa-user-plus"></i> Register Member</a>
        <a href="<c:url value='/viewData'/>"><i class="fas fa-table"></i> View Data</a>
        <a href="<c:url value='/'/>"><i class="fas fa-right-from-bracket"></i> Logout</a>
</div>

<!-- Main content -->
<div class="main">
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    <h2>Welcome, ${username} (${role})</h2>

    <p class="msg">${successMsg}</p>
    <p class="error">${errMsg}</p>

    <hr>
    <h3>Member Data</h3>

    <table>
        <thead>
        <tr>
            <th><i class="fas fa-id-badge"></i> ID</th>
            <th><i class="fas fa-user"></i> Name</th>
            <th><i class="fas fa-piggy-bank"></i> Monthly Saving</th>
            <th><i class="fas fa-coins"></i> Loan Installment</th>
            <th><i class="fas fa-gavel"></i> Fine</th>
            <th><i class="fas fa-calculator"></i> Total</th>
            <th><i class="fas fa-user-tag"></i> Username</th>
            <th><i class="fas fa-cogs"></i> Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${memberList}" var="m">
            <tr>
                <td>${m.id}</td>
                <td>${m.name}</td>
                <td>${m.monthly_saving}</td>
                <td>${m.loan_installment}</td>
                <td>${m.fine}</td>
                <td>${m.total}</td>
                <td>${m.uname}</td>
                <td class="action-icons">
                    <c:choose>
                        <c:when test="${role == 'ADMIN'}">
                            <a href="#" title="Edit"
                               onclick="openUpdateForm(${m.id},
                                      '${fn:escapeXml(m.name)}',
                                      '${fn:escapeXml(m.monthly_saving)}',
                                      '${fn:escapeXml(m.loan_installment)}',
                                      '${fn:escapeXml(m.fine)}',
                                      '${fn:escapeXml(m.total)}')">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="${ctx}/deleteInfo/${m.id}"
                               onclick="return confirm('Are you sure you want to delete this record?');"
                               title="Delete">
                                <i class="fas fa-trash-alt"></i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span class="muted">Read-only</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <c:if test="${role == 'ADMIN'}">
    <div id="updateForm">
        <h2>Update Member</h2>
        <form action="${ctx}/updateInfo" method="post">
            <input type="hidden" name="id" id="fid">
            <input type="text" name="name" id="fname" placeholder="Name">
            <input type="text" name="monthly_saving" id="fms" placeholder="Monthly Saving">
            <input type="text" name="loan_installment" id="fli" placeholder="Loan Installment">
            <input type="text" name="fine" id="ffine" placeholder="Fine">
            <input type="text" name="total" id="ftotal" placeholder="Total">
            <input type="submit" value="Update">
        </form>
    </div>
    </c:if>
</div>

<script>
    function openUpdateForm(id, name, ms, li, fine, total) {
        var f = document.getElementById("updateForm");
        f.style.display = "block";
        document.getElementById("fid").value = id;
        document.getElementById("fname").value = name;
        document.getElementById("fms").value = ms;
        document.getElementById("fli").value = li;
        document.getElementById("ffine").value = fine;
        document.getElementById("ftotal").value = total;
        window.scrollTo(0, document.body.scrollHeight);
    }
</script>
<script type="text/javascript">
    window.history.forward();
    function noBack() {
        window.history.forward();
    }
</script>

</body>
</html>
