<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Formularz dodawania nowego użytkownika</title>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<%@ include file="../parts/header.jsp" %>

<%--    Tutaj przez Model --%>
<%--    <form:form method="post" modelAttribute="registerUser">--%>
<%--        <form:input type="username" name="username" placeholder="username" path="username"/>--%>
<%--        <form:input type="password" name="password" placeholder="password" path="password"/>--%>
<%--        <form:input type="password" name="password2" placeholder="Enter password again" path="passwordConfirm"/>--%>

<%--        <div class="form-group form-group--buttons">--%>
<%--            <a href="login.html" class="btn btn--without-border">Zaloguj się</a>--%>
<%--            <button class="btn" type="submit">Załóż konto</button>--%>
<%--        </div>--%>
<%--    </form:form>--%>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form method="post" modelAttribute="user">
        <form:hidden path="id"/>
        <div class="form-group">
            <form:input path="username" placeholder="username"/>
        </div>
        <div class="form-group">
            <form:password path="password" placeholder="password"/>
        </div>
        <%--            <div class="form-group">--%>
        <%--                <input type="password" name="password2" placeholder="Powtórz hasło" />--%>
        <%--            </div>--%>

        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>

<%@ include file="../parts/footer.jsp" %>
>
</body>
</html>
