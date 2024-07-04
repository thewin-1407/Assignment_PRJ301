<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Class Details</title>
        <link rel="stylesheet" type="text/css" href="../CSS/viewclassStu.css">
    </head>
    <body>
        <h2>Class Details</h2>

        <h3 class="lecturer">Lecturer:</h3>
        <div class="lecturer-name">${lecturer.name}</div>

        <h3>Students:</h3>
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
        <a href="mycourses">Back to Courses</a> <br/><br/>
        <a href="http://localhost:1407/Assignment/HomeStudent">Home</a> <br/><br/>
        <a href="http://localhost:1407/Assignment/logout">Logout</a>
    </body>
</html>
