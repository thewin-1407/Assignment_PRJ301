<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Assessments</title>
        <script src="../JavaScript/viewAssesments.js"></script> 
        <!--<link rel="stylesheet" type="text/css" href="../CSS/assesment.css">-->
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
            h2 {
                color: white;
            }
            a {
                color: white;
                text-decoration: none;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                margin-top: 20px;
                color: #000;
            }
            table, th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #555555;
                color: white;
            }
            .back{
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div>
                <a href="#" onclick="navigateHomeofAssessments()" class="home-link">Home</a>
            </div>
        </div>

        <h2>Assessments</h2>
        <br/>
        <a href="#" onclick="navigateBackToSubjectList()" class="back">Back to Subject List</a><br/>

        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Weight</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="assessment" items="${assesments}">
                    <tr>
                        <td>${assessment.name}</td>
                        <td><fmt:formatNumber value="${assessment.weight * 100}" type="number" maxFractionDigits="0"/>%</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br/>
    </body>
</html>
