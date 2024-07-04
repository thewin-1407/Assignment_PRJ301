<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Grade Report</title>
        <link rel="stylesheet" type="text/css" href="../CSS/gradeStu.css">
    </head>
    <body>
        <h2>Student Grade Report</h2>

        <table>
            <thead>
                <tr>
                    <th class="ass">Assessment Name</th>
                    <th class="weight">Weight</th>
                    <th class="score">Score</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="assessment" items="${assessments}">
                    <tr>
                        <td class="ass">${assessment.name}</td>
                        <td class="weight"><fmt:formatNumber value="${assessment.weight * 100}" type="number" maxFractionDigits="0"/>%</td>
                        <td class="score">
                            <c:forEach var="grade" items="${grades}">
                                <c:if test="${grade.exam.assessment.id eq assessment.id}">
                                    ${grade.score}
                                </c:if>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>

                <tr class="total-row">
                    <td><strong>Total</strong></td>
                    <td></td>
                    <td>
                        <c:set var="totalScore" value="0.0" />
                        <c:set var="totalWeight" value="0.0" />
                        <c:forEach var="assessment" items="${assessments}">
                            <c:forEach var="grade" items="${grades}">
                                <c:if test="${grade.exam.assessment.id eq assessment.id}">
                                    <c:set var="weightedScore" value="${grade.score * assessment.weight}" />
                                    <c:set var="totalScore" value="${totalScore + weightedScore}" />
                                    <c:set var="totalWeight" value="${totalWeight + assessment.weight}" />
                                </c:if>
                            </c:forEach>
                        </c:forEach>
                        <c:if test="${totalWeight ne 0.0}">
                            ${totalScore / totalWeight}
                        </c:if>
                    </td>
                </tr>

                <tr class="process-row">
                    <td><strong>Process</strong></td>
                    <td></td>
                    <td class="<c:choose>
                            <c:when test='${empty grades or totalWeight eq 0.0}'>studying
                            </c:when>
                            <c:when test='${totalScore / totalWeight >= 5.0}'>pass
                            </c:when>
                            <c:otherwise>not-pass
                            </c:otherwise>
                        </c:choose>">
                        <c:choose>
                            <c:when test='${empty grades or totalWeight eq 0.0}'>Studying</c:when>
                            <c:when test='${totalScore / totalWeight >= 5.0}'>Pass</c:when>
                            <c:otherwise>Not Pass</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </tbody>
        </table>
        <br><br/>   
        <a href="grade">Subjects for Student</a> <br><br/>
        <a href="http://localhost:1407/Assignment/HomeStudent">Home</a>

    </body>
</html>
