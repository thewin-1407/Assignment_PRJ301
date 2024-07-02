<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lecturer's Courses</title>
        <style>
            table {
                border-collapse: collapse;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h2>Lecturer's Courses</h2>
        <c:if test="${not empty requestScope.courses}">
            <table>
                <thead>
                    <tr>
                        <th>Course Name</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.courses}" var="course">
                        <tr>
                            <td><a href="viewclass?cid=${course.id}">${course.name}</a></td>
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
