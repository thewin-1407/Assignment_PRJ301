<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class View</title>
        <link rel="stylesheet" type="text/css" href="../CSS/viewclassLec.css">
    </head>
    <body>
        <div class="header">
            <div>
                <a onclick="window.location.href = '../HomeLecturer'" class="home-link">Home</a>
            </div>
        </div>

        <h2>Class Student List</h2>

        <br/>
        <a href="mycourses" class="back">Back to Courses</a> <br/>

        <table>
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Student Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br/>
    </body>
</html>
