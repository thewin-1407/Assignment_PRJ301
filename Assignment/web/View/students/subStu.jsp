<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Subjects</title>
        <link rel="stylesheet" type="text/css" href="../CSS/subStu.css">
        <script>
            window.onload = function () {
                var subjects = document.querySelectorAll('li');
                subjects.forEach(function (subject) {
                    subject.addEventListener('click', function () {
                        var subId = this.getAttribute('data-subid');
                        window.location.href = 'report?subid=' + encodeURIComponent(subId);
                    });
                });
            };
        </script>
    </head>
    <body>
        <h2>Subjects for Student</h2>

        <ul>
            <c:forEach var="sub" items="${subs}">
                <li data-subid="${sub.id}">${sub.name}</li>
                </c:forEach>
        </ul>
    </body>
</html>