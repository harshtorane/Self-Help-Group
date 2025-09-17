<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="background:purple; color:white; padding:15px; font-size:20px; display:flex; justify-content:space-between; align-items:center;">
    <div>
        <b>Self Help Group Portal</b>
    </div>
    <div>
        <a href="<c:url value='/'/>" style="color:white; margin-right:20px; text-decoration:none;">Home</a>
        <a href="<c:url value='/viewProfileForm'/>" style="color:white; margin-right:20px; text-decoration:none;">View Profile</a>
        <a href="<c:url value='/register'/>" style="color:white; margin-right:20px; text-decoration:none;">Register new Member</a>
        <a href="<c:url value='/viewData'/>" style="color:white; margin-right:20px; text-decoration:none;">View Data</a>
        <a href="<c:url value='/logout'/>" style="color:white; text-decoration:none;">Logout</a>
    </div>
</div>
