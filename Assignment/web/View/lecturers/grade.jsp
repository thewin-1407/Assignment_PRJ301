<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="student" items="${students}">
        <tr>
            <td>${student.name}</td>
            <td>${student.id}</td>
            <td>
                <c:forEach var="grade" items="${studentGrades[student.id]}">
                    <div>Exam ${grade.exam.id}: ${grade.score}</div>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
</body>
</html>
