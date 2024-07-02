<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Management System</title>
        <link rel="stylesheet" type="text/css" href="CSS/HomeLecturer.css">
        <script src="Script/homeLecturer.js"></script>
    </head>
    <body>
        <header>
            <h1>Student Management System</h1>
        </header>

        <div>
            <ul>
                <c:choose>
                    <c:when test="${sessionScope.user ne null}">
                        <li class="dropdown" onclick="toggleDropdown(this)">
                            <a href="#">${sessionScope.user.username}</a>
                            <ul id="dropdownContent" class="dropdown-content">
                                <li><a href="http://localhost:1407/Assignment/logout">Logout</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <a href="http://localhost:1407/Assignment/login">Login</a>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>

        <div class="content">

            <h2>Welcome to Student Management System</h2>
            <br/>
            <li><a href="http://localhost:1407/Assignment/exam/lecturer">Edit Grade</a></li><br/>
            <li><a href="http://localhost:1407/Assignment/lecturers/mycourses">My Courses</a></li>
        </div>

    </body>
</html>
