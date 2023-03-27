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
    <title>Disciplines Page</title>
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
<div class="navP">
    <nav>
        <a href="/">На главную</a>
    </nav>
    <p class="p2">Список дисциплин</p>
</div>

<div class="tableButton">
    <div class="Table3">
        <table class="table3" border="1">
            <tr>
                <c:if test="${role eq 1}"> <%--видимость кнопок только администратором--%>
                <th></th>
                </c:if>
                <th>Наименование дисциплины</th>
            </tr>
            <c:forEach items="${disciplines}" var="d"> <%--Цикл для заполнения таблицы--%>
            <tr>
                <form>
                    <label>
                        <c:if test="${role eq 1}"> <%--видимость кнопок только администратором--%>
                        <td><input type="checkbox" value="${d.id}" name="disciplineId"></td>
                        </c:if>
                        <td>${d.name}</td>
                    </label>
                </form>
            </tr>
            </c:forEach>
        </table>
    </div>
    <c:if test="${role eq 1}"> <%--видимость кнопок только администратором--%>
        <div class="button3">
            <div class="button31"><a class="button311" href="/discipline_create"><button class="button3111">Создать дисциплину...</button></a></div>
            <div class="button32"><a class="button322"><button onclick="modifyDiscipline()" class="button3222">Модифицировать выбранную дисциплину...</button></a></div>
            <div class="button33"><a class="button333"><button onclick="deleteDiscipline()" class="button3333">Удалить выбранную дисциплину...</button></a></div>
        </div>
    </c:if>
</div>
</body>
<form action="/discipline_modify" method="get" id="modifyFormDiscipline">
    <input type="hidden" name="idsForModifyDiscipline" id="idsForModifyDiscipline">
</form>
<form action="/discipline_delete" method="post" id="deleteFormDiscipline">
    <input type="hidden" name="idsForDeleteDiscipline" id="idsForDeleteDiscipline">
</form>
</html>