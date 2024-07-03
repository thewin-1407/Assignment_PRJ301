<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Courses</title>
        <link rel="stylesheet" type="text/css" href="../CSS/coursesStu.css">
    </head>
    <body>
        <h2>My Courses</h2>
        <table>
            <thead>
                <tr>
                    <th>Course Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr>
                        <td><a href="viewclass?cid=${course.id}">${course.name}</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br/>
        <a href="http://localhost:1407/Assignment/HomeStudent">Home</a>
    </body>
</html>
