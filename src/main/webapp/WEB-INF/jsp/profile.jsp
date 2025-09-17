<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Member Profile</title>
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f9f9f9;
            margin: 0;
            display: flex;
        }

        /* Sidebar */
        .sidebar {
            width: 230px;
            height: 100vh;
            background: #800080;
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            padding: 20px 0;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            font-size: 15px;
            transition: 0.3s;
        }

        .sidebar a i {
            margin-right: 10px;
        }

        .sidebar a:hover {
            background: #5a005a;
        }

        /* Main content */
        .main-content {
            margin-left: 230px;
            padding: 30px;
            flex: 1;
        }

        .profile-container {
            max-width: 500px;
            margin: 40px auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
        }

        .profile-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .profile-container p {
            font-size: 16px;
            margin: 10px 0;
            color: #555;
        }

        .profile-container p b {
            color: #222;
        }

        .profile-container a {
            display: block;
            width: 100%;
            text-align: center;
            background: purple;
            color: white;
            padding: 12px;
            border-radius: 10px;
            text-decoration: none;
            margin-top: 20px;
            transition: 0.3s ease;
        }

        .profile-container a:hover {
            background: #5a005a;
        }
    </style>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" >
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>SHG Portal</h2>
        <a href="<c:url value='/dashboard'/>"><i class="fas fa-house"></i> Dashboard</a>
        <a href="<c:url value='/viewProfileForm'/>"><i class="fas fa-user"></i> View Profile</a>
        <a href="<c:url value='/register'/>"><i class="fas fa-user-plus"></i> Register Member</a>
        <a href="<c:url value='/viewData'/>"><i class="fas fa-table"></i> View Data</a>
        <a href="<c:url value='/'/>"><i class="fas fa-right-from-bracket"></i> Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="profile-container">
            <h2>Member Profile</h2>
            <p><b>ID:</b> ${member.id}</p>
            <p><b>Name:</b> ${member.name}</p>
            <p><b>Monthly Saving:</b> ${member.monthly_saving}</p>
            <p><b>Loan Installment:</b> ${member.loan_installment}</p>
            <p><b>Fine:</b> ${member.fine}</p>
            <p><b>Total:</b> ${member.total}</p>

            <a href="viewProfileForm"><i class="fas fa-arrow-left"></i> Back</a>
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
