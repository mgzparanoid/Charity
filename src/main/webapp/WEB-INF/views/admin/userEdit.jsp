<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formularz edycji użytkownika</title>
</head>
<body>
<form:form method="post" modelAttribute="user">
    <form:hidden path="id"/>
    <div>
        <label>Nazwa użytkownika: <form:input path="username"/></label> <%--        <form:errors path="username"/>--%>
    </div>
    <div>
            <form:hidden path="password"/></label><%--        <form:errors path="password"/>--%>
    </div>
    <input type="submit" value="Save">
</form:form>
</body>
</html>
