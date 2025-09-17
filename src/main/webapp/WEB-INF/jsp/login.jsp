<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f9f9f9;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-container {
        background: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        width: 350px;
        text-align: center;
    }

    .login-container h1 {
        color: #333;
        margin-bottom: 20px;
    }

    .success { 
        color: green; 
        text-align: center; 
        margin-bottom: 10px;
    }

    .error { 
        color: red; 
        text-align: center; 
        margin-bottom: 10px;
    }

    .login-container input[type="text"],
    .login-container input[type="password"] {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    .login-container input[type="submit"] {
        background: purple;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 8px;
        width: 100%;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s ease;
    }

    .login-container input[type="submit"]:hover {
        opacity: 0.8;
    }
</style>
</head>

<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="" >
    <div class="login-container">
        <h1>Login Form</h1>

        <p class="success">${successMsg}</p>
        <p class="error">${errMsg}</p>

        <form action="login" method="post">
            <input type="text" name="userName" placeholder="Enter User Name Here"><br>
            <input type="password" name="pwd" placeholder="Enter Password Here"><br>
            <input type="submit" value="Login Here">
        </form>
        
        
    </div>
    <script type="text/javascript">
    window.history.forward();
    function noBack() {
        window.history.forward();
    }
</script>
</body>
</html>
