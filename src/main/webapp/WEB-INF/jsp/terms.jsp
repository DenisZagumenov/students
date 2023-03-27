<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../resources/css/style.css">
    <script src="../../resources/js/function.js" ></script>
    <title>Terms Page</title>
</head>
<body>
<span class="header">
    <h1>Система управления студентами и их успеваемостью</h1>
        <div class="Login">
            <c:choose>
                <c:when test="${isAuthorised eq true}">
                    <p class="Hello">Привет, ${login}</p>
                    <a class="Logout" href="/logout">Logout</a>
                </c:when>
                <c:otherwise>
                    <a class="Logout" href="/login">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
</span>
<header>
    <nav>
        <a href="/">На главную</a>
    </nav>
</header>

<div class="Select1">
    <form action="/terms">
        <label>
            Выбрать семестр
            <select class="select1" name="termId">
                <c:forEach items="${terms}" var="t"> <%--При первом открытии страницы показать первый семестр, затем запомнить выбранный--%>
                    <c:choose>
                        <c:when test="${t.id == selectedTerm.id}">
                            <option selected value="${t.id}">${t.name} </option>
                        </c:when>
                        <c:otherwise>
                            <option value="${t.id}">${t.name} </option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </label>
        <button class="button1">Выбрать</button>
        <input type="hidden" name="selectedTerm" value="${selectedTerm.id}"/>
    </form>
    <input type="hidden" name="iDselectedTerm" value="${selectedTerm.id}"/>
    <br>
    <p>Длительность семестра: ${duration}</p>
</div>

<div class="tableButton1">
    <div class="Table4">
        <table class="table4" border="1">
            <caption>Список дисциплин семестра</caption>
            <tr>
                <th>Наименование дисциплины</th>
            </tr>
            <c:forEach items="${disciplines}" var="d">
                <tr>
                    <form>
                        <label>
                            <td>${d.name}</td>
                        </label>
                    </form>
                </tr>
            </c:forEach>
        </table>
    </div>
    <c:if test="${role eq 1}"> <%--видимость кнопок только администратором--%>
        <div class="button5">
            <div class="button51"><a class="button511">
                <form action="/term_create" method="get">
                    <button class="button5111">Создать семестр...</button>
                </form>
            </a></div>
            <form action="/term_modify" method="get">
            <div class="button52"><a class="button522">
                <button class="button5222">Модифицировать текущий семестр...</button>
                <input type="hidden" name="idTerm" value="${selectedTerm.id}"/>
            </a></div>
            </form>
            <div class="button53"><a class="button533">
                <form action="/term_delete" method="post">
                    <button class="button5333">Удалить текущий семестр...</button>
                        <input type="hidden" name="idTerm" value="${selectedTerm.id}"/>
                </form>
            </a></div>
        </div>
    </c:if>
</div>
<form action="/term_delete" method="post" id="deleteTerm">
    <input type="hidden" name="idForDeleteTerm" id="idForDeleteTerm">
</form>
</body>
</html>