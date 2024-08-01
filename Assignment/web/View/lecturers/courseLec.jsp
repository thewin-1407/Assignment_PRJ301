<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lecturer's Courses</title>
        <link rel="stylesheet" type="text/css" href="../CSS/coursesLec.css">

    </head>
    <body>
        <div class="header">
            <div>
                <a onclick="window.location.href = '../HomeLecturer'" class="home-link">Home</a>
            </div>
        </div>

        <h2>Lecturer's Courses</h2>

        <c:if test="${not empty requestScope.courses}">
            <table>
                <thead>
                    <tr>
                        <th>Course Name</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.courses}" var="course">
                        <tr>
                            <td><a href="viewclass?cid=${course.id}">${course.name}</a></td>
                            <td><button onclick="window.location.href = '../lecturers/grade?cid=${course.id}'">Grade Report</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty requestScope.courses}">
            <p class="empty-message">No courses available.</p>
        </c:if>
    </body>
</html>
