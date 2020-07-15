<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Lista użytkowników</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<%@ include file="../parts/header.jsp" %>
<section>
    <table>
        <tr>
            <th>Nazwa użytkownika</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.username}</td>
                <td><a href="/admin/delete/${user.id}">Usuń</a>
                    <a href="/admin/edit/${user.id}">Edytuj</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/user/add">Dodaj</a><a href="/">Cofnij</a>
</section>
<%@ include file="../parts/footer.jsp" %>
</body>
</html>
