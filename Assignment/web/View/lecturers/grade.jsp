<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grade Report</title>
    </head>
    <body>
        <h1>Grade Report</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Student ID</th>
                    <th>Student Name</th>
                        <c:forEach var="assessment" items="${assessments}">
                        <th>${assessment.name} (Weight: ${assessment.weight})</th>
                        </c:forEach>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <c:set var="total" value="0" />
                        <c:forEach var="assessment" items="${assessments}">
                            <c:set var="grade" value="${grades[student.id][assessment.id]}" />
                            <td>
                                <c:choose>
                                    <c:when test="${grade != null}">
                                        ${grade.score}
                                        <c:set var="total" value="${total + grade.score * assessment.weight}" />
                                    </c:when>
                                    <c:otherwise>
                                        -
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </c:forEach>
                        <td>${total}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="mycourses">Back to Courses</a>
    </body>
</html>
