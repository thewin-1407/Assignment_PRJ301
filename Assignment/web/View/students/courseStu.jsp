<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Courses</title>
        <link rel="stylesheet" href="../CSS/coursesStu.css"/>
        <script>
            function goToCourse(courseId) {
                window.location.href = "viewclass?cid=" + courseId;
            }
        </script>
    </head>
    <body>

        <div class="header">
            <div>
                <a onclick="window.location.href = '../HomeStudent'" class="home-link">Home</a>
            </div>
        </div>

        <h2>My Courses</h2>

        <table class="subject-table">
            <thead>
                <tr>
                    <th>Course Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${courses}">
                    <tr onclick="goToCourse(${course.id});" style="cursor: pointer;">
                        <td><a href="javascript:void(0);">${course.name}</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br/>
    </body>
</html>
