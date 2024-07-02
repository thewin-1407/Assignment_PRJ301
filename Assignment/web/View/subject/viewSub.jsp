<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Subject List</title>
        <link rel="stylesheet" type="text/css" href="../CSS/subject.css">
        <script>
            function goToAssessment(subjectId) {
                window.location.href = '/assessment?subid=' + subjectId;
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
                    <!-- Sử dụng forEach để lặp qua danh sách subjects -->
                    <c:forEach var="subject" items="${subject}">
                        <tr onclick="goToAssessment(${subject.id})" style="cursor: pointer;">
                            <td>${subject.id}</td>
                            <td>${subject.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
