<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Subject List</title>
        <script src="../JavaScript/viewAssesments.js"></script> 
        <!--<link rel="stylesheet" type="text/css" href="../CSS/subject.css">-->
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

            .subject-table th, .subject-table td, .subject-table th {
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
        </style>
    </head>
    <body>
        <div class="header">
            <div>
                <a href="#" onclick="navigateHomeofSubject()" class="home-link">Home</a>
            </div>
        </div>

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
                        <tr style="cursor: pointer;">
                            <td>${subject.id}</td>
                            <td onclick="goToAssessment(${subject.id}, event)">${subject.name}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
