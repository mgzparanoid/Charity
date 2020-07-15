<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Zarządzanie instytucjami</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<%@include file="parts/navbar.jsp"%>
<div class="slogan container container--90">
    <ul class="help--slides-items">
        <c:forEach items="${institutions}" var="userDonation">
        <li>
            <div class="col">
                <div class="title">${userDonation.name}</div>
                <div class="subtitle">${userDonation.description}</div>
                <div>
                    <a href="/admin/institutionEdit/${userDonation.id}">Edytuj</a>
                    <a href="/admin/institutionDelete/${userDonation.id}">Usuń</a></div>
            </div>
        </li>
        </c:forEach>
        <li>
            <div class="btn"><a href="/admin/instAdd">Dodaj fundację</a></div>
            <div class="btn"><a href="/admin/panel">Wstecz</a></div>
        </li>
</div>
</body>
</html>
