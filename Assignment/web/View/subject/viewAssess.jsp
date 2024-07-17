<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Assessments</title>
        <script src="../JavaScript/viewAssesments.js"></script> 
        <link rel="stylesheet" href="../CSS/assesment.css"/>
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
