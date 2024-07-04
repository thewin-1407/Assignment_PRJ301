<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Grades</title>
    </head>
    <body>
        <h1>Grades for Subject</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Assessment Name</th>
                    <th>Weight</th>
                    <th>Score</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="grade" items="${grades}">
                <tr>
                    <td>${grade.exam.assessment.name}</td>
                    <td>${grade.exam.assessment.weight}</td>
                    <td>${grade.score}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
