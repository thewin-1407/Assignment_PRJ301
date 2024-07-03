<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                        <th>
                            ${assessment.name} <br> 
                            <fmt:formatNumber value="${assessment.weight * 100}" type="number" maxFractionDigits="0"/>%
                        </th>
                    </c:forEach>
                    <th>Total</th>
                    <th>Process</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${students}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.name}</td>
                        <c:set var="total" value="0" />
                        <c:set var="allGradesPresent" value="true" />
                        <c:forEach var="assessment" items="${assessments}">
                            <c:set var="grade" value="${grades[student.id][assessment.id]}" />
                            <td>
                                <c:choose>
                                    <c:when test="${grade != null}">
                                        ${grade.score}
                                        <c:set var="total" value="${total + grade.score * assessment.weight}" />
                                    </c:when>
                                    <c:otherwise>

                                        <c:set var="allGradesPresent" value="false" />
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </c:forEach>
                        <td>
                            <fmt:formatNumber value="${total}" type="number" maxFractionDigits="2" />
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${allGradesPresent}">
                                    <c:choose>
                                        <c:when test="${total >= 5}">
                                            Pass
                                        </c:when>
                                        <c:otherwise>
                                            Not Pass
                                        </c:otherwise>
                                    </c:choose>
                                </c:when>
                                <c:otherwise>
                                    Studying
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br/>
        <a href="mycourses">Back to Courses</a> <br/><br/>
        <a href="http://localhost:1407/Assignment/HomeLecturer">Home</a> <br/><br/>
        <a href="http://localhost:1407/Assignment/logout">Logout</a>
    </body>
</html>
