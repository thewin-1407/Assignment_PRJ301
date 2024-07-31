<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Student Management System</title>
        <link rel="stylesheet" type="text/css" href="CSS/homeAdmin.css">
        <script src="JavaScript/home.js"></script>
    </head>
    <body>
        <header>
            <h1>Student Management System</h1>
        </header>
        <div class="header-content">
            <h2>Welcome Admin!</h2>
            <div class="user-box" onclick="toggleLogoutButton()" aria-label="User menu">
                <span id="username">${sessionScope.user.username}</span>
                <div id="logoutButton" class="logout-button">
                    <button onclick="window.location.href = 'logout'">Logout</button>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="box" onclick="redirectTo('https://vn.shp.ee/w6u512b')" aria-label="Grade Report">Grade Report</div>
        </div>
    </body>
</html>
