<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>View Member Profile</title>
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            background: #f4f6f9;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            height: 100vh;
            background: #800080;
            color: #fff;
            display: flex;
            flex-direction: column;
            position: fixed;
            left: 0;
            top: 0;
            padding-top: 20px;
            box-shadow: 2px 0 10px rgba(0,0,0,0.2);
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 22px;
            font-weight: bold;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 14px 20px;
            color: #fff;
            text-decoration: none;
            font-size: 15px;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background: #5a005a;
            padding-left: 30px;
        }
        .sidebar a.active {
            background: #5a005a;
        }

        /* Main Content */
        .main-content {
            margin-left: 240px;
            padding: 40px;
            width: calc(100% - 240px);
        }

        /* Profile Box */
        .profile-box {
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            width: 450px;
            margin: 40px auto;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.15);
            text-align: center;
        }
        .profile-box h2 {
            color: #800080;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #333;
            text-align: left;
        }
        select {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        button {
            background: #800080;
            color: white;
            padding: 10px 22px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            font-size: 14px;
        }
        button:hover {
            background: #5a005a;
        }

        .back-btn {
            text-align: center;
            margin-top: 20px;
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
        <div class="profile-box">
            <h2>View Member Profile</h2>
            <form action="viewProfile" method="post">
                <label>Select Member:</label>
		                <select name="id">
		    <c:forEach var="emp" items="${members}">
		        <option value="${emp.id}">${emp.id} - ${emp.name}</option>
		    </c:forEach>
		</select>
                
                <button type="submit"><i class="fa-solid fa-eye"></i> View Profile</button>
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
