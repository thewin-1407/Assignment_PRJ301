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
        <h2>Lecturer's Courses</h2>
        <c:if test="${not empty requestScope.courses}">
            <table>
                <thead>
                    <tr>
                        <th>Course Name</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.courses}" var="course">
                        <tr>
                            <td><a href="viewclass?cid=${course.id}">${course.name}</a></td>
                            <td><button onclick="location.href = 'http://localhost:1407/Assignment/lecturers/grade?cid=${course.id}'">Grade Report</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty requestScope.courses}">
            <p>No courses available.</p>
        </c:if>
        <br/>
        <a href="http://localhost:1407/Assignment/logout">Logout</a>
    </body>
</html>
