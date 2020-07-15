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
    <title>Charity</title>

    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>
</head>
<body>
<%--dołączenie headeru--%>
<%@ include file="parts/header.jsp" %>
<%--To się pojawi wyłącznie po zalogowaniu--%>

<sec:authorize access="isAuthenticated()">
    <h2>Witaj, <sec:authentication property="name"/></h2>

    <form action="<c:url value="/logout"/>" method="post">
        <input type="submit" value="Wyloguj">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</sec:authorize>

<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${sumofbags}</em>

            <h3>Oddanych worków</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum
                tempora!</p>
        </div>

        <div class="stats--item">
            <em>${sumofdonations}</em>
            <h3>Przekazanych darów</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>

    </div>
</section>

<section class="steps">
    <h2>Wystarczą 4 proste kroki</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Wybierz rzeczy</h3>
            <p>ubrania, zabawki, sprzęt i inne</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Spakuj je</h3>
            <p>skorzystaj z worków na śmieci</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Zdecyduj komu chcesz pomóc</h3>
            <p>wybierz zaufane miejsce</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Zamów kuriera</h3>
            <p>kurier przyjedzie w dogodnym terminie</p>
        </div>
    </div>

    <a href="#" class="btn btn--large">Załóż konto</a>
</section>

<section class="about-us">
    <div class="about-us--text" id="about-us">
        <h2>O nas</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value="resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value="resources/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section class="help">
    <h2>Komu pomagamy?</h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>W naszej bazie znajdziesz listę zweryfikowanych Fundacji, z którymi współpracujemy.
            Możesz sprawdzić czym się zajmują.</p>

        <ul class="help--slides-items">
            <li>
                <c:forEach items="${institutions}" var="institution" varStatus="counter">
                    <c:if test="${counter.count%2 == 1}">
                        <div class="col">
                            <div class="title">Fundacja: ${institution.name}</div>
                            <div class="subtitle">Cel i misja: ${institution.description}</div>
                        </div>
                    </c:if>
                </c:forEach>
            </li>

            <li>
                <c:forEach items="${institutions}" var="institution" varStatus="counter">
                    <c:if test="${counter.count%2 == 0}">
                        <div class="col">
                            <div class="title">Fundacja: ${institution.name}</div>
                            <div class="subtitle">Cel i misja: ${institution.description}</div>
                        </div>
                    </c:if>
                </c:forEach>

            </li>
<%--
  <table>
  ...
<c:forEach items="${institutions}" var="institution" varStatus="counter">
    <tr>
      <td><div class="title">Fundacja: ${institution.name}</div></td>
      ...
      <td><div class="subtitle">Cel i misja: ${institution.description}</div></td>
    </tr>
   </div>
  </c:forEach>
</table>
--%>

        </ul>
    </div>

</section>

<%--Tutaj był footer--%>
<%@ include file="parts/footer.jsp" %>
<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
