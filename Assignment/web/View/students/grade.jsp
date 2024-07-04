<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Grade Report</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            table, th, td {
                border: 1px solid black;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            .total-row {
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <h2>Student Grade Report</h2>

        <table>
            <thead>
                <tr>
                    <th>Assessment Name</th>
                    <th>Weight</th>
                    <th>Score</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="assessment" items="${assessments}">
                    <tr>
                        <td>${assessment.name}</td>
                        <td>${assessment.weight}</td>
                        <td>
                            <c:forEach var="grade" items="${grades}">
                                <c:if test="${grade.exam.assessment.id eq assessment.id}">
                                    ${grade.score}
                                </c:if>
                            </c:forEach>
                        </td>
                    </tr>
                </c:forEach>

                <!-- Total Row -->
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
                        <c:if test="${totalWeight ne 0}">
                            ${totalScore / totalWeight}
                        </c:if>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
