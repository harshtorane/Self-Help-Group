<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>User Dashboard</title></head>
<body>
    <jsp:include page="header.jsp"/>
    <h2>Welcome User, ${username} 🎉</h2>
    <a href="viewProfileForm">👤 View Profile</a> |
    <a href="viewData">📊 My Data</a>
    <jsp:include page="footer.jsp"/>
</body>
</html>
