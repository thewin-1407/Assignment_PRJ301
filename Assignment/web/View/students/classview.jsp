<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Class Details</title>
        <link rel="stylesheet" href="../CSS/viewclassStu.css"/>
    </head>
    <body>
        <div class="header">
            <div>
                <a onclick="window.location.href = '../HomeStudent'" class="home-link">Home</a>
            </div>
        </div>

        <h2>Class Details</h2>

        <br/>
        <a href="mycourses" class="back">Back to Courses</a> <br/>
        <h3 class="lecturer-name">Lecturer:</h3>
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
    </body>
</html>
