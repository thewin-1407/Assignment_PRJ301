<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Management System</title>
        <link rel="stylesheet" type="text/css" href="CSS/homeLecturer.css">
        <script src="JavaScript/home.js"></script>
    </head>
    <body>
        <header>
            <h1>Student Management System</h1>
        </header>

        <div class="home">
            <h2>Welcome Lecturer!</h2>

            <ul>
                <c:choose>
                    <c:when test="${sessionScope.user ne null}">
                        <li class="dropdown" onclick="toggleDropdown(this)">
                            <a href="#">${sessionScope.user.username}</a>
                            <ul id="dropdownContent" class="dropdown-content">
                                <a href="http://localhost:1407/Assignment/logout">Logout</a>
                            </ul>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>

        <div class="content">
            <li><a href="http://localhost:1407/Assignment/exam/lecturer">Edit Grade</a></li>
            <li><a href="http://localhost:1407/Assignment/lecturers/mycourses">My Courses</a></li>
            <li><a href="http://localhost:1407/Assignment/lecturers/subject">Subject</a></li>
        </div>
    </body>
</html>
