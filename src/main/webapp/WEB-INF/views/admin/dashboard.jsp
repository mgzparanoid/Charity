<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Admin Dashboard</title>

    <link rel="stylesheet" href="<c:url value="../resources/css/style.css"/>"/>
</head>
<body>
<%@ include file="../parts/header.jsp" %>
<h2>Admin dashboard</h2>

<div class="slogan container container--90">
    <h2>
        <div class="col">
            <li><a href="/admin/institutionManager"> Zarządzanie fundacjami</a></li>
        </div>
        <div class="col">
            <li><a href="/admin/adminManager"> Zarządzanie administratorami</a></li>
        </div>
        <div class="col">
            <li><a href="/admin/userManager"> Zarządzanie użytkownikami</a></li>
        </div>
    </h2>
</div>

<%@ include file="../parts/footer.jsp" %>
</body>
</html>
