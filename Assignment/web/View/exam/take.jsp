<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Score Editing</title>
        <link rel="stylesheet" type="text/css" href="../CSS/editScore.css">
        <script src="Script/validateScore.js"></script>

    </head>
    <body>
        <a href="http://localhost:1407/Assignment/HomeLecturer">Home</a> <br/><br/>
        <form action="take" method="POST">
            <table border="1px">
                <tr>
                    <td></td>
                    <c:forEach items="${requestScope.exams}" var="e">
                        <td>
                            ${e.assessment.name} (<fmt:formatNumber value="${e.assessment.weight * 100}" type="number" maxFractionDigits="0"/>%) <br/>
                            ${fn:substring(e.from, 0, 16)}
                        </td>
                    </c:forEach>
                </tr>
                <c:forEach items="${requestScope.students}" var="s">
                    <tr>
                        <td>${s.name}</td>
                        <c:forEach items="${requestScope.exams}" var="e">
                            <td>
                                <input type="text" name="score${s.id}_${e.id}"
                                       <c:forEach items="${requestScope.grades}" var="g">
                                           <c:if test="${e.id eq g.exam.id and s.id eq g.student.id}">
                                               value="${g.score}"
                                           </c:if>
                                       </c:forEach>
                                       />
                                <input type="hidden" name="gradeid" value="${s.id}_${e.id}"/>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
            <br/>
            <input type="hidden" name="cid" value="${param.cid}" />
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
