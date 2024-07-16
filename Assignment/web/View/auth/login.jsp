<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="CSS/login.css">
    </head>
    <body>
        <div class="login-container">
            <h2>Login</h2>
            <c:if test="${not empty sessionScope.errorMessage}">
                <div class="error-message">${sessionScope.errorMessage}</div>
                <%
                    session.removeAttribute("errorMessage");
                %>
            </c:if>
            <form action="login" method="POST">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required/> <br/><br/>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required/> <br/><br/>
                <input type="submit" value="Login"/>
            </form>
        </div>
    </body>
</html>
