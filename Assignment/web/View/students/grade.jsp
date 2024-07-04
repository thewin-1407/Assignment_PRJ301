<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Student Grades</title>
        <!-- Add your CSS links or styles here -->
    </head>
    <body>
        <h1>Grades for Student</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Score</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="grade" items="${grades}">
                    <tr>
                        <td>${grade.score}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
