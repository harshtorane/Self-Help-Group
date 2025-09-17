<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add New Member</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6f9;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background: #1e1e2f;
            color: white;
            padding: 20px 0;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 20px;
            letter-spacing: 1px;
        }

        .sidebar a {
            display: block;
            padding: 12px 25px;
            color: #ddd;
            text-decoration: none;
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: #33334d;
            color: #fff;
        }

        /* Main content */
        .main-content {
            margin-left: 240px;
            padding: 40px;
        }

        .card {
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: auto;
        }

        .card h2 {
            text-align: center;
            color: darkblue;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 12px;
            width: 100%;
            background: darkblue;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background: navy;
        }

        .error-msg {
            color: red;
            text-align: center;
            margin-bottom: 10px;
            font-weight: bold;
        }
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

    <!-- Main Content -->
    <div class="main-content">
        <div class="card">
            <h2>Add New Member</h2>

            <c:if test="${not empty errMsg}">
                <p class="error-msg">${errMsg}</p>
            </c:if>

            <form action="addMember" method="post">
                <label>Name:</label>
                <input type="text" name="name" required />

                <label>Monthly Saving:</label>
                <input type="number" name="monthly_saving" required />

                <label>Loan Installment:</label>
                <input type="number" name="loan_installment" />

                <label>Fine:</label>
                <input type="number" name="fine" />

                <label>Total:</label>
                <input type="number" name="total" required />

                <label>Username (linked to user):</label>
                <input type="text" name="uname" required />

                <input type="submit" value="Add Member" />
            </form>
        </div>
    </div>
    <script type="text/javascript">
    window.history.forward();
    function noBack() {
        window.history.forward();
    }
</script>

</body>
</html>
