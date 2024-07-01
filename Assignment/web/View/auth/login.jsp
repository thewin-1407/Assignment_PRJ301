<%-- 
    Document   : login
    Created on : Jun 26, 2024, 10:26:35 PM
    Author     : sonnt-local
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="POST">
            Username <input type="text" name="username"/> <br/>
            Password <input type="password" name="password"/> <br/><br/>
            <input type="submit" value="login"/>
        </form>
    </body>
</html>
