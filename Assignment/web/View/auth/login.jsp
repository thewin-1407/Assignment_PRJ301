<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="login" method="POST">
            Username: <input type="text" name="username" required/> <br/><br/>
            Password: <input type="password" name="password" required/> <br/><br/>
            <input type="submit" value="Login"/>
        </form>
        <br/>
        <% if (request.getAttribute("errorMessage") != null) { %>
        <div><%= request.getAttribute("errorMessage") %></div>
        <% } %>
    </body>
</html>
