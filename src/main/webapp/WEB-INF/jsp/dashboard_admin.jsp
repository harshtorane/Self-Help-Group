<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Admin Dashboard</title></head>
<body>
    <jsp:include page="header.jsp"/>
    <h2>Welcome Admin, ${username} 🚀</h2>
    <a href="register.jsp">➕ Add User</a> |
    <a href="viewData">👥 View All Users</a> |
    <a href="deleteUserForm.jsp">❌ Delete User</a>
    <jsp:include page="footer.jsp"/>
</body>
</html>
