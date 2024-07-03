<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Subject List</title>
        <link rel="stylesheet" type="text/css" href="../CSS/subject.css">
        <script>
            function goToAssessment(subjectId, event) {
                var target = event.target || event.srcElement;
                if (target.cellIndex === 1) {
                    window.location.href = '/Assignment/subject/assessment?subid=' + subjectId;
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Subject List</h1>

            <table class="subject-table">
                <thead>
                    <tr>
                        <th>Subject ID</th>
                        <th>Subject Name</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="subject" items="${subject}">
                        <tr onclick="goToAssessment(${subject.id}, event)" style="cursor: pointer;">
                            <td>${subject.id}</td>
                            <td>${subject.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <br/>
        <a href="http://localhost:1407/Assignment/HomeLecturer">Home</a> <br/><br/>
        <a href="http://localhost:1407/Assignment/logout">Logout</a>
    </body>
</html>
