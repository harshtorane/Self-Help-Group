<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Personal Information</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body { font-family: Arial, sans-serif; background:#f4f6f9; margin:0; }
        .card {
            background: #fff; padding: 30px; border-radius: 15px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.1); max-width: 600px; margin: 40px auto;
        }
        h2 { text-align:center; color:darkblue; margin-bottom:20px; }
        label { display:block; margin-top:12px; font-weight:bold; color:#333; }
        input, textarea {
            width:100%; padding:10px; margin-top:6px;
            border:1px solid #ccc; border-radius:8px; font-size:14px;
        }
        input[type="submit"] {
            margin-top:20px; background:darkblue; color:white;
            border:none; cursor:pointer; transition:0.3s;
        }
        input[type="submit"]:hover { background:navy; }
        table {
            width:100%; border-collapse:collapse; margin-top:30px;
        }
        table, th, td { border:1px solid #ccc; }
        th, td { padding:10px; text-align:center; }
        .actions a { margin:0 5px; color:darkblue; }
    </style>
</head>
<body>

<div class="card">
    <h2>Personal Information Form</h2>

    <form action="savePersonalInfo" method="post">

        <!-- username & password from logged-in user -->
        <label>Username:</label>
        <input type="text" name="username" value="${sessionScope.loggedUser.username}" readonly />

        <label>Password:</label>
        <input type="text" name="password" value="${sessionScope.loggedUser.password}" readonly />

        <!-- personal details -->
        <label>Mobile Number:</label>
        <input type="text" name="mobile" required />

        <label>Aadhaar Number:</label>
        <input type="text" name="aadhaar" required />

        <label>PAN Number:</label>
        <input type="text" name="pan" />

        <label>Email:</label>
        <input type="email" name="email" required />

        <label>Address:</label>
        <textarea name="address" rows="3"></textarea>

        <label>Date of Birth:</label>
        <input type="date" name="dob" required />

        <label>Bank Name:</label>
        <input type="text" name="bankName" />

        <label>Account Number:</label>
        <input type="text" name="accountNo" />

        <label>IFSC Code:</label>
        <input type="text" name="ifsc" />

        <input type="submit" value="Save Details" />
    </form>

    <!-- table to display saved data -->
    <h2>Saved Details</h2>
    <table>
        <tr>
            <th>Username</th>
            <th>Mobile</th>
            <th>Aadhaar</th>
            <th>PAN</th>
            <th>Email</th>
            <th>Bank</th>
            <th>Account</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="p" items="${personalInfoList}">
            <tr>
                <td>${p.username}</td>
                <td>${p.mobile}</td>
                <td>${p.aadhaar}</td>
                <td>${p.pan}</td>
                <td>${p.email}</td>
                <td>${p.bankName}</td>
                <td>${p.accountNo}</td>
                <td class="actions">
                    <a href="editPersonalInfo?id=${p.id}"><i class="fas fa-pen"></i></a>
                    <a href="viewPersonalInfo?id=${p.id}"><i class="fas fa-eye"></i></a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>
