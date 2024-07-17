<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Courses</title>
        <!--<link rel="stylesheet" href="../CSS/coursesStu.css"/>-->
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
                background-color: rgb(33, 33, 33);
                color: white;
            }

            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
                background-color: rgb(33, 33, 33);
                padding: 10px;
            }

            .home-link {
                padding: 10px 20px;
                background-color: rgb(128, 128, 128);
                color: white;
                text-decoration: none;
                border-radius: 3px;
            }

            .home-link:hover {
                background-color: #D4D4D4;
            }

            .container {
                position: relative;
                width: 100%;
            }

            .subject-table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                margin-top: 20px;
                color: #000;
            }

            .subject-table th, .subject-table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .subject-table th {
                background-color: #555555;
                color: white;
            }

            .subject-table tr {
                cursor: pointer;
            }

            .subject-table tr:hover {
                background-color: #fff;
            }

            .subject-table td {
                color: black;
            }

            .subject-table td:hover {
                background-color: #D4D4D4;
            }

            .subject-table a {
                text-decoration: none;
                color: black;
                display: block;
                padding: 8px;
            }
        </style>
        <script>
            function goToCourse(courseId) {
                window.location.href = "viewclass?cid=" + courseId;
            }
        </script>
    </head>
    <body>

        <div class="header">
            <div>
                <a href="http://localhost:1407/Assignment/HomeStudent" class="home-link">Home</a>
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
