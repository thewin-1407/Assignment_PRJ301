<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Edit Grade</title>
        <link rel="stylesheet" type="text/css" href="../CSS/examCourses.css">
    </head>
    <body>
        <div class="header">
            <div>
                <a onclick="window.location.href = '../HomeLecturer'" class="home-link">Home</a>
            </div>
        </div>

        <h2>Grading Editor</h2>

        <div class="container">
            <c:choose>
                <c:when test="${empty requestScope.exams}">
                    <c:if test="${not empty requestScope.courses}">
                        <form action="edit" method="POST">
                            <input type="hidden" name="lid" value="${param.lid}"/>
                            Course:
                            <select name="cid">
                                <c:forEach items="${requestScope.courses}" var="c">
                                    <option value="${c.id}">
                                        ${c.name}
                                    </option>
                                </c:forEach>
                            </select>
                            <br/><br/>
                            <input type="submit" value="Edit"/>
                        </form>
                    </c:if>
                </c:when>
                <c:otherwise>
                    <form action="score" method="GET">
                        <input type="hidden" name="cid" value="${param.cid}"/>
                        <div class="exam-list">
                            <c:forEach items="${requestScope.exams}" var="e">
                                <div class="exam-item">
                                    <input type="checkbox" name="eid" value="${e.id}" />
                                    ${e.assessment.name} :
                                    <fmt:formatNumber value="${e.assessment.weight * 100}" type="number" maxFractionDigits="0"/>% -
                                    (${fn:substring(e.from, 0, 10)} ${fn:substring(e.from, 11, 16)})
                                </div>
                            </c:forEach>
                        </div>
                        <br/>
                        <input type="submit" value="Take"/>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
