<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Edycja instytucji</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<h2>Zmień dane instytucji:</h2>
<form:form action="/admin/institutionEdit/${institutionToEdit.id}" method="post" modelAttribute="institutionToEdit">
    <form:hidden path="id"/>
    <div class="form-group form-group--inline">
        <label>
            Wpisz nazwę fundacji: <form:input path="name"/>
        </label>
    </div>
    <div class="form-group form-group--inline">
        <label>
            Wpisz opis fundacji: <form:textarea path="description"/>
        </label>
    </div>
    <div class="form-group form-group--buttons">
        <button type="submit" class="btn">Potwierdzam</button>
        <a href="/admin/institutionManager">
            <button type="button" class="btn">Wstecz</button>
        </a>
    </div>
</form:form>
</section>

<script src="<c:url value="/resources/js/app.js"/>"></script>
</body>
</html>
